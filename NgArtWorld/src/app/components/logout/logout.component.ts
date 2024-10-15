import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  standalone: true,
  selector: 'app-logout',
  templateUrl: './logout.component.html',
  styleUrls: ['./logout.component.css']
})
export class LogoutComponent {
  constructor(
    private auth: AuthService,
    private router: Router
  ) {}

  logout() {
    console.log('Logging out...');
    this.auth.logout();
    this.router.navigateByUrl('/home');
  }
}

