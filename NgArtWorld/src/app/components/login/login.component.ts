import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { FormsModule, NgForm } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  standalone: true,
  imports: [FormsModule, CommonModule],
})
export class LoginComponent {
  constructor(private auth: AuthService, private router: Router) {}

  login(loginUser: NgForm) {
    if (loginUser.valid) {
      console.log('User Data:', loginUser.value);
      
      this.auth.login(loginUser.value.username, loginUser.value.password).subscribe({
        next: () => {
          this.router.navigateByUrl('/museums');
        },
        error: (problem) => {
          console.error('LoginComponent.login(): Error logging in user:', problem);
        }
      });
    } else {
      console.log('Form is invalid');
    }
  }
}


