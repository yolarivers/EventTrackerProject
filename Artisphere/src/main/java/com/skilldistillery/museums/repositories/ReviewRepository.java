package com.skilldistillery.museums.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.skilldistillery.artisphere.entities.Review;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Integer> {

}
