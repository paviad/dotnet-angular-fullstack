import { NgModule, Inject, Optional } from '@angular/core';
import { ServerModule, ServerTransferStateModule } from '@angular/platform-server';

import { AppModule } from './app.module';
import { AppComponent } from './app.component';
import { BackendState, BACKEND_STATE_KEY, BACKEND_STATE, DefaultBackendState } from './backend-state';
import { TransferState } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  imports: [
    AppModule,
    ServerModule,
    ServerTransferStateModule,
    HttpClientModule,
  ],
bootstrap: [AppComponent],
})
export class AppServerModule {
  constructor(@Optional() @Inject(BACKEND_STATE) backendState: BackendState, ssrState: TransferState) {
    ssrState.set(BACKEND_STATE_KEY, backendState || DefaultBackendState);
  }
}

export { BackendState, BACKEND_STATE } from './backend-state';
