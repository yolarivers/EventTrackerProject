import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-exhibitions',
  templateUrl: './exhibitions.component.html'
})
export class ExhibitionsComponent  {

  exhibitions = [
    { id: 1, name: 'Impressionist Art', description: 'A showcase of Impressionist paintings', imageUrl: 'assets/impressionist.jpg' },
    { id: 2, name: 'Modern Art', description: 'Modern art from the 20th century', imageUrl: 'assets/modern.jpg' },

  ];

  selectedExhibitions = null;

  constructor() { }

  ngOnInit(): void { }

 
}

