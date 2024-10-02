package com.skilldistillery.museums.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.skilldistillery.artisphere.entities.User;
import com.skilldistillery.museums.repositories.UserRepository;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private UserRepository userRepo;

	@Override
	public User register(User user) {
		String encodedPW = encoder.encode(user.getPassword());
		user.setPassword(encodedPW); 
		user.setEnabled(true);
		user.setRole("standard");
		userRepo.saveAndFlush(user);
		return user;

	}

	@Override
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return userRepo.findByUsername(username);
	}

}
