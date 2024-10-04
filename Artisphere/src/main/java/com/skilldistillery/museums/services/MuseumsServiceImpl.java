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

    public List<Museum> getAllMuseums() {
        return museumRepo.findAll();
    }

    public Museum showMuseum(int museumId) {
        Optional<Museum> optMuseum = museumRepo.findById(museumId);
        if (optMuseum.isPresent()) {
            return optMuseum.get();
        }
        return null; 
    }

    public Museum create(Museum newMuseum) {
        return museumRepo.save(newMuseum);
    }

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

    public boolean delete(int museumId) {
        if (museumRepo.existsById(museumId)) {
            museumRepo.deleteById(museumId);
            return true;
        }
        return false;
    }

    public Museum findById(int id) {
        Optional<Museum> optMuseum = museumRepo.findById(id);
        if (optMuseum.isPresent()) {
            return optMuseum.get();
        }
        return null;  


	
	}

	public static void main(String[] args) {
		
	}

	@Override
	public Museum saveMuseum(Museum museum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Museum getMuseumById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteMuseum(int id) {
		// TODO Auto-generated method stub
		return false;
	}
}
