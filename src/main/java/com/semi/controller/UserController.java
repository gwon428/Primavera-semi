package com.semi.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.model.vo.User;
import com.semi.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private BCryptPasswordEncoder bcpe;

	@Autowired
	private UserService service;
	
	// 마이페이지로 이동 (로그인 + 기타 메뉴 보이는 화면)
	@GetMapping("myPage")
	public String myPage() {
		return "user/myPage";
	}
	
//	@PostMapping("login")
//	public String login(HttpServletRequest request, User user) {
//		HttpSession session = request.getSession();
//		session.setAttribute("loginUser", service.loadUserByUsername(user.getId()));
//		return "redirect:/";
//	}
	
	@GetMapping("/register")
	public String join() {
		return "user/register";
	}
	
	@PostMapping("/register")
	public String register(User user) {
		service.registerUser(user);
		return "user/myPage";
	}

	// 회원정보수정 jsp로 이동
	@GetMapping("/update")
	public String update() {
		return "user/updateCheck";
	}
	
	@PostMapping("/updateCheck")
	public String updateCheck(String password) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		System.out.println(userDetails);
		
		if(bcpe.matches(password, userDetails.getPassword())) {
			System.out.println("업데이트하자!!!");
			return "user/updateUser";
		} else {
			return "user/updateCheck";
		}
		
	}
	
	@PostMapping("/updateUser")
	public String update(@AuthenticationPrincipal User user, HttpServletRequest request, Authentication authentication) {

		HttpSession session = request.getSession();
		if(service.updateUser(user)==1) {
			session.setAttribute("user", user);
		} 
		return "redirect:/";
	}
	
	@GetMapping("/deleteUser")
	public String delete() {
		return "user/deleteCheck";
	}
	
	@PostMapping("/deleteCheck")
	public String deleteCheck(String inputPwd) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		System.out.println(userDetails);
		
		if(bcpe.matches(inputPwd, userDetails.getPassword())) {
			System.out.println("회원 탈퇴");
			service.deleteCheck(inputPwd);
			return "redirect:/";
		} else {
			return "user/updateCheck";
		}
	}
	
	@PostMapping("/deleteUser")
	public String delete(User user, HttpServletRequest request) {
		System.out.println("delete : " + user);
//		HttpSession session = request.getSession();
//		session.setAttribute("deleteUser", service.deleteUser(user));
		return "";
	}
	
	
	@GetMapping("/admin")
	public void admin() {}
}
