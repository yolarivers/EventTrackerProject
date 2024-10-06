package com.skilldistillery.museums.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.skilldistillery.artisphere.entities.Exhibition;
import com.skilldistillery.museums.services.ExhibitionsService;

@CrossOrigin({"*", "http://localhost/"})
@RestController
@RequestMapping("/api/exhibitions")
public class ExhibitionsController {

	@Autowired
	private ExhibitionsService exhibitionsService;

	@GetMapping("/test")
	public ResponseEntity<String> test() {
		return new ResponseEntity<>("Test endpoint works!", HttpStatus.OK);
	}

	private final String uploadDir = "src/main/webapp/uploads/images/";

	@PostMapping("/upload")
	public ResponseEntity<Exhibition> handleFileUpload(@RequestParam("file") MultipartFile file,
			@RequestParam("title") String title, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("description") String description) {

		String fileName = saveFile(file);
		if (fileName == null) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		Exhibition newExhibitions = new Exhibition();
		newExhibitions.setTitle(title);
		newExhibitions.setStartDate(LocalDate.parse(startDate));
		newExhibitions.setEndDate(LocalDate.parse(endDate));
		newExhibitions.setDescription(description);
		newExhibitions.setImageUrl("/uploads/images/" + fileName);

		exhibitionsService.saveExhibitions(newExhibitions);

		return new ResponseEntity<>(newExhibitions, HttpStatus.CREATED);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Exhibition> updateExhibitions(@PathVariable int id,
			@RequestParam(value = "file", required = false) MultipartFile file, @RequestParam("title") String title,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@RequestParam("description") String description) {

		Exhibition existingExhibitions = exhibitionsService.getExhibitionsById(id);
		if (existingExhibitions != null) {
			existingExhibitions.setTitle(title);
			existingExhibitions.setStartDate(LocalDate.parse(startDate));
			existingExhibitions.setEndDate(LocalDate.parse(endDate));
			existingExhibitions.setDescription(description);

			if (file != null && !file.isEmpty()) {
				String absoluteImagePath = "src/main/webapp" + existingExhibitions.getImageUrl(); 
				try {
					Files.deleteIfExists(Paths.get(absoluteImagePath));
				} catch (IOException e) {
					e.printStackTrace();
					return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				}

				String fileName = saveFile(file);
				if (fileName == null) {
					return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
				existingExhibitions.setImageUrl("/uploads/images/" + fileName);
			}

			exhibitionsService.saveExhibitions(existingExhibitions);
			return new ResponseEntity<>(existingExhibitions, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<String> deleteExhibitions(@PathVariable int id) {
		boolean isDeleted = exhibitionsService.deleteExhibitions(id);
		if (isDeleted) {
			return new ResponseEntity<>("Exhibition deleted successfully", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("Exhibition not found", HttpStatus.NOT_FOUND);
		}
	}

	@GetMapping
	public ResponseEntity<List<Exhibition>> getAllExhibitions() {
		List<Exhibition> exhibition = exhibitionsService.getAllExhibitions();
		return new ResponseEntity<>(exhibition, HttpStatus.OK);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Exhibition> getExhibitionsById(@PathVariable int id) {
		Exhibition exhibition = exhibitionsService.getExhibitionsById(id);
		if (exhibition != null) {
			return new ResponseEntity<>(exhibition, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	private String saveFile(MultipartFile file) {
		String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		Path filePath = Paths.get(uploadDir, fileName);
		try {
			Files.createDirectories(Paths.get(uploadDir));
			Files.write(filePath, file.getBytes());
			return fileName;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
}