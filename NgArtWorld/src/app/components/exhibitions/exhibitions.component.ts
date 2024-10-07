import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ExhibitionService } from '../../services/exhibition.service';
import { Exhibition } from '../../models/exhibition';

@Component({
  selector: 'app-exhibition',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './exhibitions.component.html',
  providers: [ExhibitionService]
})
export class ExhibitionComponent implements OnInit {
  exhibitions: Exhibition[] = [];
  selectedExhibition: Exhibition | null = null;
  errorMessage: string | null = null;
  selectedFile: File | null = null;

  constructor(private exhibitionService: ExhibitionService) {}

  ngOnInit(): void {
    this.loadExhibitions();
  }

  loadExhibitions(): void {
    this.exhibitionService.getAllExhibitions().subscribe({
      next: (response) => {
        this.exhibitions = response;
        this.errorMessage = null;
      },
      error: (error) => {
        console.error('Error fetching exhibitions:', error);
        this.errorMessage = 'Failed to load exhibitions. Please try again later.';
      }
    });
  }

  openModal(exhibition?: Exhibition): void {
    this.selectedExhibition = exhibition
      ? { ...exhibition } 
      : { title: '', description: '', startDate: '', endDate: '', imageUrl: '' } as Exhibition;
    this.selectedFile = null;
  }

  closeModal(): void {
    this.selectedExhibition = null;
    this.selectedFile = null;
  }

  onFileSelected(event: Event): void {
    const target = event.target as HTMLInputElement;
    if (target && target.files) {
      this.selectedFile = target.files[0];
    }
  }

  saveExhibition(): void {
    if (!this.selectedExhibition) return;

    const formData = new FormData();
    formData.append('title', this.selectedExhibition.title);
    formData.append('description', this.selectedExhibition.description);
    formData.append('startDate', this.selectedExhibition.startDate);
    formData.append('endDate', this.selectedExhibition.endDate);
    if (this.selectedFile) {
      formData.append('file', this.selectedFile);
    }

    const saveObservable = this.selectedExhibition.id
      ? this.exhibitionService.updateExhibition(this.selectedExhibition.id, formData)
      : this.exhibitionService.uploadExhibition(formData);

    saveObservable.subscribe({
      next: () => {
        this.loadExhibitions();
        this.closeModal();
      },
      error: (error) => {
        console.error(`Error ${this.selectedExhibition?.id ? 'updating' : 'adding'} exhibition:`, error);
        this.errorMessage = `Failed to ${this.selectedExhibition?.id ? 'update' : 'add'} exhibition. Please try again later.`;
      }
    });
  }

  deleteExhibition(id: number): void {
    if (confirm('Are you sure you want to delete this exhibition?')) {
      this.exhibitionService.deleteExhibition(id).subscribe({
        next: () => this.loadExhibitions(),
        error: (error) => {
          console.error('Error deleting exhibition:', error);
          this.errorMessage = 'Failed to delete exhibition. Please try again later.';
        }
      });
    }
  }
}
