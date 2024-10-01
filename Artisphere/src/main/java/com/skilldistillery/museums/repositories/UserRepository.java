package com.skilldistillery.museums.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.skilldistillery.artisphere.entities.User;


public interface UserRepository extends JpaRepository<User, Integer> {
   
    User findByUsername(String username);

	User findByUsernameAndPassword(String username, String password);
}
