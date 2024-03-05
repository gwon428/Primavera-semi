package com.semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.semi.model.vo.Collect;
import com.semi.service.ProgressService;

@Controller
public class ProgressController {

	@Autowired
	private ProgressService service;
	
	@GetMapping("signUpCollect")
	public void registerProg(Collect collect) {
		service.registerProg(collect);
		System.out.println(collect.getOrderNum());
	}
	
	
}
