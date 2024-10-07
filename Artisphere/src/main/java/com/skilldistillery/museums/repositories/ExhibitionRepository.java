package com.skilldistillery.museums.repositories;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.skilldistillery.artisphere.entities.Exhibition;

@Repository
public interface ExhibitionRepository extends JpaRepository<Exhibition, Integer> {
    
    Set<Exhibition> findByMuseum_Id(int museumId);
}
