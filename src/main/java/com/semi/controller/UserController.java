package com.semi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.model.vo.User;
import com.semi.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	// 마이페이지로 이동 (로그인 + 기타 메뉴 보이는 화면)
	@GetMapping("myPage")
	public String myPage() {
		return "user/myPage";
	}
	
	@PostMapping("login")
	public String login(HttpServletRequest request, User user) {
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", service.loadUserByUsername(user.getId()));
		return "redirect:/";
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
		return "user/updateUser";
	}
	
	
	@PostMapping("/updateUser")
	public String update(User user, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(service.updateUser(user)==1) {
			session.setAttribute("updateUser", user);
		}
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
//	@RequestMapping(value="/deleteUser", method=RequestMethod.GET)
//	public String deleteUser() {
//		return "user/deleteUser";
//	}
//	
//	@RequestMapping(value="/deleteUser", method=RequestMethod.POST)
//	public String deleteUser(User user, HttpSession session, RedirectAttributes attribute) {
//		User member  = (User) session.getAttribute("loginUser");
//		String sessionPassword = member.getPassword();
//		String userPassword = user.getPassword();
//		
//		if(!(sessionPassword.equals(userPassword))) {
//			attribute.addFlashAttribute("message", false);
//			return "redirect:/user/myPage";
//		} 
//		service.deleteUser(user);
//		session.invalidate();
//		return "redirect:/";
//	}
//	
	
	@GetMapping("/deleteUser")
	public String delete() {
		return "user/deleteUser";
	}
	
	@PostMapping("/deleteUser")
	public String delete(User user, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("deleteUser", service.deleteUser(user));
		return "redirect:/";
	}
	
	@GetMapping("/admin")
	public void admin() {}
}
