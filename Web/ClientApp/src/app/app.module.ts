import { BrowserModule, BrowserTransferStateModule, TransferState } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { BackendState, BACKEND_STATE_KEY, DefaultBackendState } from './backend-state';
import { CallbackComponent } from './callback/callback.component';

let currentBackendState: BackendState;

@NgModule({
  declarations: [
    AppComponent,
    CallbackComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'serverApp' }),
    HttpClientModule,
    BrowserTransferStateModule,
    AppRoutingModule
  ],
  providers: [
    { provide: BackendState, useFactory: () => currentBackendState }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
  constructor(ssrState: TransferState) {
    currentBackendState = ssrState.get<BackendState>(BACKEND_STATE_KEY, DefaultBackendState);
  }
}
