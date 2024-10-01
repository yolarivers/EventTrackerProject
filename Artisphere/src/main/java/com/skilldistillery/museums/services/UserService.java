package com.skilldistillery.museums.services;

import java.util.List;
import com.skilldistillery.artisphere.entities.User;

public interface UserService {
    User register(User user);           
    User updateUser(User user);       
    User getUserById(int id);           
    User getUserByUsername(String username); 
    List<User> getAllUsers();           
    boolean deleteUser(int id);         
    User authenticate(String username, String password);  
}
