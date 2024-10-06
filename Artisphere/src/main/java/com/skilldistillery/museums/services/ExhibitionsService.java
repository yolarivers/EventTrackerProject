package com.skilldistillery.museums.services;

import java.util.List;
import com.skilldistillery.artisphere.entities.Exhibition;

public interface ExhibitionsService {
    Exhibition saveExhibitions(Exhibition exhibition);
    Exhibition getExhibitionsById(int id);
    List<Exhibition> getAllExhibitions();
    boolean deleteExhibitions(int id);
}