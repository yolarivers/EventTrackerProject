import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Exhibitions } from '../models/exhibitions';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class ExhibitionsService {

  private baseUrl = 'http://localhost:8087/api/exhibitions';  

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

  getAllExhibitions(): Observable<Exhibitions[]> {
    return this.http.get<Exhibitions[]>(this.baseUrl, this.getHttpOptions());
  }

  getExhibitionsById(exhibitionId: number): Observable<Exhibitions> {
    const url = `${this.baseUrl}/${exhibitionId}`;
    return this.http.get<Exhibitions>(url, this.getHttpOptions());
  }

  saveExhibitions(newExhibition: Exhibitions): Observable<Exhibitions> {
    return this.http.post<Exhibitions>(this.baseUrl, newExhibition, this.getHttpOptions());
  }

  deleteExhibitions(exhibitionId: number): Observable<void> {
    const url = `${this.baseUrl}/${exhibitionId}`;
    return this.http.delete<void>(url, this.getHttpOptions());
  }
}
