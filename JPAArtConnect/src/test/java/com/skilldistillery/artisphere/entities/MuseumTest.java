package com.skilldistillery.artisphere.entities;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class MuseumTest {

	private Museum museum;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {
		
		museum = new Museum();
		museum.setId(1);
		museum.setName("Art Museum");
		museum.setLocation("New York City");
		museum.setDescription("A world-renowned museum showcasing modern art.");
		museum.setWebsiteUrl("http://www.artmuseum.com");
		museum.setImage("museum_image.jpg");
	}

	@AfterEach
	void tearDown() throws Exception {
		museum = null;  
	}

	@Test
	void testMuseumFields() {
		
		assertEquals(1, museum.getId());
		assertEquals("Art Museum", museum.getName());
		assertEquals("New York City", museum.getLocation());
		assertEquals("A world-renowned museum showcasing modern art.", museum.getDescription());
		assertEquals("http://www.artmuseum.com", museum.getWebsiteUrl());
		assertEquals("museum_image.jpg", museum.getImage());
	}

	@Test
	void testMuseumDefaultConstructor() {
	
		Museum emptyMuseum = new Museum();
		assertNotNull(emptyMuseum);
		assertNull(emptyMuseum.getName());
		assertNull(emptyMuseum.getLocation());
	}
}
