import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Exhibition } from '../models/exhibition';
import { AuthService } from './auth.service';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ExhibitionsService {

  private baseUrl = environment.baseUrl + 'api/exhibitions';  

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

  getAllExhibitions(): Observable<Exhibition[]> {
    return this.http.get<Exhibition[]>(this.baseUrl, this.getHttpOptions());
  }

  getExhibitionsById(exhibitionId: number): Observable<Exhibition> {
    const url = `${this.baseUrl}/${exhibitionId}`;
    return this.http.get<Exhibition>(url, this.getHttpOptions());
  }

  saveExhibitions(newExhibition: Exhibition): Observable<Exhibition> {
    console.log(newExhibition);
    return this.http.post<Exhibition>(this.baseUrl, newExhibition, this.getHttpOptions());
  }

  deleteExhibitions(exhibitionId: number): Observable<void> {
    const url = `${this.baseUrl}/${exhibitionId}`;
    return this.http.delete<void>(url, this.getHttpOptions());
  }
}
