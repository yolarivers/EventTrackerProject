import { CommonModule } from '@angular/common';
import { Component, OnInit, Renderer2, OnDestroy } from '@angular/core';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']  
})
export class HomeComponent implements OnInit, OnDestroy {
  galleryItems = [
    { image: 'assets/gallery-1.jpg', title: 'Abstract Art', description: 'A beautiful collection of abstract art.' },
    { image: 'assets/gallery-2.jpg', title: 'Landscape Paintings', description: 'Captivating landscapes from around the world.' },
    { image: 'assets/gallery-3.jpg', title: 'Modern Sculptures', description: 'Innovative and unique sculptures.' }
  ];

  images = [
    'https://images.pexels.com/photos/18159661/pexels-photo-18159661/free-photo-of-abstract-painting-in-art-gallery.jpeg',
    'https://images.pexels.com/photos/3213977/pexels-photo-3213977.jpeg',
    'https://images.pexels.com/photos/1839919/pexels-photo-1839919.jpeg'
  ];

  currentIndex = 0;
  interval: any;

  constructor(private renderer: Renderer2) {}

  ngOnInit() {
    this.rotateBackgroundImage();
    this.interval = setInterval(() => this.rotateBackgroundImage(), 5000);
  }

  rotateBackgroundImage() {
    const heroSection = document.querySelector('.hero-section');
    if (heroSection) {
      this.renderer.setStyle(
        heroSection,
        'backgroundImage',
        `url('${this.images[this.currentIndex]}')`
      );
      this.currentIndex = (this.currentIndex + 1) % this.images.length;
    }
  }

  ngOnDestroy() {
    if (this.interval) {
      clearInterval(this.interval);
    }
  }
}
