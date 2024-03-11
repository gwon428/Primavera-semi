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
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.model.vo.Board;
import com.semi.model.vo.Paging;
import com.semi.model.vo.Qna;
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
	
	
	@PostMapping("/loginFail")
	public String loginFail() {
		return "user/loginFail";
	}
	
	@GetMapping("/register")
	public String join() {
		return "user/register";
	}
	
	@ResponseBody
	@PostMapping("/check")
	public boolean check(String id) {
		User user = service.idCheck(id);
		if(user == null) return false;
		return true;
	}
	
	@PostMapping("/register")
	public String register(User user) {
		service.registerUser(user);
		return "user/myPage";
	}

	// 회원정보수정 jsp로 이동
	@GetMapping("/updateUser")
	public String update() {
		return "user/updateCheck";
	}
	
	@PostMapping("/updateCheck")
	public String updateCheck(String password, Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		
		model.addAttribute("pwd", password);
		
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
	
	// 탈퇴 (비밀번호 확인 후 탈퇴 처리)
	@PostMapping("/deleteCheck")
	public String deleteCheck(String password) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		if(bcpe.matches(password, userDetails.getPassword())) {
			service.deleteUser(userDetails);
			SecurityContextHolder.clearContext();
			return "redirect:/";
		} else {
			System.out.println("탈퇴 안되염. . ");
			return "";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method= RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "user/myPage";
	}
	
	@GetMapping("allUser")
	public String allUser(Model model, Paging paging) {
		List<User> list = service.showAllUser(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", new Paging(paging.getPage(), service.total()));
		return "user/allUser";
	}
	
	@GetMapping("findId")
	public String findId() {
		return "account/findId";
	}
	
	private String id;
	
	@PostMapping("/findId")
	public String findId(User user, Model model) {
		// 찾고자 하는 사용자 정보(이름, 이메일)을 user 형태로 받아 jsp에서 출력할 수 있도록 바인딩
		model.addAttribute("finder", user);
		if(service.findId(user) != null) {
			// 찾은 user 정보를 jsp에서 출력할 수 있도록 바인딩
			model.addAttribute("user", service.findId(user));
			id = service.findId(user).getId();
			// 찾기를 성공했을 경우 나오는 페이지
			return "account/findIdResult";
		} else {
			// 해당 사용자가 없다고 출력할 페이지..
			return "account/findFail";
		}
	}	
	// 내가 쓴 후기 모아보기
	@GetMapping("showReview")
	public String showReview(Model model) {
		List<Board> list = service.showReview();
		model.addAttribute("list", list);
		return "user/showReview";
	}
	
	// 내가 쓴 qna 모아보기
	@GetMapping("showQna")
	public String showQna(Model model) {
		List<Qna> list = service.showQna();
		model.addAttribute("list", list);
		return "user/showQna";
	}
	
	@GetMapping("/findIdlogin")
	public String findIdLogin(Model model) {
		model.addAttribute("user", id);
		return "/user/findIdLogin";
	}
	
}
