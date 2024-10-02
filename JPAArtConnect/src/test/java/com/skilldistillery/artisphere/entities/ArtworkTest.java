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

class ArtworkTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Artwork artwork;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAArtConnect");
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		artwork = em.find(Artwork.class, 1);
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		artwork = null;
	}

	@Test
	void test_Artwork_entity_mapping() {
		assertNotNull(artwork);
		assertEquals("Starry Night", artwork.getTitle());
		assertEquals("Vincent Van Gogh", artwork.getArtist());
		assertEquals(2003, artwork.getCreationYear());
		assertEquals("Distributed eco-centric pricing structure", artwork.getDescription());
		assertEquals("http://dummyimage.com/171x100.png/5fa2dd/ffffff", artwork.getImage());
	}

	@Test
	void test_Artwork_ManyToOne_User_mapping() {
		assertNotNull(artwork);
		assertNotNull(artwork.getUser());
		assertEquals(1, artwork.getUser().getId());
	}

	@Test
	void test_Artwork_ManyToOne_Museum_mapping() {
		assertNotNull(artwork);
		assertNotNull(artwork.getMuseum());
		assertEquals(3, artwork.getMuseum().getId());
	}

	@Test
	void test_CRUD_operations_on_Artwork() {
		Artwork newArtwork = new Artwork();
		newArtwork.setTitle("Test Artwork");
		newArtwork.setArtist("Test Artist");
		newArtwork.setCreationYear(2024);
		newArtwork.setDescription("Test description for artwork.");
		newArtwork.setImage("http://dummyimage.com/test.png");

	}
}
