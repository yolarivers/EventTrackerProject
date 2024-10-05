import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { Artwork } from '../../models/artwork'; 
import { ArtworkService } from '../../services/artwork.service';

@Component({
  imports: [CommonModule],
  standalone: true,
  selector: 'app-artwork',
  templateUrl: './artwork.component.html',
  styleUrls: ['./artwork.component.css']
})
export class ArtworkComponent implements OnInit {


  artworks: Artwork[] = [];
  selectedArtwork: Artwork | null = null;


  rating: number = 0;
  comments: string[] = [];
  newComment: string = '';

  constructor(private artworkService: ArtworkService) {}

  ngOnInit(): void {
    this.loadArtworks();
  }

  
  loadArtworks(): void {
    this.artworkService.getAllArtworks().subscribe(
      (response) => {
        this.artworks = response;
      },
      (error) => {
        console.error(error);
      }
    );
  }

  
  openArtworkDetails(artwork: Artwork): void {
    this.selectedArtwork = artwork;
  }


  closeArtworkDetails(): void {
    this.selectedArtwork = null;
  }


  rateArtwork(rating: number): void {
    this.rating = rating;
  }


  addComment(): void {
    if (this.newComment.trim()) {
      this.comments.push(this.newComment);
      this.newComment = ''; 
    }
  }
}
