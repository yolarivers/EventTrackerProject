package com.skilldistillery.museums.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.artisphere.entities.Artwork;

public interface ArtworkRepository extends JpaRepository<Artwork, Integer> {
	
	boolean existsByIdAndUser_Username(int id, String username);
}
