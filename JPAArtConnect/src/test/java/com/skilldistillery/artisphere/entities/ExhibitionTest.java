package com.skilldistillery.artisphere.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import java.time.LocalDate;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class ExhibitionTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Exhibition exhibition;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAArtConnect");
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		exhibition = em.find(Exhibition.class, 1);
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@Test
	void test_Exhibitions_entity_mapping() {
		assertNotNull(exhibition);
		assertEquals("Submerged", exhibition.getTitle());
		assertEquals("Solo art exhibition Submerged", exhibition.getDescription());
		assertEquals(LocalDate.of(2024, 10, 8), exhibition.getStartDate());
		assertEquals("https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Robert_Standish_Submerged_solo_art_exhibition_at_Shoshana_Wayne_Gallery_in_Santa_Monica%2C_California_in_2004.jpg/800px-Robert_Standish_Submerged_solo_art_exhibition_at_Shoshana_Wayne_Gallery_in_Santa_Monica%2C_California_in_2004.jpg?20240222170440", exhibition.getImageUrl());
	}

	@Test
	void test_Exhibition_ManyToOne_Museum_mapping() {
		assertNotNull(exhibition);
		assertNotNull(exhibition.getMuseum());
		assertEquals(1, exhibition.getMuseum().getId());
	}

	@Test
	void test_Exhibition_ManyToMany_Artworks_mapping() {
		assertNotNull(exhibition);
		assertNotNull(exhibition.getArtworks());
	}

	@Test
	void test_CRUD_operations_on_Exhibitions() {
		Exhibition newExhibitions = new Exhibition();

		newExhibitions.setTitle("Test Expo");
		newExhibitions.setDescription("Testing creation");
		newExhibitions.setStartDate(LocalDate.of(2025, 1, 1));
		newExhibitions.setEndDate(LocalDate.of(2025, 12, 31));

	}
}
