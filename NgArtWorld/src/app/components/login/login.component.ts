import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { FormsModule, NgForm } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  standalone: true,
  imports: [FormsModule],
})

export class LoginComponent {
  username: string = '';
  password: string = '';
constructor(private auth: AuthService, private router: Router) { }
  login(loginUser: NgForm) {
    if (loginUser.valid) {
      console.log('User Data:', {
        username: this.username,
        password: this.password
      });
    } else {
      console.log('Form is invalid');
    }
 
 
        this.auth.login(loginUser.value.username, loginUser.value.password).subscribe({
          next: (loggedInUser) => {
            this.router.navigateByUrl('/todo');
          },
          error: (problem) => {
            console.error('RegisterComponent.register(): Error logging in user:');
            console.error(problem);
          }
        });
      
  
  }
}

