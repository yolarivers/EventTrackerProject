import { Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { MuseumComponent } from './components/museums/museum.component';
import { ArtworkComponent } from './components/artwork/artwork.component';
import { ExhibitionComponent } from './components/exhibitions/exhibitions.component';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';


export const routes: Routes = [
    { path: 'home', component: HomeComponent },
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent },
    { path: 'museums', component: MuseumComponent },
    { path: 'artwork', component: ArtworkComponent },
    { path: 'exhibitions', component: ExhibitionComponent },
    { path: '', pathMatch: 'full', redirectTo: 'home' },
    { path: '**', component: NotFoundComponent },
  ];

