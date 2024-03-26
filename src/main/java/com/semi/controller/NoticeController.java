package com.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.semi.model.vo.Notice;
import com.semi.model.vo.Paging;
import com.semi.service.NoticeService;

@RequestMapping("/notice")
@Controller
public class NoticeController {

	private String path = "D:\\upload\\notice\\";

	@Autowired
	private NoticeService service;

	@GetMapping("/list")
	public String list(Model model, Paging paging) {
		model.addAttribute("noticeList", service.selectAll(paging));
		model.addAttribute("paging", new Paging(paging.getPage(), service.total()));

		return "/notice/noticeList";
	};

	@GetMapping("/write")
	public String noticeWrite() {
		return "notice/noticeWrite";
	};

	@PostMapping("/writeNotice")
	public String noticeWrite(Notice n) throws IllegalStateException, IOException {
		if (!n.getFile().isEmpty()) {

			String url = noticeFileUpload(n.getFile());

			n.setUrl(url);
		}
		service.insert(n);
		return "redirect:/notice/list";
	}

	public String noticeFileUpload(MultipartFile file) throws IllegalStateException, IOException {

		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();

		File copyFile = new File(path + filename);
		file.transferTo(copyFile);

		return filename;
	}

	@PostMapping("updateNotice")
	public String update(Notice n) throws IllegalStateException, IOException {
		if (!n.getFile().isEmpty()) {
			if (n.getUrl() != null) {
				File file = new File(path + n.getUrl());
				file.delete();
			}
			String url = noticeFileUpload(n.getFile());
			n.setUrl(url);
		}
		service.update(n);
		return "redirect:/notice/list";
	}

	@PostMapping("/upload")
	public String upload(MultipartFile file) throws IllegalStateException, IOException {
		noticeFileUpload(file);
		return "redirect:/";
	}

	@GetMapping("noticeView")
	public void view(String noticeNum, Model model) {
		Notice voo = service.select(Integer.parseInt(noticeNum));
		model.addAttribute("vo", service.select(Integer.parseInt(noticeNum)));
	}

	@GetMapping("deleteNotice")
	public String delete(String noticeNum) {
		int parsingNo = Integer.parseInt(noticeNum);

		Notice n = service.select(parsingNo);
		if (n.getUrl() != null) {
			File file = new File(path + n.getUrl());
			file.delete();
		}
		service.delete(parsingNo);
		return "redirect:/notice/list";
	}

}