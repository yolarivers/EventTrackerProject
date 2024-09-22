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
import com.skilldistillery.museums.services.ExhibitionService;

@RestController
@RequestMapping("/api/exhibitions")
public class ExhibitionController {

	@Autowired
	private ExhibitionService exhibitionService;

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

		
		Exhibition newExhibition = new Exhibition();
		newExhibition.setTitle(title);
		newExhibition.setStartDate(LocalDate.parse(startDate));
		newExhibition.setEndDate(LocalDate.parse(endDate));
		newExhibition.setDescription(description);
		newExhibition.setEventImage("/uploads/images/" + fileName);

		exhibitionService.saveExhibition(newExhibition);

		return new ResponseEntity<>(newExhibition, HttpStatus.CREATED);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Exhibition> updateExhibition(@PathVariable int id,
			@RequestParam(value = "file", required = false) MultipartFile file, @RequestParam("title") String title,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@RequestParam("description") String description) {

		Exhibition existingExhibition = exhibitionService.getExhibitionById(id);
		if (existingExhibition != null) {
			existingExhibition.setTitle(title);
			existingExhibition.setStartDate(LocalDate.parse(startDate));
			existingExhibition.setEndDate(LocalDate.parse(endDate));
			existingExhibition.setDescription(description);

			if (file != null && !file.isEmpty()) {
				
				try {
					Files.deleteIfExists(Paths.get(existingExhibition.getEventImage()));
				} catch (IOException e) {
					e.printStackTrace();
					return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				}

			
				String fileName = saveFile(file);
				if (fileName == null) {
					return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
				existingExhibition.setEventImage("/uploads/images/" + fileName);
			}

			exhibitionService.saveExhibition(existingExhibition);
			return new ResponseEntity<>(existingExhibition, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<String> deleteExhibition(@PathVariable int id) {
		boolean isDeleted = exhibitionService.deleteExhibition(id);
		if (isDeleted) {
			return new ResponseEntity<>("Exhibition deleted successfully", HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<>("Exhibition not found", HttpStatus.NOT_FOUND);
		}
	}

	@GetMapping
	public ResponseEntity<List<Exhibition>> getAllExhibitions() {
		List<Exhibition> exhibitions = exhibitionService.getAllExhibitions();
		return new ResponseEntity<>(exhibitions, HttpStatus.OK);
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
