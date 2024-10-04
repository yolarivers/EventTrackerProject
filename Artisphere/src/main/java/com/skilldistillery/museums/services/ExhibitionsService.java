package com.skilldistillery.museums.services;

import java.util.List;
import com.skilldistillery.artisphere.entities.Exhibition;

public interface ExhibitionService {
    Exhibition saveExhibition(Exhibition exhibition);
    Exhibition getExhibitionById(int id);
    List<Exhibition> getAllExhibitions();
    boolean deleteExhibition(int id);
}
