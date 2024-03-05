package com.semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.model.vo.Collect;
import com.semi.model.vo.PagingCollect;
import com.semi.service.CollectService;

@Controller
public class CollectController {

	@Autowired
	private CollectService service;
	
	// 수거 페이지
	@GetMapping("collectPage")
	public String collectPage(Model model) {
		return "collect/collect";
	}
	
	
	// 전체 수거 신청 리스트 보기 
	@GetMapping("showAllCollect")
	public String showallCollect(Model model, PagingCollect paging) {
		List<Collect> list = service.showAllCollect(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", new PagingCollect(paging.getPage(), service.total()));
		return "collect/showallCollect";
	}
	
	// 수거 신청 페이지
	@GetMapping("registerCollect")
	public String registerCollect(Model model) {
		return "collect/registerCollect";
	}
	
	@PostMapping("signUpCollect")
	public String signUp(Collect vo) {	
		service.registerCollect(vo);
		
		return "collect/collect";
	}
	
}
