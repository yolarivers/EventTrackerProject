import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ExhibitionService } from '../../services/exhibition.service';
import { Exhibition } from '../../models/exhibition';
import { FormsModule } from '@angular/forms';

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
  selectedExhibition: Exhibition | null = null;
  newExhibition: Exhibition = new Exhibition();
  editExhibition: Exhibition | null = null;
  errorMessage: string | null = null;
  selectedFile: File | null = null;

  constructor(private exhibitionService: ExhibitionService) {}

  ngOnInit(): void {
    this.loadExhibitions();
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
    this.selectedExhibition = new Exhibition();
  }
  closeModal(): void {
    this.selectedExhibition = null;
  }

  saveExhibition(exhibition:Exhibition): void {
   
        this.exhibitionService
          .addExhibition(exhibition)
          .subscribe(() => {
            this.loadExhibitions();
            this.selectedExhibition = null;
          });
     
      
    }
 

  deleteExhibition(id: number): void {
    this.exhibitionService.deleteExhibition(id).subscribe(() => {
      this.loadExhibitions();
    });
  }
}
