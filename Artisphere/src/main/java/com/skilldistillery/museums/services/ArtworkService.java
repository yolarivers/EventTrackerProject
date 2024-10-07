package com.skilldistillery.museums.services;

import java.util.List;
import com.skilldistillery.artisphere.entities.Artwork;

public interface ArtworkService {
    List<Artwork> getAllArtworks();
    Artwork showArtwork(int artworkId);
    Artwork create(Artwork newArtwork, String username );
    Artwork update(int artworkId, Artwork updatingArtwork, String username);
    boolean delete(int artworkId,String username);
    Artwork findById(int id);
}
