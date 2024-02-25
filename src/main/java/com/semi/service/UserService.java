package com.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.model.dao.UserDAO;
import com.semi.model.vo.User;

@Service
public class UserService {

	@Autowired
	private UserDAO dao;
	
	public int registerUser(User user) {
		return dao.registerUser(user);
	}
	
	public User signIn(User user) {
		return dao.signIn(user);
	}

	public int userCheck(User user) {
		return dao.userCheck(user);
	}

	public List<User> showAllUser() {
		return dao.showAllUser();
	}
}
