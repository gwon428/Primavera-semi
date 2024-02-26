package com.semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.semi.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	
}
