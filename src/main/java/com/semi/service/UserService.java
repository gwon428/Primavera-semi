package com.semi.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.semi.model.dao.UserDAO;
import com.semi.model.vo.Review;
import com.semi.model.vo.Paging;
import com.semi.model.vo.Pagingseven;
import com.semi.model.vo.Qna;
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
		return user;
	}
	
	public User idCheck(String id) {
		return dao.check(id);
	}

	public User phoneCheck(String phone) {
		return dao.phonecheck(phone);
	}

	public User emailCheck(String email) {
		return dao.emailcheck(email);
	}
	
	public User userCheck(User user) {
		return dao.checkUser(user);
	}
	
	public int registerUser(User user) {
		String encodePw = bcpe.encode(user.getPassword());
		user.setPassword(encodePw);
		return dao.registerUser(user);
	}
	
	public int updateUser(User user) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User userDetails = (User)principal;
		
		String inputPw = bcpe.encode(user.getPassword());
		user.setPassword(inputPw);
		
		userDetails.setName(user.getName());
		userDetails.setPhone(user.getPhone());
		userDetails.setEmail(user.getEmail());
		
		return dao.updateUser(user);
	}

	public int deleteUser(UserDetails userDetails) {
		return dao.deleteUser(userDetails);
	}

	public List<User> showAllUser(Paging paging){
		paging.setOffset(paging.getLimit() * (paging.getPage()-1));
		return dao.showAllUser(paging);
	}

	public int total() {
		return dao.total();
	}
	
	public User findId(User user) {
		return dao.findId(user);
	}
	
	public User checkEmail(User user) {
		return dao.checkEmail(user);
	}
	
	
	// 내가 쓴 후기 리스트 출력
	public List<Review> showReview(Pagingseven paging){
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		
		paging.setOffset(paging.getLimit() * (paging.getPage()-1));
		
		paging.setId(userDetails.getUsername());
		return dao.showReview(paging);
	}
	
	public int showReviewtotal() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		
		return dao.totalmyReview(userDetails.getUsername());
	}
	
	// 내가 쓴 qna 리스트 출력
	public List<Qna> showQna(Pagingseven paging){
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		
		paging.setOffset(paging.getLimit() * (paging.getPage()-1));
		
		paging.setId(userDetails.getUsername());
		return dao.showQna(paging);
	}
	
	public int showQnatotal() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		return dao.totalmyQna(userDetails.getUsername());
	}

	public int updatePwd(User user) {
		String inputPw = bcpe.encode(user.getPassword());
		user.setPassword(inputPw);
		return dao.updatePwd(user);
	}

	// 수집일 순
	public List<User> showUsercolDate(Paging paging) {
		paging.setOffset(paging.getLimit() * (paging.getPage()-1));
		return dao.showUsercolDate(paging);
	}

	// 주문번호 순
	public List<User> showUserorderNum(Paging paging){
		paging.setOffset(paging.getLimit() * (paging.getPage()-1));
		return dao.showUserorderNum(paging);
	}
	
	
}
