package com.skilldistillery.museums.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.artisphere.entities.User;
import com.skilldistillery.museums.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepo;

    @Override
    public User register(User user) {
       
        return userRepo.save(user);
    }

    @Override
    public User updateUser(User user) {
       
        return userRepo.save(user);
    }

    /*@Override
    public User getUserById(int id) {
      
        return userRepo.findById(id);
    }*/

    @Override
    public User getUserByUsername(String username) {
        
        return userRepo.findByUsername(username);
    }

    @Override
    public List<User> getAllUsers() {
       
        return userRepo.findAll();
    }

    @Override
    public boolean deleteUser(int id) {
      
        if (userRepo.existsById(id)) {
            userRepo.deleteById(id);
            return true;
        }
        return false;
    }

	/*
	 * @Override public String authenticate(String username, String password) {
	 * 
	 * User user = userRepo.findByUsernameAndPassword(username, password); if (user
	 * != null) {
	 * 
	 * return "some-token"; } else {
	 * 
	 * return null; } }
	 */

	@Override
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public User authenticate(String username, String password) {
//		// TODO Auto-generated method stub
//		return null;
//	}
}
