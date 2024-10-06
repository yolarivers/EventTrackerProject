package com.skilldistillery.artisphere.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="exhibition_review")
public class ExhibitionReview {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "exhibition_id")
    private Exhibition exhibition;


    private int rating;

    private String comment;

    @CreationTimestamp
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    
    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

  
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Exhibition getExhibitions() {
        return exhibition;
    }

    public void setExhibitions(Exhibition exhibition) {
        this.exhibition = exhibition;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    
    
    public void updateRating(int newRating) {
        if (newRating >= 1 && newRating <= 5) {
            this.rating = newRating;
        }
    }

    public void updateComment(String newComment) {
        if (newComment != null && !newComment.trim().isEmpty()) {
            this.comment = newComment;
        }
    }


    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
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

  
    @Override
    public String toString() {
        return "ExhibitionReview [id=" + id + ", user=" + (user != null ? user.getUsername() : "null")
               + ", exhibition=" + (exhibition != null ? exhibition.getTitle() : "null")
               + ", rating=" + rating + ", comment=" + comment + "]";
    }


  
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ExhibitionReview exhibitionReview = (ExhibitionReview) o;
        return id == exhibitionReview.id;
        

    }

    @Override
    public int hashCode() {
    	return Objects.hash(user, exhibition, createdAt);
    }
}
