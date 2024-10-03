import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-exhibitions',
  templateUrl: './exhibitions.component.html'
})
export class ExhibitionsComponent implements OnInit {

  exhibitions = [
    { id: 1, name: 'Impressionist Art', description: 'A showcase of Impressionist paintings', imageUrl: 'assets/impressionist.jpg' },
    { id: 2, name: 'Modern Art', description: 'Modern art from the 20th century', imageUrl: 'assets/modern.jpg' },

  ];

  selectedExhibitions = null;

  constructor(private modalService: NgbModal) { }

  ngOnInit(): void { }

  openModal(exhibitions: null, content: any) {
    this.selectedExhibitions = exhibitions;
    this.modalService.open(content);
  }

  closeModal() {
    this.selectedExhibitions = null;
  }
}

