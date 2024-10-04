import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { AuthService } from './services/auth.service';

import { FooterComponent } from "./components/footer/footer.component";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, FooterComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'NgArtWorld';
  constructor(
    private auth: AuthService
  ) {}
  
  ngOnInit() {
    this.tempTestDeleteMeLater(); // DELETE LATER!!!
  }
  
  tempTestDeleteMeLater() {
    this.auth.login('admin','test').subscribe({ // change username to match DB
      next: (data) => {
        console.log('Logged in:');
        console.log(data);
      },
      error: (fail) => {
        console.error('Error authenticating:')
        console.error(fail);
      }
    });
  }
}
