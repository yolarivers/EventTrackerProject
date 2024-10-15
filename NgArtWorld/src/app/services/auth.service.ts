import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError, tap } from 'rxjs';
import { environment } from '../../environments/environment';
import { User } from '../models/user';
import { Buffer } from 'buffer';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private baseUrl = 'http://localhost:8080/';
  private url = environment.baseUrl + 'api/Artisphere';

  constructor(private http: HttpClient) {}

  register(user: User): Observable<User> {
    return this.http.post<User>(this.url + 'register', user).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(() => new Error('AuthService.register(): error registering user.'));
      })
    );
  }

  login(username: string, password: string): Observable<User> {
    const credentials = this.generateBasicAuthCredentials(username, password);
    const httpOptions = {
      headers: new HttpHeaders({
        Authorization: `Basic ${credentials}`,
        'X-Requested-With': 'XMLHttpRequest',
      }),
    };

    return this.http.get<User>(this.url + 'authenticate', httpOptions).pipe(
      tap((newUser) => {
        localStorage.setItem('credentials', credentials);
        return newUser;
      }),
      catchError((err: any) => {
        console.log(err);
        return throwError(() => new Error('AuthService.login(): error logging in user.'));
      })
    );
  }

  logout(): void {
    localStorage.removeItem('credentials');
  }

  getLoggedInUser(): Observable<User> {
    if (!this.checkLogin()) {
      return throwError(() => new Error('Not logged in.'));
    }
    let httpOptions = {
      headers: {
        Authorization: 'Basic ' + this.getCredentials(),
        'X-Requested-with': 'XMLHttpRequest',
      },
    };
    return this.http.get<User>(this.url + 'authenticate', httpOptions).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(() => new Error('AuthService.getUserById(): error retrieving user: ' + err));
      })
    );
  }

  checkLogin(): boolean {
    return !!localStorage.getItem('credentials');
  }

  generateBasicAuthCredentials(username: string, password: string): string {
    return btoa(`${username}:${password}`);
  }
  

  getCredentials(): string | null {
    return localStorage.getItem('credentials');
  }
}
 
function ngOnInit() {
  throw new Error('Function not implemented.');
}

