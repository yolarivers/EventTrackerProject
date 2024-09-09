package com.skilldistillery.artisphere.entities;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ArtworkTest {

	private Artwork artwork;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {
		artwork = new Artwork();
		artwork.setId(1);
		artwork.setTitle("Starry Night");
		artwork.setArtist("Vincent van Gogh");
		artwork.setCreationYear(1889);
		artwork.setDescription("A famous painting by Vincent van Gogh.");
		artwork.setImage("starry_night.jpg");
	}

	@AfterEach
	void tearDown() throws Exception {
		artwork = null;
	}

	@Test
	void testArtworkFields() {
		assertEquals(1, artwork.getId());
		assertEquals("Starry Night", artwork.getTitle());
		assertEquals("Vincent van Gogh", artwork.getArtist());
		assertEquals(1889, artwork.getCreationYear());
		assertEquals("A famous painting by Vincent van Gogh.", artwork.getDescription());
		assertEquals("starry_night.jpg", artwork.getImage());
	}

	@Test
	void testArtworkDefaultConstructor() {
		Artwork emptyArtwork = new Artwork();
		assertNotNull(emptyArtwork);
		assertNull(emptyArtwork.getTitle());
		assertNull(emptyArtwork.getArtist());
		assertEquals(0, emptyArtwork.getCreationYear());
		assertNull(emptyArtwork.getDescription());
		assertNull(emptyArtwork.getImage());
	}
}
