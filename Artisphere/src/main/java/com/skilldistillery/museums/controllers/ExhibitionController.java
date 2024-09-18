package com.skilldistillery.museums.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
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

@RestController
@RequestMapping("/api/exhibitions")
public class ExhibitionController {

    @Autowired
    private ExhibitionService exhibitionService;

    @PostMapping("/upload")
    public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file,
                                   @RequestParam("title") String title,
                                   @RequestParam("startDate") String startDate,
                                   @RequestParam("endDate") String endDate,
                                   @RequestParam("description") String description,
                                   Model model) {

        String uploadDir = "src/main/webapp/uploads/images/";
        String fileName = file.getOriginalFilename();
        Path filePath = Paths.get(uploadDir, fileName);

        try {
           
            Files.createDirectories(Paths.get(uploadDir));
            Files.write(filePath, file.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
            return new ResponseEntity<>("Error uploading file", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        Exhibition newExhibition = new Exhibition();
        newExhibition.setTitle(title);
        newExhibition.setStartDate(LocalDate.parse(startDate));
        newExhibition.setEndDate(LocalDate.parse(endDate));
        newExhibition.setDescription(description);
        newExhibition.setImage("/uploads/images/" + fileName);

        exhibitionService.saveExhibition(newExhibition);
        model.addAttribute("filePath", "/uploads/images/" + fileName);

        return new ResponseEntity<>("Exhibition created successfully", HttpStatus.CREATED);
    }
 


   
    @PutMapping("/{id}")
    public ResponseEntity<Exhibition> updateExhibition(@PathVariable int id,
                                                       @RequestParam(value = "file", required = false) MultipartFile file,
                                                       @RequestParam("title") String title,
                                                       @RequestParam("startDate") String startDate,
                                                       @RequestParam("endDate") String endDate,
                                                       @RequestParam("description") String description) {

        Exhibition existingExhibition = exhibitionService.getExhibitionById(id);
        if (existingExhibition != null) {
            existingExhibition.setTitle(title);
            existingExhibition.setStartDate(LocalDate.parse(startDate));
            existingExhibition.setEndDate(LocalDate.parse(endDate));
            existingExhibition.setDescription(description);

            
            if (file != null && !file.isEmpty()) {
                Path oldFilePath = Paths.get(existingExhibition.getImage());
                try {
                    Files.deleteIfExists(oldFilePath);  
                } catch (IOException e) {
                    e.printStackTrace();
                }

               
                String uploadDir = "src/main/webapp/uploads/images/";
                String fileName = file.getOriginalFilename();
                Path newFilePath = Paths.get(uploadDir, fileName);

                try {
                    Files.createDirectories(Paths.get(uploadDir)); 
                    Files.write(newFilePath, file.getBytes());
                    existingExhibition.setImage("/uploads/images/" + fileName);  
                } catch (IOException e) {
                    e.printStackTrace();
                    return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
                }
            }

            exhibitionService.saveExhibition(existingExhibition);
            return new ResponseEntity<>(existingExhibition, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteExhibition(@PathVariable int id) {
        boolean isDeleted = exhibitionService.deleteExhibition(id);
        if (isDeleted) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
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
}
