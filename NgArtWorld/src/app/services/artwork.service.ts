import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
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
    let options = {
      headers: {
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest',
      },
    };
    return options;
  }

  getAllArtworks(): Observable<Artwork[]> {
    return this.http.get<Artwork[]>(this.baseUrl, this.getHttpOptions());
  }

  showArtwork(artworkId: number): Observable<Artwork> {
    const url = `${this.baseUrl}/${artworkId}`;
    return this.http.get<Artwork>(url, this.getHttpOptions());
  }

  createArtwork(newArtwork: Artwork, username: string): Observable<Artwork> {
    const url = `${this.baseUrl}`;
    return this.http.post<Artwork>(url, newArtwork, this.getHttpOptions());
  }

  updateArtwork(artworkId: number, updatingArtwork: Artwork, username: string): Observable<Artwork> {
    const url = `${this.baseUrl}/${artworkId}`;
    return this.http.put<Artwork>(url, updatingArtwork, this.getHttpOptions());
  }

  deleteArtwork(artworkId: number, username: string): Observable<void> {
    const url = `${this.baseUrl}/${artworkId}`;
    return this.http.delete<void>(url, this.getHttpOptions());
  }
}
