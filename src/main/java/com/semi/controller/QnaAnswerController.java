package com.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.semi.model.vo.QnaAnswer;
import com.semi.service.QnaAnswerService;

@Controller
public class QnaAnswerController {
	
	@Autowired
	private QnaAnswerService service;

	
	private String path = "D:\\upload\\qnaAnswer\\";
	
	// 파일 업로드
	public String fileUploads(MultipartFile file) throws IllegalStateException, IOException {	
	// 중복 방지를 위한 UUID 적용
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();
				
		File copyFile = new File(path + filename);
		file.transferTo(copyFile);  // 업로드한 파일이 지정한 path 위치로 저장
				
		return filename;
	}
	
	// insert
	@GetMapping("writeAnswer")
	public String insert(int qnaNum, Model model) {
		model.addAttribute("qna", qnaNum);
		return "qnaAnswer/insertAnswer";
	}
	
	@PostMapping("insertAnswer")
	public String insertAnswer(QnaAnswer qnaAnswer) throws IllegalStateException, IOException {
		if(!qnaAnswer.getFile().isEmpty()) {
			String url = fileUploads(qnaAnswer.getFile());
			qnaAnswer.setUrl(url);
		}
		service.insertQnaAnswer(qnaAnswer);
		System.out.println("qnaAnswer" + qnaAnswer.getQnaNum());
		System.out.println("대답내용 : "+ qnaAnswer.getContent());
		return "redirect:/viewQna?qnaNum="+qnaAnswer.getQnaNum();
	}
	
	
	// select
	@GetMapping("")
	public String selectQnaAnswer(String qnaNum, Model model) {
		int qnanum = Integer.parseInt(qnaNum);
		QnaAnswer qnaAnswer = service.selectQnaAnswer(qnanum);
		model.addAttribute("qnaAnswer", qnaAnswer);
		
		return "redirect:/viewQna?qnaNum="+qnaAnswer.getQnaNum();
	}
	
	
	// update
	
	// delete 
	
}
