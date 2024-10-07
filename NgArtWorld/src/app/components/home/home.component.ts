import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']  
})
export class HomeComponent {
[x: string]: any;


  galleryItems = [
    { image: 'assets/gallery-1.jpg', title: 'Abstract Art', description: 'A beautiful collection of abstract art.' },
    { image: 'assets/gallery-2.jpg', title: 'Landscape Paintings', description: 'Captivating landscapes from around the world.' },
    { image: 'assets/gallery-3.jpg', title: 'Modern Sculptures', description: 'Innovative and unique sculptures.' }
  ];
}
