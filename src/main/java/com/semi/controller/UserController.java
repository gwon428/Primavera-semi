package com.semi.controller;


import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import com.semi.model.vo.Pagingseven;
import com.semi.model.vo.Qna;
import com.semi.model.vo.User;
import com.semi.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private BCryptPasswordEncoder bcpe;

	@Autowired
	private UserService service;
	
	@Autowired
	JavaMailSenderImpl mailSender;
		
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
	
	@ResponseBody
	@PostMapping("/checkUser")
	public boolean checkUser(User user) {
		
		User finder = service.userCheck(user);
		
		if(finder == null) return false;
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
	
	
	@GetMapping("/findId")
	public String findId() {
		return "account/findId";
	}
	
	@PostMapping("/findId")
	public String findId(User user, Model model) {
		// 찾고자 하는 사용자 정보(이름, 이메일)을 user 형태로 받아 jsp에서 출력할 수 있도록 바인딩
		model.addAttribute("finder", user);
		if(service.findId(user) != null) {
			// 찾은 user 정보를 jsp에서 출력할 수 있도록 바인딩
			model.addAttribute("user", service.findId(user));
			// 찾기를 성공했을 경우 나오는 페이지
			return "account/findIdResult";
		} else {
			// 해당 사용자가 없다고 출력할 페이지..
			return "account/findFail";
		}
	}	
	
	// 로그인 찾기 후 비밀번호 찾기로 이동..
	@GetMapping("changePwd")
	public String changePwd(String id, Model model) {
		model.addAttribute("id", id);
		return "account/changePwd";
	}
	
	// 메일 전송
	@ResponseBody
	@PostMapping("/EmailAuth")
	public int emailAuth(String email) {
		
		Random random = new Random();
		// 난수 범위 : 111111~999999 (6자리 난수)
		int checkNum = random.nextInt(888888)+111111;
		
		String setForm = "primavera240327@gmail.com";
		String toMail = email;
		String title = "비밀번호 변경 인증 이메일입니다.";
		String content = "인증 코드는 " + checkNum + "입니다. " +
					"<br>" + "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
		
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setForm);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return checkNum;
	}
	
	@PostMapping("checkEmail")
	public String checkEmail(User user, Model model) {
		model.addAttribute("id", user.getId());
		return "account/changePassword";
	}
	
	
	@PostMapping("updatePwd")
	public String updatePwd(User user, HttpServletRequest request, Authentication authentication) {
		HttpSession session = request.getSession();
		System.out.println("비밀번호 재설정 .. " + user);
		
		if(service.updatePwd(user)==1) {
			session.setAttribute("user", user);
		}
		return "user/myPage";
	}
	
	
	// 내가 쓴 후기 모아보기
	@GetMapping("showReview")
	public String showReview(Model model, Pagingseven paging) {
		List<Board> list = service.showReview(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", new Pagingseven(paging.getPage(), service.showReviewtotal()));
		return "user/showReview";
	}
	
	// 내가 쓴 qna 모아보기
	@GetMapping("showQna")
	public String showQna(Model model, Pagingseven paging) {
		List<Qna> list = service.showQna(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", new Pagingseven(paging.getPage(), service.showQnatotal()));
		return "user/showQna";
	}
	
	@GetMapping("/findIdlogin")
	public String findIdLogin(String id, Model model) {
		model.addAttribute("id", id);
		return "/user/findIdLogin";
	}
	
}
