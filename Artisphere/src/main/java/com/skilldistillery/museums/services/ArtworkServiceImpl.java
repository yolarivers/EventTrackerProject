package com.skilldistillery.museums.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.artisphere.entities.Artwork;
import com.skilldistillery.museums.repositories.ArtworkRepository;

@Service
public class ArtworkServiceImpl implements ArtworkService {

    @Autowired
    private ArtworkRepository artworkRepo;

    @Override
    public List<Artwork> getAllArtworks() {
        return artworkRepo.findAll();
    }

    @Override
    public Artwork showArtwork(int artworkId) {
        Optional<Artwork> opt = artworkRepo.findById(artworkId);
        if (opt.isPresent()) {
            return opt.get();
        }
        return null;
    }

    @Override
    public Artwork create(Artwork newArtwork) {
        return artworkRepo.save(newArtwork);
    }

    @Override
    public Artwork update(int artworkId, Artwork updatingArtwork) {
        Optional<Artwork> opt = artworkRepo.findById(artworkId);
        if (opt.isPresent()) {
            Artwork managedArtwork = opt.get();
            managedArtwork.setTitle(updatingArtwork.getTitle());
            managedArtwork.setArtist(updatingArtwork.getArtist());
            managedArtwork.setDescription(updatingArtwork.getDescription());
            managedArtwork.setImage(updatingArtwork.getImage());
            managedArtwork.setCreationYear(updatingArtwork.getCreationYear());
          
            return artworkRepo.save(managedArtwork);
        }
        return null;
    }

    @Override
    public boolean delete(int artworkId) {
        boolean deleted = false;
        if (artworkRepo.existsById(artworkId)) {
            artworkRepo.deleteById(artworkId);
            deleted = true;
        }
        return deleted;
    }
}
