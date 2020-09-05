import { Component } from '@angular/core';
import { User } from 'oidc-client';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'ClientApp';
  user$: Observable<User>;

  constructor(private auth: AuthService) {
    this.user$ = auth.user$;
   }

  login() {
    this.auth.login();
  }

  logout() {
    this.auth.logout();
  }
}
