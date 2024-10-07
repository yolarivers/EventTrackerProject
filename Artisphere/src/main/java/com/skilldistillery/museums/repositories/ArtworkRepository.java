package com.skilldistillery.museums.repositories;

import java.util.Optional;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.skilldistillery.artisphere.entities.Artwork;

@Repository
public interface ArtworkRepository extends JpaRepository<Artwork, Integer> {
    Set<Artwork> findByUser_Username(String username);
    
    Optional<Artwork> findByIdAndUser_Username(int id, String username);
}
