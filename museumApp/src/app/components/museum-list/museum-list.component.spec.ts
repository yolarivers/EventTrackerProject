import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MuseumListComponent } from './museum-list.component';

describe('MuseumListComponent', () => {
  let component: MuseumListComponent;
  let fixture: ComponentFixture<MuseumListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MuseumListComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MuseumListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
