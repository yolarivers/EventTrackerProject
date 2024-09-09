package com.skilldistillery.museums.services;

import java.util.List;

import com.skilldistillery.artisphere.entities.Museum;

public interface MuseumService {
	
	List<Museum> getAllMuseums();
	Museum showMuseum(int museumId);
	Museum create(Museum newMuseum);
	Museum update(int museumId, Museum updatingMuseum);
	boolean delete(int caveId);
	
}
