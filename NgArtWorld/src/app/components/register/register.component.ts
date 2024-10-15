import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common'; // Import CommonModule
import { User } from '../../models/user';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [FormsModule, CommonModule],  // Add CommonModule here
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']  
})
export class RegisterComponent {
  newUser: User = new User();
  
  constructor(private auth: AuthService, private router: Router) { }

  register(user: User): void {
    console.log('Registering user:', user);

    this.auth.register(user).subscribe({
      next: (registeredUser) => {
        this.auth.login(user.username, user.password).subscribe({
          next: (loggedInUser) => {
            this.router.navigateByUrl('/todo');
          },
          error: (problem) => {
            console.error('RegisterComponent.register(): Error logging in user:', problem);
          }
        });
      },
      error: (fail) => {
        console.error('RegisterComponent.register(): Error registering account:', fail);
      }
    });
  }
}
