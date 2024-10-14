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
	void test_Museums_entity_mapping() {
		assertNotNull(museum);
		assertEquals("Waters-Effertz", museum.getName());
		assertEquals("57 Portage Alley", museum.getLocation());
		assertEquals("Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.",
				museum.getDescription());
		assertEquals(
				"https://google.es/ultrices/aliquet/maecenas/leo/odio.xml?montes=pellentesque&nascetur=at&ridiculus=nulla&mus=suspendisse&etiam=potenti&vel=cras&augue=in&vestibulum=purus&rutrum=eu&rutrum=magna&neque=vulputate&aenean=luctus&auctor=cum&gravida=sociis&sem=natoque&praesent=penatibus&id=et&massa=magnis&id=dis&nisl=parturient&venenatis=montes&lacinia=nascetur&aenean=ridiculus&sit=mus&amet=vivamus&justo=vestibulum&morbi=sagittis&ut=sapien",
				museum.getWebsiteUrl());
		assertEquals("https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/National_Museum_of_Modern_Art_Kyoto_2010.jpg/749px-National_Museum_of_Modern_Art_Kyoto_2010.jpg?20190209061344", museum.getImageUrl());
	}

	@Test
	void test_Museums_OneToMany_Exhibitions_mapping() {
		assertNotNull(museum);
		assertNotNull(museum.getExhibitions());
		assertTrue(museum.getExhibitions().size() > 0);
	}

	@Test
	void test_CRUD_operations_on_Museums() {

		Museum newMuseums = new Museum();
		newMuseums.setName("Test Museum");
		newMuseums.setLocation("123 Test Street");
		newMuseums.setDescription("This is a test museum.");
		newMuseums.setWebsiteUrl("http://testmuseum.com");
		newMuseums.setImageUrl("http://dummyimage.com/test.png");

	}
}
