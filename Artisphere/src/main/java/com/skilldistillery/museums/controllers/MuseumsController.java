package com.skilldistillery.museums.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.artisphere.entities.Museum;
import com.skilldistillery.museums.services.MuseumService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@CrossOrigin({"*", "http://localhost/"})
@RestController
@RequestMapping("api")
public class MuseumController {
    
    @Autowired
    private MuseumService museumService;

    // Get all museums
    @GetMapping("museums")
    public List<Museum> getMuseumList() {
        return museumService.getAllMuseums();
    }

    // Get a single museum by ID
    @GetMapping("museums/{museumId}")
    public Museum showMuseum(@PathVariable("museumId") Integer museumId, HttpServletResponse res) {
        Museum museum = museumService.getMuseumById(museumId);
        if (museum == null) {
            res.setStatus(404);
        }
        return museum;
    }

    // Create a new museum
    @PostMapping("museums")
    public Museum createMuseum(@RequestBody Museum newMuseum, HttpServletRequest req, HttpServletResponse res) {
        try {
            newMuseum = museumService.create(newMuseum);
            res.setStatus(201);
            res.setHeader("Location", req.getRequestURL().append("/").append(newMuseum.getId()).toString());
        } catch (Exception e) {
            e.printStackTrace();
            res.setStatus(400);
        }
        return newMuseum;
    }
}
