package com.skilldistillery.museums.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.artisphere.entities.Museum;
import com.skilldistillery.museums.repositories.MuseumRepository;

@Service
public class MuseumServiceImpl implements MuseumService {

    @Autowired
    private MuseumRepository museumRepo;

    @Override
    public List<Museum> getAllMuseums() {
        return museumRepo.findAll();
    }

    @Override
    public Museum getMuseumById(int id) {
        Optional<Museum> optMuseum = museumRepo.findById(id);
        return optMuseum.orElse(null);
    }

    @Override
    public Museum saveMuseum(Museum museum) {
        return museumRepo.save(museum);
    }

    @Override
    public Museum update(int museumId, Museum updatingMuseum) {
        Optional<Museum> optMuseum = museumRepo.findById(museumId);
        if (optMuseum.isPresent()) {
            Museum existingMuseum = optMuseum.get();
            
            existingMuseum.setName(updatingMuseum.getName());
            existingMuseum.setLocation(updatingMuseum.getLocation());
            existingMuseum.setDescription(updatingMuseum.getDescription());
            existingMuseum.setWebsiteUrl(updatingMuseum.getWebsiteUrl());
            existingMuseum.setImageUrl(updatingMuseum.getImageUrl());

            return museumRepo.save(existingMuseum);
        }
        return null;
    }

    @Override
    public boolean deleteMuseum(int id) {
        if (museumRepo.existsById(id)) {
            museumRepo.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public Museum create(Museum newMuseum) {
        return museumRepo.save(newMuseum);
    }
}
