import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { ArtworkComponent } from './components/artwork/artwork.component';
import { CardComponent } from './components/card/card.component';
import { ExhibitionsComponent } from './components/exhibitions/exhibitions.component';
import { FooterComponent } from './components/footer/footer.component';
import { MuseumFormComponent } from './components/museum-form/museum-form.component';
import { MuseumListComponent } from './components/museum-list/museum-list.component';
import { MuseumsComponent } from './components/museums/museums.component';
import { NavbarComponent } from './components/navbar/navbar.component';

@NgModule({
  declarations: [
    AppComponent,
    ArtworkComponent,
    CardComponent,
    ExhibitionsComponent,
    FooterComponent,
    MuseumFormComponent,
    MuseumListComponent,
    MuseumsComponent,
    NavbarComponent
  ],
  imports: [
    BrowserModule,

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
