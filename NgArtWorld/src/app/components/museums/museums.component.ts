import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-museums',
  templateUrl: './museums.component.html'
})
export class MuseumsComponent implements OnInit {

  museums = [
    { id: 1, name: 'Louvre Museum', description: 'Famous museum in Paris', imageUrl: 'assets/louvre.jpg' },
    { id: 2, name: 'The Met', description: 'Metropolitan Museum of Art in NYC', imageUrl: 'assets/met.jpg' },
   { id: 3, name: 'British Museum', description: 'Museum in London', imageUrl: 'assets/british.jpg' },
  ];

  constructor() { }

  ngOnInit(): void { }
}
