import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ExhibitionService } from '../../services/exhibition.service';
import { Exhibition } from '../../models/exhibition';
import { FormsModule } from '@angular/forms';
import { Museum } from '../../models/museum';
import { MuseumService } from '../../services/museum.service';

@Component({
  selector: 'app-exhibitions',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './exhibitions.component.html',
  styleUrls: ['./exhibitions.component.css'],
  providers: [ExhibitionService],
})
export class ExhibitionsComponent implements OnInit {
  exhibitions: Exhibition[] = [];
  museums: Museum[] = [];
  selectedExhibition: Exhibition | null = null;
  newExhibition: Exhibition | null = null;
  editExhibition: Exhibition | null = null;
  errorMessage: string | null = null;
  selectedFile: File | null = null;

  constructor(private exhibitionService: ExhibitionService, private museumService: MuseumService) {}

  ngOnInit(): void {
    this.loadExhibitions();
    this.loadMuseums();
  }

  loadMuseums(): void {
    this.museumService.getAllMuseums().subscribe({
      next: (data: Museum[]) => {
        this.museums = data;
      },
    });
  }


  loadExhibitions(): void {
    this.exhibitionService.getExhibitions().subscribe({
      next: (data: Exhibition[]) => {
        this.exhibitions = data;
      },
    });
  }

showEditForm(exhibition: Exhibition): void {
        this.editExhibition= {...exhibition}
}

  showNewExhibitionForm(): void {
    this.newExhibition = new Exhibition();
  }
  closeModal(): void {
    this.selectedExhibition = null;
    this.newExhibition = null;
  }

  saveExhibition(exhibition:Exhibition): void {
   
        this.exhibitionService
          .addExhibition(exhibition)
          .subscribe(() => {
            this.loadExhibitions();
            this.newExhibition = null;
            this.selectedExhibition = null;
          });
     
      
    }
 

  deleteExhibition(id: number): void {
    this.exhibitionService.deleteExhibition(id).subscribe({
      next: () => {
        this.loadExhibitions();
      }
     
    });
  }
}
