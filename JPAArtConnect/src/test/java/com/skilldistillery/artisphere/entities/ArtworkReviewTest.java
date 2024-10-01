package com.skilldistillery.artisphere.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDateTime;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ArtworkReviewTest {

    private ArtworkReview artworkReview;

    @BeforeAll
    static void setUpBeforeClass() throws Exception {
    }

    @AfterAll
    static void tearDownAfterClass() throws Exception {
    }

    @BeforeEach
    void setUp() throws Exception {
    
        artworkReview = new ArtworkReview();
        artworkReview.setId(1);
        artworkReview.setRating(5);
        artworkReview.setComment("Incredible piece of work, truly inspiring!");
        artworkReview.setCreatedAt(LocalDateTime.of(2023, 8, 15, 12, 5, 30));
        artworkReview.setUpdatedAt(LocalDateTime.of(2023, 8, 16, 9, 45, 0));
    }

    @AfterEach
    void tearDown() throws Exception {
        artworkReview = null;  
    }

    @Test
    void testReviewFields() {
  
        assertEquals(1, artworkReview.getId());
        assertEquals(5, artworkReview.getRating());
        assertEquals("Incredible piece of work, truly inspiring!", artworkReview.getComment());
        assertEquals(LocalDateTime.of(2023, 8, 15, 12, 5, 30), artworkReview.getCreatedAt());
        assertEquals(LocalDateTime.of(2023, 8, 16, 9, 45, 0), artworkReview.getUpdatedAt());
    }

    @Test
    void testReviewDefaultConstructor() {
      
        ArtworkReview emptyReview = new ArtworkReview();
        assertNotNull(emptyReview);
        assertNull(emptyReview.getComment());
        assertEquals(0, emptyReview.getRating());
    }
}
