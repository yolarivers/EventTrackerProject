package com.skilldistillery.museums.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.artisphere.entities.Museum;
import com.skilldistillery.museums.services.MuseumService;

@RestController
@RequestMapping("/api")
public class MuseumController {

	@Autowired
	private MuseumService museumService;

	@GetMapping("museums/{id}")
	public ResponseEntity<Museum> getMuseumById(@PathVariable int id) {
		Museum museum = museumService.findById(id);
		if (museum == null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(museum);
	}

	@GetMapping("museums")
	public List<Museum> getMuseumList() {
		return museumService.getAllMuseums();
	}

	@PostMapping("museums")
	public ResponseEntity<Museum> createMuseum(@RequestBody Museum newMuseum) {
		Museum createdMuseum = museumService.create(newMuseum);
		return new ResponseEntity<>(createdMuseum, HttpStatus.CREATED);
	}
}