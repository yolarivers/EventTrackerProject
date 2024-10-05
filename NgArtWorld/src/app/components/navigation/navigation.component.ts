import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { LogoutComponent } from '../logout/logout.component';
import { AuthService } from '../../services/auth.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-navigation',
  standalone: true,
  imports: [RouterLink, LogoutComponent, CommonModule],
  templateUrl: './navigation.component.html',
  styleUrl: './navigation.component.css'
})
export class NavigationComponent {
constructor(private auth: AuthService) { }
  isLoggedIn() {
    return this.auth.checkLogin();
  }
} 