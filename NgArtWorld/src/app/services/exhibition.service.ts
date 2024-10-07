import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Exhibition } from '../models/exhibition';



@Injectable({
  providedIn: 'root'
})
export class ExhibitionService {
  private apiUrl = 'http://localhost:8085/api/exhibitions';

  constructor(private http: HttpClient) {}

  getExhibitions(): Observable<Exhibition[]> {
    return this.http.get<Exhibition[]>(this.apiUrl);
  }

  addExhibition(exhibition: Exhibition): Observable<Exhibition> {
    return this.http.post<Exhibition>(this.apiUrl, exhibition);
  }

  updateExhibition(exhibition: Exhibition): Observable<Exhibition> {
    return this.http.put<Exhibition>(`${this.apiUrl}/${exhibition.id}`, exhibition);
  }

  deleteExhibition(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
