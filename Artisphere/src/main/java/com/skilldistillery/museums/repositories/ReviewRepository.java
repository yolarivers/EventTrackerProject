package com.skilldistillery.museums.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.skilldistillery.artisphere.entities.ArtworkReview;

@Repository
public interface ReviewRepository extends JpaRepository<ArtworkReview, Integer> {

    List<ArtworkReview> findByArtwork_Id(int artworkId);

    List<ArtworkReview> findByUser_Username(String username);

    List<ArtworkReview> findByRatingGreaterThanEqual(int rating);
}
