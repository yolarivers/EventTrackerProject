package com.skilldistillery.museums.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.skilldistillery.artisphere.entities.Artwork;

@Repository
public interface ArtworkRepository extends JpaRepository<Artwork, Integer> {
}
