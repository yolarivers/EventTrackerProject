import { TestBed } from '@angular/core/testing';

import { MuseumsService } from './museums.service';

describe('MuseumsService', () => {
  let service: MuseumsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MuseumsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
