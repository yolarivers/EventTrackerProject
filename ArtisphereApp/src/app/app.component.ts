import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  museums = [
    { name: 'Louvre Museum', type: 'Art' },
    { name: 'British Museum', type: 'History' },
    { name: 'Museum of Modern Art', type: 'Art' },
    { name: 'Smithsonian Museum', type: 'History' },
    { name: 'Natural History Museum', type: 'Natural Science' }
  ];

  types = ['Art', 'History', 'Natural Science', 'Technology'];

  deleteMuseum(museum) {
    this.museums = this.museums.filter(m => m !== museum);
  }
}
