import { Component, OnInit } from '@angular/core';
import { Museum } from '../../models/museum';
import { MuseumsService } from '../../services/museums.service';
import { CommonModule } from '@angular/common';

@Component({
  imports:[CommonModule],
  standalone: true,
  selector: 'app-museums',
  templateUrl: './museums.component.html',
})
export class MuseumsComponent implements OnInit {
  museums: Museum[] = [];

  constructor(private museumsService: MuseumsService) {}

  ngOnInit(): void {
    this.loadMuseums();
  }
  loadMuseums() {
    this.museumsService.getAllMuseums().subscribe(
      (response) => {
        this.museums = response;
      },
      (error) => {
        console.error(error);
      }
    );
  }
}
