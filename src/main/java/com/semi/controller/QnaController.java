package com.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.semi.model.vo.Paging;
import com.semi.model.vo.PagingQna;
import com.semi.model.vo.Qna;
import com.semi.model.vo.QnaAnswer;
import com.semi.service.QnaAnswerService;
import com.semi.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService service;
	
	@Autowired
	private QnaAnswerService qnaAnswerService;
	
	@Autowired
	private BCryptPasswordEncoder bcpe;
	
	
	private String path = "D:\\upload\\qna\\";
	
	
	// 파일 업로드 기능 
	public String fileUpload(MultipartFile file) throws IllegalStateException, IOException {
			
	// 중복 방지를 위한 UUID 적용
	UUID uuid = UUID.randomUUID();
	String filename = uuid.toString() + "_" + file.getOriginalFilename();
			
	File copyFile = new File(path + filename);
	file.transferTo(copyFile);  // 업로드한 파일이 지정한 path 위치로 저장
			
		return filename;
	}
		
	//Qna(페이지 이동)
	@GetMapping("writeQna")
	public String write() {
		return "qna/insertQna";
	}
		
	//Qna 등록(insert)
	@PostMapping("insertQna")
	public String insertQna(Qna qna) throws IllegalStateException, IOException {
		if(!qna.getFile().isEmpty()) {
			String url = fileUpload(qna.getFile());
			qna.setUrl(url);
		}
		service.insert(qna);
		return "redirect:/listQna";
	}
				
	// Qna리스트 페이징 처리 (select/검색포함)
	@GetMapping("listQna")
	public String showFilm(Model model, @RequestParam(value = "page", defaultValue = "1") int page, String select, String keyword){
			
		int total = service.total();
		Paging paging = new Paging(page, total);
		paging.setKeyword(keyword);
		paging.setSelect(select);
			
		List<Qna> list = service.showAllQna(paging);
			
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
			
		return "qna/listQna";
	}
		
		Qna qna= null;
		
	// Qna 확인(select)
	@GetMapping("viewQna")
	public String view(Model model, String qnaNum) {
		int qnanum = Integer.parseInt(qnaNum);
		qna = service.select(qnanum);
		model.addAttribute("qna", qna);
			
		// 댓글 정보 바인딩 추가
		QnaAnswer qnaAnswer = qnaAnswerService.selectQnaAnswer(qnanum);
		model.addAttribute("qnaAnswer", qnaAnswer);
			
		return "/qna/viewQna";
	}
  
	//Qna 수정(update)
	@GetMapping("updateQna")
	public String updateQna(Model model) {
		model.addAttribute("qna", qna);
		return "qna/updateQna";
	}
		
	@PostMapping("updateQna")
	public String update(Qna qna) throws IllegalStateException, IOException {
				
		// 이미지 수정했을 경우 
		if(!qna.getFile().getOriginalFilename().equals("")) {
			String url = fileUpload(qna.getFile());
			qna.setUrl(url);
		} else if(qna.isDelImg()) {
			// 이미지 삭제했을 경우
			File file = new File(path+qna.getUrl());
			file.delete();
			qna.setUrl(null);	
		} 
			service.update(qna);
			return "redirect:/viewQna?qnaNum="+qna.getQnaNum();
		}
		
	//Qna 삭제(delete)
	@GetMapping("/deleteQna")
	public String delete(String qnaNum) {
		int parsingNo = Integer.parseInt(qnaNum);
		
		Qna qna = service.select(parsingNo);
		if(qna.getUrl()!=null) {
			File file = new File(path+qna.getUrl());
			file.delete();
		}
		service.delete(parsingNo);
		return "redirect:/listQna";
	} 
  
/*-----------------------------------------------------------------------*/
// 관리자 및 회원 페이지 
 	
	// 관리자용 Q&A 게시판 관리 페이지 : qna의 status가 'N'인 경우 리스트
 	@GetMapping("listStatus")	
 	public String listStatus(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		int total = service.totalStatus();
		Paging paging = new Paging(page, total);
		List<Qna> listStatus = service.listStatus(paging);
		model.addAttribute("listStatus", listStatus);
		model.addAttribute("paging", paging);
 		return "qnaAnswer/listQnaAnswer";
	}
 	
 	// 비밀글 시 비밀번호 확인 및 페이지 이동
 	@PostMapping("pwdCheck")
 	public String pwdCheck(String password, String qnaNum, String idCheck){
 		System.out.println("pwdCheck");
 		System.out.println(idCheck);
 		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
 		
 		if(bcpe.matches(password, userDetails.getPassword()) && (userDetails.getUsername().equals(idCheck))){
 			return "redirect:/viewQna?qnaNum=" + qnaNum;
 		}
 		else {
 			return "redirect:/listQna";
 		}
 	}
 
}
