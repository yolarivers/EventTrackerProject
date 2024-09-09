package com.skilldistillery.artisphere.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.time.LocalDate;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ExhibitionTest {
	
	private Exhibition exhibition;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {
	
		exhibition = new Exhibition();
		exhibition.setId(1);
		exhibition.setTitle("Impressionist Masterpieces");
		exhibition.setStartDate(LocalDate.of(2023, 2, 1));
		exhibition.setEndDate(LocalDate.of(2023, 12, 31));
		exhibition.setDescription("A stunning collection of Impressionist art.");
	}

	@AfterEach
	void tearDown() throws Exception {
		exhibition = null;  
	}

	@Test
	void testExhibitionFields() {
		
		assertEquals(1, exhibition.getId());
		assertEquals("Impressionist Masterpieces", exhibition.getTitle());
		assertEquals(LocalDate.of(2023, 2, 1), exhibition.getStartDate());
		assertEquals(LocalDate.of(2023, 12, 31), exhibition.getEndDate());
		assertEquals("A stunning collection of Impressionist art.", exhibition.getDescription());
	}

	@Test
	void testExhibitionDefaultConstructor() {
	
		Exhibition emptyExhibition = new Exhibition();
		assertNotNull(emptyExhibition);
		assertNull(emptyExhibition.getTitle());
		assertNull(emptyExhibition.getDescription());
		assertNull(emptyExhibition.getStartDate());
		assertNull(emptyExhibition.getEndDate());
	}
}
