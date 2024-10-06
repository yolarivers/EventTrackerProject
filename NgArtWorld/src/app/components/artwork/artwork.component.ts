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
  Artworks: Artwork[] = [];  // Updated variable name to match across the component
  selectedArtwork: Artwork | null = null;
  artworkRating: number = 0;
  artworkComments: string[] = [];
  commentText: string = '';

  constructor(private artworkService: ArtworkService) {}

  ngOnInit(): void {
    this.loadArtwork();
  }

  loadArtwork(): void {
    this.artworkService.getAllArtworks().subscribe(
      (response: Artwork[]) => {
        this.Artworks = response;  // Ensure that the API response is correctly set to Artworks
      },
      (error: any) => {
        console.error('Error fetching art collection:', error);
      }
    );
  }

  showArtworkDetails(artwork: Artwork): void {
    this.selectedArtwork = artwork;
  }

  closeArtworkModal(): void {
    this.selectedArtwork = null;
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
}
