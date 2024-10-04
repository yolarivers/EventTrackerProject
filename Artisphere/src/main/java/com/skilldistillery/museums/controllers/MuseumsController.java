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
import com.skilldistillery.museums.services.MuseumsService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@CrossOrigin({"*", "http://localhost/"})
@RestController
@RequestMapping("api")
public class MuseumsController {
    
    @Autowired
    private MuseumsService museumsService;

    @GetMapping("museums")
    public List<Museum> getMuseumsList() {
        return museumsService.getAllMuseums();
    }

    @GetMapping("museums/{museumsId}")
    public Museum getMuseumById(@PathVariable("museumsId") Integer museumsId, HttpServletResponse res) {
        Museum museum = museumsService.getMuseumById(museumsId);
        if (museum == null) {
            res.setStatus(404);
        }
        return museum;
    }

    @PostMapping("museums")
    public Museum createMuseum(@RequestBody Museum newMuseum, HttpServletRequest req, HttpServletResponse res) {
        try {
            newMuseum = museumsService.create(newMuseum);
            res.setStatus(201);
            res.setHeader("Location", req.getRequestURL().append("/").append(newMuseum.getId()).toString());
        } catch (Exception e) {
            res.setStatus(400);
        }
        return newMuseum;
    }
}
