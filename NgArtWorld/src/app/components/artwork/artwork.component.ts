import { Component, OnInit } from '@angular/core';

interface Artwork {
  id: number;
  name: string;
  description: string;
  imageUrl: string;
}

@Component({
  selector: 'app-artwork',
  templateUrl: './artwork.component.html',
  styleUrls: ['./artwork.component.css']
})
export class ArtworkComponent implements OnInit {

  artworks: Artwork[] = [
    {
      id: 1,
      name: 'Starry Night',
      description: 'A famous painting by Vincent van Gogh.',
      imageUrl: 'assets/starry-night.jpg'
    },
    {
      id: 2,
      name: 'The Persistence of Memory',
      description: 'A surreal artwork by Salvador Dalí.',
      imageUrl: 'assets/persistence-of-memory.jpg'
    },
    {
      id: 3,
      name: 'Mona Lisa',
      description: 'A world-renowned painting by Leonardo da Vinci.',
      imageUrl: 'assets/mona-lisa.jpg'
    }
  ];

  selectedArtwork: Artwork | null = null;

  constructor() { }

  ngOnInit(): void { }

  openArtworkDetails(artwork: Artwork): void {
    this.selectedArtwork = artwork;
  }

  closeArtworkDetails(): void {
    this.selectedArtwork = null;
  }
}
