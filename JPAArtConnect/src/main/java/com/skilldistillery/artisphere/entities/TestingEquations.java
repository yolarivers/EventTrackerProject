package com.skilldistillery.artisphere.entities;

public class TestingEquations {

    public static void main(String[] args) {
      
        System.out.println("Addition: " + add(5, 3));              
        System.out.println("Subtraction: " + subtract(10, 7));    
        System.out.println("Multiplication: " + multiply(4, 6));  
        System.out.println("Division: " + divide(20, 4));          
        System.out.println("Modulus: " + modulus(15, 4));          
    }
    

    public static int add(int a, int b) {
        return a + b;
    }

   
    public static int subtract(int a, int b) {
        return a - b;
    }

   
    public static int multiply(int a, int b) {
        return a * b;
    }

   
    public static int divide(int a, int b) {
        if (b == 0) {
            System.out.println("Error: Division by zero!");
            return 0;  
        }
        return a / b;
    }

   
    public static int modulus(int a, int b) {
        return a % b;
    }
}
