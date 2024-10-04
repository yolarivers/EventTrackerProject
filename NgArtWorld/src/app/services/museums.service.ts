import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Museums } from '../models/museums';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class MuseumsService {

  private baseUrl = 'http://localhost:8085/api/museums';  

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

  getAllMuseums(): Observable<Museums[]> {
    return this.http.get<Museums[]>(this.baseUrl, this.getHttpOptions());
  }

  getMuseumsById(museumId: number): Observable<Museums> {
    const url = `${this.baseUrl}/${museumId}`;
    return this.http.get<Museums>(url, this.getHttpOptions());
  }

  saveMuseums(newMuseum: Museums): Observable<Museums> {
    return this.http.post<Museums>(this.baseUrl, newMuseum, this.getHttpOptions());
  }

  updateMuseums(museumId: number, updatingMuseum: Museums): Observable<Museums> {
    const url = `${this.baseUrl}/${museumId}`;
    return this.http.put<Museums>(url, updatingMuseum, this.getHttpOptions());
  }

  deleteMuseums(museumId: number): Observable<void> {
    const url = `${this.baseUrl}/${museumId}`;
    return this.http.delete<void>(url, this.getHttpOptions());
  }
}
