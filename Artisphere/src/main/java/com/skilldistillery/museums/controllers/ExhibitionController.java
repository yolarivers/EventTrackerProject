package com.skilldistillery.museums.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.skilldistillery.artisphere.entities.Exhibition;
import com.skilldistillery.museums.services.ExhibitionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@CrossOrigin({ "*", "http://localhost/" })
@RestController
@RequestMapping("/api/exhibitions")
public class ExhibitionController {

	private static final Logger logger = LoggerFactory.getLogger(ExhibitionController.class);

	@Autowired
	private ExhibitionService exhibitionService;

	private final String uploadDir = "src/main/webapp/uploads/images/";
	private final String imageUrlBasePath = "/uploads/images/";

	@GetMapping("/test")
	public ResponseEntity<String> test() {
		return new ResponseEntity<>("Test endpoint works!", HttpStatus.OK);
	}

	@PostMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
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
		newExhibition.setImageUrl(imageUrlBasePath + fileName);

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
				Path oldImagePath = Paths.get("src/main/webapp" + existingExhibition.getImageUrl());
				try {
					Files.deleteIfExists(oldImagePath);
				} catch (IOException e) {
					logger.error("Failed to delete existing image file: " + oldImagePath, e);
					return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				}

				String fileName = saveFile(file);
				if (fileName == null) {
					return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
				existingExhibition.setImageUrl(imageUrlBasePath + fileName);
			}

			exhibitionService.saveExhibition(existingExhibition);
			return new ResponseEntity<>(existingExhibition, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@DeleteMapping("/{id}")
	public void deleteExhibition(@PathVariable("id") int id) {
		boolean isDeleted = exhibitionService.deleteExhibition(id);
		
	}

	@GetMapping
	public ResponseEntity<List<Exhibition>> getAllExhibitions() {
		List<Exhibition> exhibitions = exhibitionService.getAllExhibitions();
		return new ResponseEntity<>(exhibitions, HttpStatus.OK);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Exhibition> getExhibitionById(@PathVariable int id) {
		Exhibition exhibition = exhibitionService.getExhibitionById(id);
		return exhibition != null ? new ResponseEntity<>(exhibition, HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}

	@PostMapping()
	public Exhibition createExhibition(@RequestBody Exhibition newExhibition, HttpServletRequest req,
			HttpServletResponse res, Principal principal) {
		try {
			newExhibition = exhibitionService.saveExhibition(newExhibition);
			res.setStatus(201);
			res.setHeader("Location", req.getRequestURL().append("/").append(newExhibition.getId()).toString());
		} catch (Exception e) {
			res.setStatus(400);
		}
		return newExhibition;
	}

	private String saveFile(MultipartFile file) {
		String fileName = UUID.randomUUID().toString() + "_"
				+ Paths.get(file.getOriginalFilename()).getFileName().toString();
		Path filePath = Paths.get(uploadDir, fileName);
		try {
			Files.createDirectories(Paths.get(uploadDir));
			Files.write(filePath, file.getBytes());
			return fileName;
		} catch (IOException e) {
			logger.error("Failed to save file", e);
			return null;
		}
	}
}
