import { TestBed } from '@angular/core/testing';

import { MuseumService } from './museum.service';

describe('MuseumsService', () => {
  let service: MuseumService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MuseumService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
