package com.skilldistillery.museums.services;

import java.util.List;
import com.skilldistillery.artisphere.entities.Museum;

public interface MuseumService {
    Museum saveMuseum(Museum museum);
    Museum getMuseumById(int id);
    List<Museum> getAllMuseums();
    boolean deleteMuseum(int id);
	Museum create(Museum newMuseum);
}