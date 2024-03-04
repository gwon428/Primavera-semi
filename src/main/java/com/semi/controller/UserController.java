package com.semi.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@PostMapping("/loginFail")
	public String loginFail() {
		return "user/loginFail";
	}
	
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
		
		if(bcpe.matches(password, userDetails.getPassword())) {
			return "user/updateUser";
		} else {
			return "user/updateCheck";
		}
		
	}
	
	@PostMapping("/updateUser")
	public String update(@AuthenticationPrincipal User user, HttpServletRequest request, Authentication authentication) {
		// 변경할 비밀번호를 다시 암호화해서 sql에 넣어야 함..!
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
	public String deleteCheck(String password) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
//		System.out.println(userDetails);
//		System.out.println(password);
		if(bcpe.matches(password, userDetails.getPassword())) {
//			System.out.println("탈퇴시켜줘 . . . .");
			service.deleteUser(userDetails);
			SecurityContextHolder.clearContext();
			return "redirect:/";
		} else {
			System.out.println("탈퇴 안되염. . ");
			
			return "";
		}
	}
	
	@RequestMapping(value="/logout", method= RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "user/myPage";
	}
	
	@GetMapping("allUser")
	public String allUser(Model model) {
		List<User> list = service.showAllUser();
		model.addAttribute("list", list);
		return "user/allUser";
	}
}
