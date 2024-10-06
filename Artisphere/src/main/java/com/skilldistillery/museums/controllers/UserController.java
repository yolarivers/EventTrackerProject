package com.skilldistillery.museums.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.artisphere.entities.User;
import com.skilldistillery.museums.services.UserService;

import jakarta.servlet.http.HttpServletResponse;

@CrossOrigin({"*", "http://localhost/"})
@RestController
public class UserController {

    @Autowired
    private UserService userService;

	/*
	 * @PostMapping("register") public ResponseEntity<User> register(@RequestBody
	 * User user, HttpServletResponse res) { try { user =
	 * userService.register(user); return new ResponseEntity<>(user,
	 * HttpStatus.CREATED); } catch (Exception e) { e.printStackTrace(); return new
	 * ResponseEntity<>(null, HttpStatus.BAD_REQUEST); } }
	 * 
	 * 
	 * @PostMapping("/login") public ResponseEntity<String>
	 * authenticate(@RequestParam String username, @RequestParam String password,
	 * HttpServletResponse res) { User authenticatedUser =
	 * userService.authenticate(username, password); if (authenticatedUser != null)
	 * {
	 * 
	 * String token = "Bearer some_generated_token";
	 * 
	 * return new ResponseEntity<>("Login successful. Token: " + token,
	 * HttpStatus.OK); } else { return new ResponseEntity<>("Invalid credentials",
	 * HttpStatus.UNAUTHORIZED); } }
	 */


   
//    @GetMapping("/{id}")
//    public ResponseEntity<User> getUserById(@PathVariable int id) {
//        User user = userService.getUserById(id);
//        if (user != null) {
//            return new ResponseEntity<>(user, HttpStatus.OK);
//        } else {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }

  
    @GetMapping("/username/{username}")
    public ResponseEntity<User> getUserByUsername(@PathVariable String username) {
        User user = userService.getUserByUsername(username);
        if (user != null) {
            return new ResponseEntity<>(user, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

  
//    @GetMapping
//    public ResponseEntity<List<User>> getAllUsers() {
//        List<User> users = userService.getAllUsers();
//        return new ResponseEntity<>(users, HttpStatus.OK);
//    }

 
//    @DeleteMapping("/{id}")
//    public ResponseEntity<Void> deleteUser(@PathVariable int id) {
//        boolean deleted = userService.deleteUser(id);
//        if (deleted) {
//            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//        } else {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }
}
