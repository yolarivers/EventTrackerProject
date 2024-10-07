import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Exhibition } from '../models/exhibition';
import { AuthService } from './auth.service';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ExhibitionService {
  private baseUrl = environment.baseUrl ? environment.baseUrl + 'api/exhibition' : 'http://localhost:8085/api/exhibition';

  constructor(private http: HttpClient, private auth: AuthService) {}

  private getHttpOptions() {
    return {
      headers: new HttpHeaders({
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest'
      })
    };
  }

  getAllExhibitions(): Observable<Exhibition[]> {
    return this.http.get<Exhibition[]>(this.baseUrl, this.getHttpOptions())
      .pipe(catchError(this.handleError));
  }

  getExhibitionById(exhibitionId: number): Observable<Exhibition> {
    const url = `${this.baseUrl}/${exhibitionId}`;
    return this.http.get<Exhibition>(url, this.getHttpOptions())
      .pipe(catchError(this.handleError));
  }

  uploadExhibition(formData: FormData): Observable<Exhibition> {
    return this.http.post<Exhibition>(`${this.baseUrl}/upload`, formData, this.getHttpOptions())
      .pipe(catchError(this.handleError));
  }

  saveExhibition(newExhibition: Exhibition): Observable<Exhibition> {
    return this.http.post<Exhibition>(this.baseUrl, newExhibition, this.getHttpOptions())
      .pipe(catchError(this.handleError));
  }

  deleteExhibition(exhibitionId: number): Observable<void> {
    const url = `${this.baseUrl}/${exhibitionId}`;
    return this.http.delete<void>(url, this.getHttpOptions())
      .pipe(catchError(this.handleError));
  }

  updateExhibition(exhibitionId: number, updatedExhibition: Exhibition): Observable<Exhibition> {
    const url = `${this.baseUrl}/${exhibitionId}`;
    return this.http.put<Exhibition>(url, updatedExhibition, this.getHttpOptions())
      .pipe(catchError(this.handleError));
  }

  private handleError(error: any): Observable<never> {
    console.error('An error occurred:', error);
    return throwError(() => new Error(error.message || 'Server error'));
  }
}
