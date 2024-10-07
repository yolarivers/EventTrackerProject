import { Component, OnInit } from '@angular/core';
import { Artwork } from '../../models/artwork';
import { ArtworkService } from '../../services/artwork.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms'; 

@Component({
  standalone: true,
  selector: 'app-artwork',
  templateUrl: './artwork.component.html',
  styleUrls: ['./artwork.component.css'],
  imports: [CommonModule, FormsModule]
})
export class ArtworkComponent implements OnInit {
openModal(_t6: any) {
throw new Error('Method not implemented.');
}
deleteExhibition(arg0: any) {
throw new Error('Method not implemented.');
}
closeModal() {
throw new Error('Method not implemented.');
}
  artworks: Artwork[] = [];  
  selectedArtwork: Artwork | null = null;
  artworkRating: number = 0;
  artworkComments: string[] = [];
  commentText: string = '';
exhibitions: any;
selectedExhibition: any;

  constructor(private artworkService: ArtworkService) {}

  ngOnInit(): void {
    this.loadArtwork();
  }

  loadArtwork(): void {
    this.artworkService.getAllArtworks().subscribe(
      (response: Artwork[]) => {
        this.artworks = response;  
      },
      (error: any) => {
        console.error('Error fetching art collection:', error);
      }
    );
  }

  showArtworkDetails(artwork: Artwork): void {
    this.selectedArtwork = artwork;
    this.resetArtworkDetails();
  }

  closeArtworkModal(): void {
    this.selectedArtwork = null;
    this.resetArtworkDetails();
  }

  rateArtwork(rating: number): void {
    this.artworkRating = rating;
  }

  submitComment(): void {
    if (this.commentText.trim()) {
      this.artworkComments.push(this.commentText);
      this.commentText = '';
    }
  }

  private resetArtworkDetails(): void {
    this.artworkRating = 0;
    this.artworkComments = [];
  }
}
