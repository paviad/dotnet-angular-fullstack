import { TestBed } from '@angular/core/testing';

import { SecuredService } from './secured.service';

describe('SecuredService', () => {
  let service: SecuredService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SecuredService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
