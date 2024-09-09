package com.skilldistillery.artisphere.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDateTime;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {

    private User user;

    @BeforeAll
    static void setUpBeforeClass() throws Exception {
    }

    @AfterAll
    static void tearDownAfterClass() throws Exception {
    }

    @BeforeEach
    void setUp() throws Exception {
       
        user = new User();
        user.setId(1);
        user.setUsername("artlover92");
        user.setEmail("artlover92@example.com");
        user.setPassword("password1");
        user.setRole("USER");
        user.setCreatedAt(LocalDateTime.of(2023, 1, 10, 8, 23, 45));
        user.setUpdatedAt(LocalDateTime.of(2024, 3, 20, 14, 10, 21));
    }

    @AfterEach
    void tearDown() throws Exception {
        user = null; 
    }

    @Test
    void testUserFields() {
       
        assertEquals(1, user.getId());
        assertEquals("artlover92", user.getUsername());
        assertEquals("artlover92@example.com", user.getEmail());
        assertEquals("password1", user.getPassword());
        assertEquals("USER", user.getRole());
        assertEquals(LocalDateTime.of(2023, 1, 10, 8, 23, 45), user.getCreatedAt());
        assertEquals(LocalDateTime.of(2024, 3, 20, 14, 10, 21), user.getUpdatedAt());
    }

    @Test
    void testUserDefaultConstructor() {
        
        User emptyUser = new User();
        assertNotNull(emptyUser);
        assertNull(emptyUser.getUsername());
        assertNull(emptyUser.getEmail());
        assertNull(emptyUser.getPassword());
    }
}
