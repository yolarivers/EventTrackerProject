package com.skilldistillery.museums.services;

import java.util.List;
import com.skilldistillery.artisphere.entities.Review;

public interface ReviewService {
    Review saveReview(Review review);
    Review getReviewById(int id);
    List<Review> getAllReviews();
    void deleteReview(int id);
}