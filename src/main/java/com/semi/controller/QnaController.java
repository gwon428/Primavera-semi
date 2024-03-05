package com.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;


import com.semi.model.vo.PagingQna;
import com.semi.model.vo.Qna;
import com.semi.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService service;
	
	private String path = "D:\\upload\\";
	
	// 파일 업로드 기능 
		public String fileUpload(MultipartFile file) throws IllegalStateException, IOException {
			
		// 중복 방지를 위한 UUID 적용
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();
			
		File copyFile = new File(path + filename);
		file.transferTo(copyFile);  // 업로드한 파일이 지정한 path 위치로 저장
			
			return filename;
		}
		
		@GetMapping("write")
		public String write() {
			return "qna/insertQna";
		}
		
		// 글 등록
		@PostMapping("insertQna")
		public String insertQna(Qna qna) throws IllegalStateException, IOException {
			
			// 파일 업로드 처리 로직
			String url = fileUpload(qna.getFile());
			
			// Board에 url <-- 업로드 된 경로 set으로 넣고 
			qna.setUrl(url);
			
			// 비즈니스 로직 처리 -> service.Boardwrite
			service.insert(qna);
			//System.out.println("추가 후 : " + qna);
			//return "redirect:/view?no=" + qna.getQnaNum();
			return "redirect:/qna";
		}
		
		// 리스트 페이징 처리 
		@GetMapping("qna")
		public String showFilm(Model model, PagingQna paging) {
			
			//System.out.println(paging);
			
			List<Qna> list = service.showAllQna(paging);
			model.addAttribute("list", list);
			model.addAttribute("paging", new PagingQna(paging.getPage(), service.total()));
			return "qna/qna";
		}
		
		
/*	
  @GetMapping("/view")
		public void view(String no, Model model) {
			// int inNo = Integer.parseInt(no);
			// Board board = service.select(inNo);
			// model.addAttribute("vo", board);
			model.addAttribute("vo", service.select(Integer.parseInt(no)));
		}
	*/
		
}
