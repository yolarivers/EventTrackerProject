import { Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { MuseumsComponent } from './components/museums/museums.component';
import { ArtworkComponent } from './components/artwork/artwork.component';
import { ExhibitionsComponent } from './components/exhibitions/exhibitions.component';
import { NotFoundComponent } from './components/not-found/not-found.component';


export const routes: Routes = [
    { path: 'home', component: HomeComponent },
    { path: 'museums', component: MuseumsComponent },
    { path: 'artwork', component: ArtworkComponent },
    { path: 'exhibitions', component: ExhibitionsComponent },
    { path: '', pathMatch: 'full', redirectTo: 'home' },
    { path: '**', component: NotFoundComponent },
  ];

