import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Museum } from '../models/museum';
import { AuthService } from './auth.service';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class MuseumService {

  private baseUrl = `${environment.baseUrl}api/museum`;  

  constructor(private http: HttpClient, private auth: AuthService) {}

  private getHttpOptions() {
    const headers = new HttpHeaders({
      Authorization: 'Basic ' + this.auth.getCredentials(),
      'X-Requested-With': 'XMLHttpRequest',
    });
    return { headers };
  }

  getAllMuseums(): Observable<Museum[]> {
    return this.http.get<Museum[]>(this.baseUrl);
  }

  getMuseumById(museumId: number): Observable<Museum> {
    return this.http.get<Museum>(`${this.baseUrl}/${museumId}`);
  }

  saveMuseum(newMuseum: Museum): Observable<Museum> {
    return this.http.post<Museum>(this.baseUrl, newMuseum, this.getHttpOptions());
  }

  updateMuseum(museumId: number, updatingMuseum: Museum): Observable<Museum> {
    return this.http.put<Museum>(`${this.baseUrl}/${museumId}`, updatingMuseum, this.getHttpOptions());
  }

  deleteMuseum(museumId: number): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${museumId}`, this.getHttpOptions());
  }
}
