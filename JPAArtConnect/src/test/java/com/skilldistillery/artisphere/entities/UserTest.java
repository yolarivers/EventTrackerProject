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

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAArtConnect");
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		user = em.find(User.class, 1);
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
	void test_User_entity_mapping() {
		assertNotNull(user);
		assertEquals("gbetterton0", user.getUsername());
		assertEquals("plestrange0@mapy.cz", user.getEmail());
		assertEquals("user", user.getRole());
		assertTrue(user.getEnabled());
	}

	@Test
	void test_Museum_OneToMany_Exhibitions_mapping() {
		assertNotNull(user);
		assertNotNull(user.getArtworks());
		assertTrue(user.getArtworks().size()>0);
	}
}
