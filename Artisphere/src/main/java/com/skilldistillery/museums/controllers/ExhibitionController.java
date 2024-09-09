package com.skilldistillery.museums.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.artisphere.entities.Exhibition;
import com.skilldistillery.museums.services.ExhibitionService;

@RestController
@RequestMapping("/api/exhibitions")
public class ExhibitionController {

    @Autowired
    private ExhibitionService exhibitionService;

    @PostMapping
    public ResponseEntity<Exhibition> createExhibition(@RequestBody Exhibition exhibition) {
        Exhibition newExhibition = exhibitionService.saveExhibition(exhibition);
        return new ResponseEntity<>(newExhibition, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Exhibition> getExhibitionById(@PathVariable int id) {
        Exhibition exhibition = exhibitionService.getExhibitionById(id);
        if (exhibition != null) {
            return new ResponseEntity<>(exhibition, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping
    public ResponseEntity<List<Exhibition>> getAllExhibitions() {
        List<Exhibition> exhibitions = exhibitionService.getAllExhibitions();
        return new ResponseEntity<>(exhibitions, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteExhibition(@PathVariable int id) {
        exhibitionService.deleteExhibition(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
