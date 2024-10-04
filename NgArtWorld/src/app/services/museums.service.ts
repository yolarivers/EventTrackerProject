import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Museum } from '../models/museum';
import { AuthService } from './auth.service';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class MuseumsService {

  private baseUrl = environment.baseUrl + 'api/museums';  

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

  getAllMuseums(): Observable<Museum[]> {
    return this.http.get<Museum[]>(this.baseUrl);
  }

  getMuseumsById(museumId: number): Observable<Museum> {
    const url = `${this.baseUrl}/${museumId}`;
    return this.http.get<Museum>(url);
  }

  saveMuseums(newMuseum: Museum): Observable<Museum> {
    return this.http.post<Museum>(this.baseUrl, newMuseum, this.getHttpOptions());
  }

  updateMuseums(museumId: number, updatingMuseum: Museum): Observable<Museum> {
    const url = `${this.baseUrl}/${museumId}`;
    return this.http.put<Museum>(url, updatingMuseum, this.getHttpOptions());
  }

  deleteMuseums(museumId: number): Observable<void> {
    const url = `${this.baseUrl}/${museumId}`;
    return this.http.delete<void>(url, this.getHttpOptions());
  }
}
