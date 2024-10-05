import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { ExhibitionsService } from '../../services/exhibitions.service';
import { Exhibition } from '../../models/exhibition';
import { FormsModule } from '@angular/forms';
import { Museum } from '../../models/museum';
import { MuseumsService } from '../../services/museums.service';

@Component({
  imports: [CommonModule, FormsModule],
  standalone: true,
  selector: 'app-exhibitions',
  templateUrl: './exhibitions.component.html',
})
export class ExhibitionsComponent implements OnInit {
  exhibitions: Exhibition[] = [];
  museums: Museum[] = [];
  selectedExhibition: Exhibition | null = null;
  newExhibition: Exhibition | null = null;

  constructor(private exhibitionsService: ExhibitionsService,
    private museumService: MuseumsService

  ) {}

  ngOnInit(): void {
    this.loadExhibitions();
    this.loadMuseums();
  }

  loadExhibitions() {
    this.exhibitionsService.getAllExhibitions().subscribe(
      (response) => {
        this.exhibitions = response;
      },
      (error) => {
        console.error(error);
      }
    );
  }

  loadMuseums() {
    this.museumService.getAllMuseums().subscribe(
      (response) => {
        this.museums = response;
      },
      (error) => {
        console.error(error);
      }
    );
  }
  showNewExhibitionForm() {
    this.newExhibition = new Exhibition();
  }
  addExhibition(exhibition: Exhibition) {
    this.exhibitionsService.saveExhibitions(exhibition).subscribe({
      next: (response) => {
        this.newExhibition = null;
        this.loadExhibitions();
      },
      error: (error) => {
        console.error(error);
      },
    });
  }
}
