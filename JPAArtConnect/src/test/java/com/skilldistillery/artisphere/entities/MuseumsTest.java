package com.skilldistillery.artisphere.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class MuseumTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Museum museum;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAArtConnect");
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		museum = em.find(Museum.class, 1);
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
	void test_Museum_entity_mapping() {
		assertNotNull(museum);
		assertEquals("Waters-Effertz", museum.getName());
		assertEquals("57 Portage Alley", museum.getLocation());
		assertEquals("Nunc nisl. Duis bibendum, felis sed vehicula tempus, felis justo fermentum justo. ",
				museum.getDescription());
		assertEquals(
				"https://google.es/ultrices/aliquet/maecenas/leo/odio.xml?montes=pellentesque&nascetur=at&ridiculus=nulla&mus=suspendisse&etiam=potenti&vel=cras&augue=in&vestibulum=purus&rutrum=eu&rutrum=magna&neque=vulputate&aenean=luctus&auctor=cum&gravida=sociis&sem=natoque&praesent=penatibus&id=et&massa=magnis&id=dis&nisl=parturient&venenatis=montes&lacinia=nascetur&aenean=ridiculus&sit=mus&amet=vivamus&justo=vestibulum&morbi=sagittis&ut=sapien",
				museum.getWebsiteUrl());
		assertEquals("http://dummyimage.com/118x100.png/ff4444/ffffff", museum.getImageUrl());
	}

	@Test
	void test_Museum_OneToMany_Exhibitions_mapping() {
		assertNotNull(museum);
		assertNotNull(museum.getExhibitions());
		assertTrue(museum.getExhibitions().size() > 0);
	}

	@Test
	void test_CRUD_operations_on_Museum() {

		Museum newMuseum = new Museum();
		newMuseum.setName("Test Museum");
		newMuseum.setLocation("123 Test Street");
		newMuseum.setDescription("This is a test museum.");
		newMuseum.setWebsiteUrl("http://testmuseum.com");
		newMuseum.setImageUrl("http://dummyimage.com/test.png");

	}
}
