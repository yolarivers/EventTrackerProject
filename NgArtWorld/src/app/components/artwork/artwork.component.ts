import { Component, OnInit } from '@angular/core';
import { Artwork } from '../../models/artwork';
import { ArtworkReview } from '../../models/artwork-review';
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
  artworks: Artwork[] = [];  
  selectedArtwork: Artwork | null = null;
  artworkRating: number = 0;
  artworkComments: string[] = [];
  commentText: string = '';
  artworkReviews: ArtworkReview[] = [];

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
    this.loadArtworkReviews(artwork.id);
  }

  loadArtworkReviews(artworkId: number): void {
    this.artworkService.getArtworkReviews(artworkId).subscribe(
      (reviews: ArtworkReview[]) => {
        this.artworkReviews = reviews;
        // Calculate average rating if needed
        this.artworkRating = reviews.reduce((acc, review) => acc + review.rating, 0) / reviews.length || 0;
        this.artworkComments = reviews.map(review => review.comment);
      },
      (error: any) => {
        console.error(`Error fetching reviews for artwork ID ${artworkId}:`, error);
      }
    );
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
    this.artworkReviews = [];
  }
}
