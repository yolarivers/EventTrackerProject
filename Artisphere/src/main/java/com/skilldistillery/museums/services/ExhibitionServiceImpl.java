package com.skilldistillery.museums.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.artisphere.entities.Exhibition;
import com.skilldistillery.museums.repositories.ExhibitionRepository;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {

    @Autowired
    private ExhibitionRepository exhibitionRepository;

    @Override
    public Exhibition saveExhibition(Exhibition exhibition) {
        return exhibitionRepository.save(exhibition);
    }

    @Override
    public Exhibition getExhibitionById(int id) {
        return exhibitionRepository.findById(id).orElse(null);
    }

    @Override
    public List<Exhibition> getAllExhibitions() {
        return exhibitionRepository.findAll();
    }

    @Override
    public void deleteExhibition(int id) {
        exhibitionRepository.deleteById(id);
    }
}
