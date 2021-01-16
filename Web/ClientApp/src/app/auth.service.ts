import { Injectable, Inject, PLATFORM_ID } from '@angular/core';
import { UserManager, User, UserManagerSettings } from 'oidc-client';
import { from, Observable, ReplaySubject, Subject, of } from 'rxjs';
import { map } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { isPlatformServer } from '@angular/common';
import { Router } from '@angular/router';
import { BackendState } from './backend-state';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  config: UserManagerSettings = {
    authority: this.backendState.deployment.authority,
    client_id: 'interactive',
    client_secret: '49C1A7E1-0C79-4A89-A3D6-A37998FB86B0',
    redirect_uri: `${this.backendState.deployment.web}callback`,
    response_type: "code",
    scope: "openid profile email api",
    post_logout_redirect_uri: `${this.backendState.deployment.web}`,
    loadUserInfo: true,
    automaticSilentRenew: true,
    silent_redirect_uri: `${this.backendState.deployment.web}silent-renew.html`,
  };

  private mgr: UserManager;
  private pUser = new ReplaySubject<User>(1);
  user$: Observable<User> = this.pUser.asObservable();
  silentRenew$ = new Subject<boolean>();

  constructor(
    private http: HttpClient,
    private backendState: BackendState,
    @Inject(PLATFORM_ID) private platformId,
    private router: Router) {

    if (isPlatformServer(platformId)) {
      return;
    }
    this.mgr = new UserManager(this.config);
    this.signinSilent();
    this.refreshUser();
    window['silentRenew$'] = this.silentRenew$;
    this.silentRenew$.subscribe(r => {
      this.refreshUser();
    });
  }

  getUser() {
    if (isPlatformServer(this.platformId)) {
      return of(null);
    }
    return from(this.mgr.getUser());
  }

  loginGoogle(selectAccount = false) {
    this.mgr.signinRedirect({
      acr_values: `idp:Google${selectAccount ? ' prompt:select_account' : ''}`,
    });
  }

  login() {
    this.mgr.signinRedirect({ state: window.location.pathname });
  }

  logout() {
    this.mgr.signoutRedirect();
  }

  refreshUser() {
    this.getUser().subscribe(r => {
      return this.pUser.next(r);
    });
  }

  signinSilent() {
    this.mgr.signinSilent().then(r => this.pUser.next(r), err => console.debug('signinSilent failed', err));
  }

  callback() {
    if (isPlatformServer(this.platformId)) {
      return;
    }
    this.mgr.signinRedirectCallback().then(user => {
      this.refreshUser();
      this.router.navigateByUrl(user.state);
    }).catch(e => {
      console.error(e);
    });
  }

  getAccessToken() {
    return this.getUser().pipe(map(r => r && r.access_token));
  }
}
