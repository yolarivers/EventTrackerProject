import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { ExhibitionService } from '../../services/exhibition.service';
import { Exhibition } from '../../models/exhibition';
import { FormsModule } from '@angular/forms';
import { Museum } from '../../models/museum';
import { MuseumService } from '../../services/museum.service';

@Component({
  imports: [CommonModule, FormsModule],
  standalone: true,
  selector: 'app-exhibitions',
  templateUrl: './exhibitions.component.html',
})
export class ExhibitionComponent implements OnInit {
  exhibitions: Exhibition[] = [];
  museums: Museum[] = [];
  selectedExhibition: Exhibition | null = null;
  newExhibition: Exhibition = new Exhibition();
  showNewExhibition: boolean = false; 

  constructor(
    private exhibitionService: ExhibitionService,
    private museumService: MuseumService
  ) {}

  ngOnInit(): void {
    this.loadExhibitions();
    this.loadMuseums();
  }

  loadExhibitions(): void {
    this.exhibitionService.getAllExhibitions().subscribe({
      next: (response: Exhibition[]) => {
        this.exhibitions = response;
      },
      error: (error: any) => {
        console.error('Error fetching exhibitions:', error);
      }
    });
  }

  loadMuseums(): void {
    this.museumService.getAllMuseums().subscribe({
      next: (response: Museum[]) => {
        this.museums = response;
      },
      error: (error: any) => {
        console.error('Error fetching museums:', error);
      }
    });
  }

  showNewExhibitionForm(): void {
    this.newExhibition = new Exhibition();
    this.newExhibition.museum = new Museum(); 
    this.showNewExhibition = true; 
  }

  addExhibition(exhibition: Exhibition): void {
    this.exhibitionService.saveExhibition(exhibition).subscribe({
      next: () => {
        this.newExhibition = new Exhibition();
        this.loadExhibitions();
        this.showNewExhibition = false; 
      },
      error: (error: any) => {
        console.error('Error adding exhibition:', error);
      },
    });
  }

  openModal(exhibition: Exhibition): void {
    this.selectedExhibition = exhibition;
  }
}
