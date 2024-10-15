import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Artwork } from '../models/artwork';
import { ArtworkReview } from '../models/artwork-review';
import { AuthService } from './auth.service';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ArtworkService {

  private baseUrl = environment.baseUrl + 'api/artwork';

  constructor(private http: HttpClient, private auth: AuthService) {}

  getHttpOptions(): { headers: { [header: string]: string } } {
    return {
      headers: {
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest',
      },
    };
  }

  private handleError(operation = 'operation') {
    return (error: any): Observable<never> => {
      console.error(`${operation} failed:`, error);
      return throwError(() => new Error(`${operation} failed: ${error.message}`));
    };
  }

  getAllArtworks(): Observable<Artwork[]> {
    return this.http.get<Artwork[]>(this.baseUrl, this.getHttpOptions()).pipe(
      catchError(this.handleError('fetching all artworks'))
    );
  }

  showArtwork(artworkId: number): Observable<Artwork> {
    const url = `${this.baseUrl}/${artworkId}`;
    return this.http.get<Artwork>(url, this.getHttpOptions()).pipe(
      catchError(this.handleError(`fetching artwork with ID ${artworkId}`))
    );
  }

  createArtwork(newArtwork: Artwork): Observable<Artwork> {
    return this.http.post<Artwork>(this.baseUrl, newArtwork, this.getHttpOptions()).pipe(
      catchError(this.handleError('creating artwork'))
    );
  }

  updateArtwork(artworkId: number, updatingArtwork: Artwork): Observable<Artwork> {
    const url = `${this.baseUrl}/${artworkId}`;
    return this.http.put<Artwork>(url, updatingArtwork, this.getHttpOptions()).pipe(
      catchError(this.handleError(`updating artwork with ID ${artworkId}`))
    );
  }

  deleteArtwork(artworkId: number): Observable<void> {
    const url = `${this.baseUrl}/${artworkId}`;
    return this.http.delete<void>(url, this.getHttpOptions()).pipe(
      catchError(this.handleError(`deleting artwork with ID ${artworkId}`))
    );
  }

  getArtworkReviews(artworkId: number): Observable<ArtworkReview[]> {
    const url = `${this.baseUrl}/${artworkId}/reviews`;
    return this.http.get<ArtworkReview[]>(url, this.getHttpOptions()).pipe(
      catchError(this.handleError(`fetching reviews for artwork with ID ${artworkId}`))
    );
  }
  
}
