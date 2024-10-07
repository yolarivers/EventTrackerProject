package com.skilldistillery.museums.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.artisphere.entities.Artwork;
import com.skilldistillery.museums.services.ArtworkService;

@CrossOrigin({"*", "http://localhost/"})
@RequestMapping("/api")
@RestController
public class ArtworkController {

    @Autowired
    private ArtworkService artworkService;

  
    @GetMapping("artwork")
    public List<Artwork> getAllArtworks() {
        return artworkService.getAllArtworks();
    }

    @GetMapping("artwork/{id}")
    public ResponseEntity<Artwork> getArtworkById(@PathVariable int id) {
        Artwork artwork = artworkService.showArtwork(id);
        if (artwork == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(artwork, HttpStatus.OK);
    }

    @PostMapping("artwork")
    public ResponseEntity<Artwork> createArtwork(@RequestBody Artwork newArtwork, Principal principal) {
    	
        Artwork createdArtwork = artworkService.create(newArtwork, principal.getName());
        return new ResponseEntity<>(createdArtwork, HttpStatus.CREATED);
    }

    @PutMapping("artwork/{id}")
    public ResponseEntity<Artwork> updateArtwork(@PathVariable int id, @RequestBody Artwork updatingArtwork, Principal principal) {
        Artwork updatedArtwork = artworkService.update(id, updatingArtwork, principal.getName());
        if (updatedArtwork == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(updatedArtwork, HttpStatus.OK);
    }

    @DeleteMapping("artwork/{id}")
    public ResponseEntity<Void> deleteArtwork(@PathVariable int id, Principal principal) {
        boolean deleted = artworkService.delete(id, principal.getName());
        if (deleted) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}