package com.skilldistillery.museums.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.artisphere.entities.ArtworkReview;
import com.skilldistillery.museums.services.ReviewService;

@RestController
@RequestMapping("/api/review")
@CrossOrigin({"*", "http://localhost/"})
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @PostMapping
    public ResponseEntity<ArtworkReview> createReview(@RequestBody ArtworkReview artworkReview) {
        ArtworkReview createdReview = reviewService.saveReview(artworkReview);
        return new ResponseEntity<>(createdReview, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ArtworkReview> getReviewById(@PathVariable int id) {
        ArtworkReview artworkReview = reviewService.getReviewById(id);
        if (artworkReview != null) {
            return new ResponseEntity<>(artworkReview, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping
    public ResponseEntity<List<ArtworkReview>> getAllReviews() {
        List<ArtworkReview> artworkReviews = reviewService.getAllReviews();
        return new ResponseEntity<>(artworkReviews, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteReview(@PathVariable int id) {
        reviewService.deleteReview(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}