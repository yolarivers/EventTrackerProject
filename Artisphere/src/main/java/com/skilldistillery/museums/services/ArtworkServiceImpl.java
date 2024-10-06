package com.skilldistillery.museums.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.artisphere.entities.Artwork;
import com.skilldistillery.artisphere.entities.User;
import com.skilldistillery.museums.repositories.ArtworkRepository;
import com.skilldistillery.museums.repositories.UserRepository;

@Service
public class ArtworkServiceImpl implements ArtworkService {

	@Autowired
	private ArtworkRepository artworkRepo;

	@Autowired
	private UserRepository userRepo;

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
	public Artwork create(Artwork newArtwork, String username) {
		User user = userRepo.findByUsername(username);
		if (user != null) {
			newArtwork.setUser(user);
			return artworkRepo.save(newArtwork);
		}

		return null;
	}

	@Override
	public Artwork update(int artworkId, Artwork updatingArtwork, String username) {
		Optional<Artwork> opt = artworkRepo.findById(artworkId);
		if (opt.isPresent()&& opt.get().getUser().getUsername().equals(username)) {
			Artwork managedArtwork = opt.get();

			managedArtwork.setTitle(updatingArtwork.getTitle());
			managedArtwork.setArtist(updatingArtwork.getArtist());
			managedArtwork.setDescription(updatingArtwork.getDescription());
			managedArtwork.setImageUrl(updatingArtwork.getImageUrl());
			managedArtwork.setCreationYear(updatingArtwork.getCreationYear());

			return artworkRepo.save(managedArtwork);
		}
		return null;
	}

	@Override
	public boolean delete(int artworkId, String username) {
		if (artworkRepo.existsByIdAndUser_Username(artworkId, username)) {
			artworkRepo.deleteById(artworkId);
			return true;
		}
		return false;
	}

	@Override
	public Artwork findById(int id) {

		return null;
	}
}
