package com.semi.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.semi.model.dao.UserDAO;
import com.semi.model.vo.PagingCollect;
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
	
	public int updateUser(User user) {
		String inputPw = bcpe.encode(user.getPassword());
		user.setPassword(inputPw);
		return dao.updateUser(user);
	}

	public int deleteUser(UserDetails userDetails) {
		return dao.deleteUser(userDetails);
	}

	public List<User> showAllUser(PagingCollect paging){
		paging.setOffset(paging.getLimit() * (paging.getPage()-1));
		return dao.showAllUser(paging);
	}
	
	public int total() {
		return dao.total();
	}
	
}
