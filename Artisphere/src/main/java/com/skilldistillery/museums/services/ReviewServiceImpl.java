package com.skilldistillery.museums.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.artisphere.entities.ArtworkReview;
import com.skilldistillery.museums.repositories.ReviewRepository;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    @Override
    public ArtworkReview saveReview(ArtworkReview artworkReview) {
        return reviewRepository.save(artworkReview);
    }

    @Override
    public ArtworkReview getReviewById(int id) {
        return reviewRepository.findById(id).orElse(null);
    }

    @Override
    public List<ArtworkReview> getAllReviews() {
        return reviewRepository.findAll();
    }

    @Override
    public void deleteReview(int id) {
        reviewRepository.deleteById(id);
    }
}
