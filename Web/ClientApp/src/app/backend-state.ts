import { InjectionToken, Injectable, Inject } from '@angular/core';
import { makeStateKey } from '@angular/platform-browser';

@Injectable()
export class BackendState {
    mobile: boolean;
    deployment: {
        web: string;
        authority: string;
        api: string;
    };
    antiForgeryToken: {
        requestToken?: string;
        formFieldName?: string;
        headerName?: string;
        cookieToken?: string;
    };
}

export const BACKEND_STATE = new InjectionToken<BackendState>('backendState');

export const BACKEND_STATE_KEY = makeStateKey('backendState');

export const DefaultBackendState: BackendState = {
    mobile: false,
    deployment: {
        web: 'http://localhost:4200/',
        authority: 'https://localhost:5001/auth',
        api: 'https://localhost:5003/'
    },
    antiForgeryToken: {
    },
};
