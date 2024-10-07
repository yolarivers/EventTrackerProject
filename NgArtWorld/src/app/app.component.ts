import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { AuthService } from './services/auth.service';

import { FooterComponent } from "./components/footer/footer.component";
import { NavigationComponent } from "./components/navigation/navigation.component";
import { ExhibitionComponent } from './components/exhibitions/exhibitions.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [
    RouterOutlet,
    FooterComponent,
    NavigationComponent,
    ExhibitionComponent
  ],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'] 
})
export class AppComponent implements OnInit {

  constructor(private auth: AuthService) {}


  ngOnInit(): void {
 
  }
}

