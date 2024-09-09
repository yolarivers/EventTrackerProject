package com.skilldistillery.artisphere.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDateTime;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ReviewTest {

    private Review review;

    @BeforeAll
    static void setUpBeforeClass() throws Exception {
    }

    @AfterAll
    static void tearDownAfterClass() throws Exception {
    }

    @BeforeEach
    void setUp() throws Exception {
    
        review = new Review();
        review.setId(1);
        review.setRating(5);
        review.setComment("Incredible piece of work, truly inspiring!");
        review.setCreatedAt(LocalDateTime.of(2023, 8, 15, 12, 5, 30));
        review.setUpdatedAt(LocalDateTime.of(2023, 8, 16, 9, 45, 0));
    }

    @AfterEach
    void tearDown() throws Exception {
        review = null;  
    }

    @Test
    void testReviewFields() {
  
        assertEquals(1, review.getId());
        assertEquals(5, review.getRating());
        assertEquals("Incredible piece of work, truly inspiring!", review.getComment());
        assertEquals(LocalDateTime.of(2023, 8, 15, 12, 5, 30), review.getCreatedAt());
        assertEquals(LocalDateTime.of(2023, 8, 16, 9, 45, 0), review.getUpdatedAt());
    }

    @Test
    void testReviewDefaultConstructor() {
      
        Review emptyReview = new Review();
        assertNotNull(emptyReview);
        assertNull(emptyReview.getComment());
        assertEquals(0, emptyReview.getRating());
    }
}
