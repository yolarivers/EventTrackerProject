package com.skilldistillery.museums;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EntityScan(basePackages = "com.skilldistillery.artisphere.entities")
@EnableJpaRepositories(basePackages = "com.skilldistillery.museums.repositories")
@ComponentScan(basePackages = {"com.skilldistillery.museums.controllers", "com.skilldistillery.museums.services"})
public class ArtisphereApplication {

    public static void main(String[] args) {
        SpringApplication.run(ArtisphereApplication.class, args);
    }
}
