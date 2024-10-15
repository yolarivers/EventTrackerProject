import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Exhibition } from '../models/exhibition';
import { AuthService } from './auth.service';




@Injectable({
  providedIn: 'root'
})
export class ExhibitionService {
  private apiUrl = 'http://localhost:8080/api/exhibitions';

  constructor(private http: HttpClient, private auth: AuthService) {}

  getHttpOptions(): { headers: { [header: string]: string } } {
    return {
      headers: {
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest',
      },
    };
  }

  getExhibitions(): Observable<Exhibition[]> {
    return this.http.get<Exhibition[]>(this.apiUrl, this.getHttpOptions());
  }
  

  addExhibition(exhibition: Exhibition): Observable<Exhibition> {
    return this.http.post<Exhibition>(this.apiUrl, exhibition, this.getHttpOptions());
  }

  updateExhibition(exhibition: Exhibition): Observable<Exhibition> {
    return this.http.put<Exhibition>(`${this.apiUrl}/${exhibition.id}`, exhibition, this.getHttpOptions());
  }

  deleteExhibition(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`, this.getHttpOptions());
  }
} 
