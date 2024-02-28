package com.semi.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		List<String> roleNames = new ArrayList<>();
		authentication.getAuthorities().forEach(authority -> {
			String auth = authority.getAuthority();
			roleNames.add(auth);
		});
		
		if (roleNames.contains("ADMIN")) {
			response.sendRedirect("/myPage");
			System.out.println("관리자입니다.");
			return;
		} else if (roleNames.contains("MEMBER")) {
			response.sendRedirect("/myPage");
			System.out.println("회원입니다.");
			return;
		}
		response.sendRedirect("/all");
	}
}
