package com.skilldistillery.artisphere.entities;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class TestingEquationsTest {

    @Test
    public void testAdd() {
        assertEquals(8, TestingEquations.add(5, 3));
        assertEquals(0, TestingEquations.add(0, 0));
        assertEquals(-2, TestingEquations.add(-1, -1));
    }

    @Test
    public void testSubtract() {
        assertEquals(3, TestingEquations.subtract(10, 7));
        assertEquals(0, TestingEquations.subtract(5, 5));
        assertEquals(-5, TestingEquations.subtract(0, 5));
    }

    @Test
    public void testMultiply() {
        assertEquals(24, TestingEquations.multiply(4, 6));
        assertEquals(0, TestingEquations.multiply(0, 5));
        assertEquals(-15, TestingEquations.multiply(3, -5));
    }

    @Test
    public void testDivide() {
        assertEquals(5, TestingEquations.divide(20, 4));
        assertEquals(0, TestingEquations.divide(0, 5));
        
      
        assertEquals(0, TestingEquations.divide(5, 0)); 
    }

    @Test
    public void testModulus() {
        assertEquals(3, TestingEquations.modulus(15, 4));
        assertEquals(0, TestingEquations.modulus(12, 6));
        assertEquals(1, TestingEquations.modulus(7, 3));
    }
}