package com.skilldistillery.museums.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.artisphere.entities.Museum;

public interface MuseumsRepository extends JpaRepository<Museum, Integer> {
}
