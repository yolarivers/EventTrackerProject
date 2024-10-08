package com.skilldistillery.artisphere.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class ArtworkReviewTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private ArtworkReview review;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAArtConnect");
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		review = em.find(ArtworkReview.class, 1);
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_ArtworkReview_entity_mapping() {
		assertNotNull(review);
		assertEquals(5, review.getRating());

	}

	@Test
	void test_ArtworkReview_ManyToOne_User_mapping() {
		assertNotNull(review);
		assertNotNull(review.getUser());
		assertEquals(1, review.getUser().getId());
	}

	@Test
	void test_ArtworkReview_ManyToOne_Artwork_mapping() {
		assertNotNull(review);
		assertNotNull(review.getArtwork());
		assertEquals(1, review.getArtwork().getId());
	}

}