import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { User } from '../models/user';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private baseUrl = 'http://localhost:8085/api/users';  

  constructor(private http: HttpClient, private auth: AuthService) {}

  getHttpOptions() {
    let options = {
      headers: {
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest',
      },
    };
    return options;
  }

  register(user: User): Observable<User> {
    return this.http.post<User>(`${this.baseUrl}/register`, user, this.getHttpOptions());
  }

  updateUser(user: User): Observable<User> {
    return this.http.put<User>(`${this.baseUrl}/${user.id}`, user, this.getHttpOptions());
  }

  getUserById(userId: number): Observable<User> {
    return this.http.get<User>(`${this.baseUrl}/${userId}`, this.getHttpOptions());
  }

  getUserByUsername(username: string): Observable<User> {
    return this.http.get<User>(`${this.baseUrl}/username/${username}`, this.getHttpOptions());
  }

  getAllUsers(): Observable<User[]> {
    return this.http.get<User[]>(this.baseUrl, this.getHttpOptions());
  }

  deleteUser(userId: number): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${userId}`, this.getHttpOptions());
  }
}
