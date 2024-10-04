package com.skilldistillery.museums.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.artisphere.entities.Exhibition;
import com.skilldistillery.museums.repositories.ExhibitionsRepository;

@Service
public class ExhibitionsServiceImpl implements ExhibitionsService {

    @Autowired
    private ExhibitionsRepository exhibitionsRepository;

    @Override
    public Exhibition saveExhibitions(Exhibition exhibition) {
        return exhibitionsRepository.save(exhibition);
    }

    @Override
    public Exhibition getExhibitionsById(int id) {
        Optional<Exhibition> opt = exhibitionsRepository.findById(id);
        if (opt.isPresent()) {
            return opt.get();
        }
        return null;
    }

    @Override
    public List<Exhibition> getAllExhibitions() {
        return exhibitionsRepository.findAll();
    }

    @Override
    public boolean deleteExhibitions(int id) {
        if (exhibitionsRepository.existsById(id)) {
            exhibitionsRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
