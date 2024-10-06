import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Artwork } from '../models/artwork';
import { AuthService } from './auth.service';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ArtworkService {

  private baseUrl = environment.baseUrl + 'api/artworks';  

  constructor(private http: HttpClient, private auth: AuthService) {}

  getHttpOptions() {
    return {
      headers: {
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest',
      },
    };
  }

 
  getAllArtworks(): Observable<Artwork[]> {
    return this.http.get<Artwork[]>(this.baseUrl, this.getHttpOptions()).pipe(
      catchError(error => {
        console.error('Error fetching artworks:', error);
        return throwError(error);
      })
    );
  }

 
  showArtwork(artworkId: number): Observable<Artwork> {
    const url = `${this.baseUrl}/${artworkId}`;
    return this.http.get<Artwork>(url, this.getHttpOptions()).pipe(
      catchError(error => {
        console.error(`Error fetching artwork with ID ${artworkId}:`, error);
        return throwError(error);
      })
    );
  }

  
  createArtwork(newArtwork: Artwork): Observable<Artwork> {
    return this.http.post<Artwork>(this.baseUrl, newArtwork, this.getHttpOptions()).pipe(
      catchError(error => {
        console.error('Error creating artwork:', error);
        return throwError(error);
      })
    );
  }

 
  updateArtwork(artworkId: number, updatingArtwork: Artwork): Observable<Artwork> {
    const url = `${this.baseUrl}/${artworkId}`;
    return this.http.put<Artwork>(url, updatingArtwork, this.getHttpOptions()).pipe(
      catchError(error => {
        console.error(`Error updating artwork with ID ${artworkId}:`, error);
        return throwError(error);
      })
    );
  }

 
  deleteArtwork(artworkId: number): Observable<void> {
    const url = `${this.baseUrl}/${artworkId}`;
    return this.http.delete<void>(url, this.getHttpOptions()).pipe(
      catchError(error => {
        console.error(`Error deleting artwork with ID ${artworkId}:`, error);
        return throwError(error);
      })
    );
  }
}
