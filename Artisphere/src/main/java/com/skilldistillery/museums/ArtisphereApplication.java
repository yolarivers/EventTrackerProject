package com.skilldistillery.museums;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
@EntityScan(basePackages = "com.skilldistillery.artisphere.entities")

public class ArtisphereApplication {
	
	@Bean
	  protected PasswordEncoder configurePasswordEncoder() {
	    return new BCryptPasswordEncoder();
	  }


    public static void main(String[] args) {
        SpringApplication.run(ArtisphereApplication.class, args);
        
    }
}