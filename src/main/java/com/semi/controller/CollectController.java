package com.semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.model.vo.Collect;
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
	
/*----------------------------------------------------------*/	
	// 예빈전용 페이지 
	@GetMapping("yebinCollect")
	public String yebinCollect() {
		return "collect/yebinCollect";
	}
	
	// 관리자용 수거신청현황 페이지 (prog제외) 
		@GetMapping("showAllCollect")
		public String showallCollect(Model model) {
			List<Collect> list = service.showAllCollect();
			model.addAttribute("list", list);
			return "collect/showallCollect";
		}
	
	// 회원용 진행상황 페이지용 
		@GetMapping("showCollect")
		public String showCollect(Model model) {
			
			List<Collect> list = service.showCollect();
			model.addAttribute("list", list);
			
			return "collect/showCollect";
		}
		
	// 관리자용 progress 페이지
	
	
/*----------------------------------------------------------*/
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
