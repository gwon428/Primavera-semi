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

import com.semi.model.vo.Board;
import com.semi.service.BoardService;

@Controller
public class BoardController {
	
	private String path = "D:\\upload\\";

	@Autowired
	private BoardService service;
	
	@GetMapping("/board/write")
	public void write() {}
	
	// 글 쓰기
	@PostMapping("/board/write")
	public String write(Board b) throws IllegalStateException, IOException {	  
	    if (b == null || b.getFile() == null) {
	        System.out.println("Error: Board 객체 또는 파일이 null입니다.");	    
	        return "redirect:/error"; 
	    }

	    if(!b.getFile().isEmpty()) {	      
	        String url = fileUpload(b.getFile());
	        b.setUrl(url);
	    }
	    service.insert(b);
	    return "redirect:/board/view?no=" + b.getNo();
	}
	
	@GetMapping("/board/list")
	public void list(Model model) {
		model.addAttribute("list", service.selectAll());
	}
	
	@GetMapping("/board/view")
	public void view(String no, Model model) {		
		model.addAttribute("vo", service.select(Integer.parseInt(no)));
	}
	
	@PostMapping("/update")
	public String update(Board b) throws IllegalStateException, IOException {	
		if(!b.getFile().isEmpty()) {		
			if(b.getUrl()!=null) {
				File file = new File(path + b.getUrl());
				file.delete();
			}			
			String url = fileUpload(b.getFile());
			b.setUrl(url);
		}
		
		service.update(b);
		
		return "redirect:/board/view?no="+b.getNo();
	}
	
	@PostMapping("/upload")
	public String upload(MultipartFile file) throws IllegalStateException, IOException {
		System.out.println("파일 사이즈 : " + file.getSize());
		System.out.println("파일 이름 : " + file.getOriginalFilename());
		System.out.println("파일 파라미터명 : " + file.getName());
		
		fileUpload(file);
		
		return "redirect:/";
	}
	
	@GetMapping("/delete")
	public String delete(String no) {
		int parsingNo = Integer.parseInt(no);		
		Board b = service.select(parsingNo);
		if(b.getUrl()!=null) {
			File file = new File(path + b.getUrl());
			file.delete();
		}
		service.delete(parsingNo);
		return "redirect:board/list";
	}
	
	@PostMapping("/multiUpload")
	public String multiUpload(List<MultipartFile> files) throws IllegalStateException, IOException {
		for(MultipartFile file : files) {
			fileUpload(file);
		}		
		return "redirect:/";
	}
	
	@GetMapping("/error")
	public String errorPage() {
	    return "/error"; // 에러 페이지 파일의 이름
	}
	
	// 파일 업로드
	public String fileUpload(MultipartFile file) throws IllegalStateException, IOException {
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();
		
		File copyFile = new File(path + filename);
		file.transferTo(copyFile);
	
		return filename;
	}
}