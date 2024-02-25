package com.semi.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.model.vo.User;
import com.semi.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	// 회원가입
	@GetMapping("joinUser")
	public String registerUser() {
		return "joinUser";
	}
	
	@PostMapping("signUp")
	public String signUp(User user) {
		try{
			service.registerUser(user);
			return "redirect:/";
		} catch (Exception e) {
			// 중복된 아이디일 경우.. 
			return "joinUser";
		}
		
	}
	
	// 로그인
	@GetMapping("login")
	public String logIn() {
		return "login";
	}
	
	@PostMapping("signIn")
	public String signIn(HttpServletRequest request, User user) {
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", service.signIn(user));
		return "login_result";
	}
	
	// 마이페이지
	@GetMapping("myPage")
	public String myPage() {
		return "mypage";
	}
	
	// 비밀번호 확인
	@GetMapping("userCheck")
	public String userCheck() {
		return "userCheck";
	}
	
	@PostMapping("pwdCheck")
	public String updateUserTest(User user, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(service.userCheck(user)==1) {
			System.out.println("체크");
			session.setAttribute("checked", user);
			return "updateUser";
		} else {
			return "mypage";
		}
//		if(request.getDispatcher("loginUser").forward(requ).equals(service.userCheck(user).getId())){
		
//		} else {
//			return "mypage";
//		}
		
	}
	
	@GetMapping("updateUser")
	public String updateUser() {
		return "updateUser";
	}
	
	@GetMapping("deleteUser")
	public String deleteUser() {
		return "deleteUser";
	}
	
	@GetMapping("showAll")
	public String showAll(Model model) {
		List<User> list = service.showAllUser();
		model.addAttribute("list", list);
		return "showAll";
	}
	
	
}
