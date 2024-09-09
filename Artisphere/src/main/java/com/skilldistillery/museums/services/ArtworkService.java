package com.skilldistillery.museums.services;

import java.util.List;
import com.skilldistillery.artisphere.entities.Artwork;

public interface ArtworkService {

    List<Artwork> getAllArtworks();
    Artwork showArtwork(int artworkId);
    Artwork create(Artwork newArtwork);
    Artwork update(int artworkId, Artwork updatingArtwork);
    boolean delete(int artworkId);
}
