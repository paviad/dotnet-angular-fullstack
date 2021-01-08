import 'zone.js/dist/zone-node';

import { join } from 'path';

import { AppServerModule, renderModule, BackendState, BACKEND_STATE } from './src/main.server';
import { readFileSync, writeFileSync } from 'fs';

function app(url: string, stateJson: string) {
  const distFolder = join(process.cwd(), 'dist/ClientApp/browser');
  const indexHtml = join(distFolder, 'index.html');
  const document = readFileSync(indexHtml, 'utf8');
  let backendState: BackendState = null;
  try {
    backendState = JSON.parse(stateJson);
  }
  catch {
    // ignored
  }
  renderModule(AppServerModule, {
    url,
    document,
    extraProviders: [
      { provide: BACKEND_STATE, useValue: backendState }
    ]
  }).then(x => writeFileSync('out.html', x));
}

app(process.argv[2], process.argv[3]);
