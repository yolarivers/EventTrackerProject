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
    private ExhibitionRepository exhibitionRepository;

    @Override
    public Exhibition saveExhibition(Exhibition exhibition) {
        return exhibitionRepository.save(exhibition);
    }

    @Override
    public Exhibition getExhibitionById(int id) {
        Optional<Exhibition> opt = exhibitionRepository.findById(id);
        if (opt.isPresent()) {
            return opt.get();
        }
        return null;
    }

    @Override
    public List<Exhibition> getAllExhibitions() {
        return exhibitionRepository.findAll();
    }

    @Override
    public boolean deleteExhibition(int id) {
        if (exhibitionRepository.existsById(id)) {
            exhibitionRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
