import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Museum } from '../models/museum';

@Injectable({
  providedIn: 'root'
})
export class MuseumService {

  private baseUrl = 'http://localhost:8085/api/museums';  // Adjust this URL based on your backend

  constructor(private http: HttpClient) { }

  // Get all museums
  getAllMuseums(): Observable<Museum[]> {
    return this.http.get<Museum[]>(this.baseUrl);
  }

  // Get museum by ID
  getMuseumById(id: number): Observable<Museum> {
    return this.http.get<Museum>(`${this.baseUrl}/${id}`);
  }

  // Create a new museum
  createMuseum(museum: Museum): Observable<Museum> {
    return this.http.post<Museum>(this.baseUrl, museum);
  }
}
