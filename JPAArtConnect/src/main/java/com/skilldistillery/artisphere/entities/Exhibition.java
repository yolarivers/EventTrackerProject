package com.skilldistillery.artisphere.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;

@Entity
public class Exhibition {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String title;
    
    @ManyToOne
    @JoinColumn(name = "museum_id")
    private Museum museum;

    private String description;

    @Column(name = "start_date")
    private LocalDate startDate;

    @Column(name = "end_date")
    private LocalDate endDate;

    @Column(name = "image_url")
    private String imageUrl;

    @CreationTimestamp
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
    
    @JoinTable(name = "exhibition_has_artwork", joinColumns = @JoinColumn(name="exhibition_id"), 
               inverseJoinColumns = @JoinColumn(name="artwork_id"))
    @ManyToMany
    @JsonIgnore
    private List<Artwork> artworks = new ArrayList<>(); 
    
  
    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Museum getMuseum() {
		return museum;
	}

	public void setMuseum(Museum museum) {
		this.museum = museum;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Artwork> getArtworks() {
		return artworks;
	}

	public void setArtworks(List<Artwork> artworks) {
		this.artworks = artworks;
	}
	
	public void addArtwork(Artwork artwork) {
	    if (!artworks.contains(artwork)) {
	        artworks.add(artwork);
	       
	    }
	}

	public void removeArtwork(Artwork artwork) {
	    artworks.remove(artwork);
	    
	}

	@Override
	public String toString() {
	    return "Exhibition [id=" + id + ", title=" + title + ", museum=" 
	           + (museum != null ? museum.getName() : "null") + ", startDate=" + startDate 
	           + ", endDate=" + endDate + ", description=" + description + "]";
	}

	@Override
	public boolean equals(Object o) {
	    if (this == o) return true;
	    if (o == null || getClass() != o.getClass()) return false;
	    Exhibition exhibition = (Exhibition) o;
	    return id == exhibition.id;
	}

	@Override
	public int hashCode() {
	    return Objects.hash(id);
	}
}
