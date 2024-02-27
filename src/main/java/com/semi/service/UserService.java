package com.semi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.semi.model.dao.UserDAO;
import com.semi.model.vo.User;

@Service
public class UserService implements UserDetailsService{

	@Autowired
	private BCryptPasswordEncoder bcpe;
	
	@Autowired
	private UserDAO dao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = dao.getMemberById(username);
		System.out.println(user);
		return user;
	}
	
	public int registerUser(User user) {
		String encodePw = bcpe.encode(user.getPassword());
		user.setPassword(encodePw);
		return dao.registerUser(user);
	}
	
	public int updateCheck(String inputPwd) {
		return dao.updateCheck(inputPwd);
	}
	
	public int updateUser(User user) {
		return dao.updateUser(user);
	}
	
	public int deleteCheck(String inputPwd) {
		return dao.deleteCheck(inputPwd);
	}

	
	
}
