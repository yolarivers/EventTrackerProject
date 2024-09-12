package com.skilldistillery.museums.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.artisphere.entities.Museum;
import com.skilldistillery.museums.services.MuseumService;

@RestController
@RequestMapping("/api/museums")
public class MuseumController {

    @Autowired
    private MuseumService museumService;

  
    @GetMapping("/{id}")
    public ResponseEntity<Museum> getMuseumById(@PathVariable int id) {
        Museum museum = museumService.findById(id);
        if (museum == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(museum);
    }
}