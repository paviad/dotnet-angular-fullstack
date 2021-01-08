import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BackendState } from './backend-state';

@Injectable({
  providedIn: 'root'
})
export class SecuredService {

  constructor(
    private backendState: BackendState,
    private http: HttpClient) { }

  private url(api: string) {
    return `${this.backendState.deployment.api}secured/${api}`;
  }

  getData(): Observable<string> {
    return this.http.get(this.url('GetData'), { responseType: 'text' });
  }
}

