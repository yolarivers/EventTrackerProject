package com.skilldistillery.museums.services;

import java.util.List;
import com.skilldistillery.artisphere.entities.User;

public interface UserService {
    User saveUser(User user);
    User getUserById(int id);
    User getUserByUsername(String username);
    List<User> getAllUsers();
    void deleteUser(int id);
}
