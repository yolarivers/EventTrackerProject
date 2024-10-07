package com.skilldistillery.museums.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.artisphere.entities.Exhibition;
import com.skilldistillery.museums.repositories.ExhibitionRepository;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {

    @Autowired
    private ExhibitionRepository exhibitionRepo;

    @Override
    public Exhibition saveExhibition(Exhibition exhibition) {
        return exhibitionRepo.save(exhibition);
    }

    @Override
    public Exhibition getExhibitionById(int id) {
        return exhibitionRepo.findById(id).orElse(null);
    }

    @Override
    public List<Exhibition> getAllExhibitions() {
        return exhibitionRepo.findAll();
    }

    @Override
    public boolean deleteExhibition(int id) {
        if (exhibitionRepo.existsById(id)) {
            exhibitionRepo.deleteById(id);
            return true;
        }
        return false;
    }
}
