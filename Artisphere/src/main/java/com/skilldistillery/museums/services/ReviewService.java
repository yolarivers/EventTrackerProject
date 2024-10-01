package com.skilldistillery.museums.services;

import java.util.List;
import com.skilldistillery.artisphere.entities.ArtworkReview;

public interface ReviewService {
    ArtworkReview saveReview(ArtworkReview artworkReview);
    ArtworkReview getReviewById(int id);
    List<ArtworkReview> getAllReviews();
    void deleteReview(int id);
}