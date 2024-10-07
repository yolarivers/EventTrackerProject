import { Component, OnInit } from '@angular/core';
import { Museum } from '../../models/museum';

import { CommonModule } from '@angular/common';
import { MuseumService } from '../../services/museum.service';

@Component({
  selector: 'app-museum',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './museum.component.html',
})
export class MuseumComponent implements OnInit {
  museums: Museum[] = [];
  errorMessage: string | null = null; 

  constructor(private museumService: MuseumService) {}

  ngOnInit(): void {
    this.loadMuseums();
  }

  loadMuseums(): void {
    this.museumService.getAllMuseums().subscribe({
      next: (response) => {
        this.museums = response;
        this.errorMessage = null; 
      },
      error: (error) => {
        console.error('Error fetching museums:', error);
        this.errorMessage = 'Failed to load museums. Please try again later.';
      }
    });
  }
}
