package com.skilldistillery.museums.services;

import com.skilldistillery.artisphere.entities.User;

public interface AuthService {

	public User register(User user);
	public User getUserByUsername(String username);
}
