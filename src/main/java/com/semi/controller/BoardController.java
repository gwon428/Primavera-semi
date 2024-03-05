package com.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.semi.model.vo.Board;
import com.semi.service.BoardService;

@Controller
public class BoardController {

	private String path = "D:\\upload\\";

	@Autowired
	private BoardService service;

	@GetMapping("/board/write")
	public void write() {
	}

	// 글 쓰기
	@PostMapping("/board/write")
	public String write(Board b) throws IllegalStateException, IOException {

		// 로그인 아이디 받아오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		b.setId(userDetails.getUsername());

		System.out.println("board  : " + b);
		if (b == null || b.getFile() == null) {
			System.out.println("Error: Board 객체 또는 파일이 null입니다.");
			return "redirect:/error";
		}

		if (!b.getFile().isEmpty()) {
			String url = fileUpload(b.getFile());
			b.setUrl(url);
		}
		service.insert(b);
		return "redirect:/board/view?no=" + b.getNo();
	}

	@GetMapping("/board/list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size, Model model) {
		List<Board> boardList = service.selectPage(page, size);
		model.addAttribute("list", boardList);

		int total = service.getTotalBoardCount();
		int totalPages = (int) Math.ceil((double) total / size);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		boolean isLoggedIn = authentication != null && authentication.isAuthenticated()
				&& !(authentication instanceof AnonymousAuthenticationToken);
		model.addAttribute("isLoggedIn", isLoggedIn);

		return "board/list";
	}

	@GetMapping("/board/view")
	public String view(String no, Model model) {
		// 현재 로그인한 사용자의 아이디 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String currentLoggedInUserId = "";
		if (principal instanceof UserDetails) {
			currentLoggedInUserId = ((UserDetails) principal).getUsername();
		} else {
			currentLoggedInUserId = principal.toString();
		}
		// 모델에 현재 로그인한 사용자의 아이디 추가
		model.addAttribute("currentUserId", currentLoggedInUserId);
		// 게시물 정보를 모델에 추가
		model.addAttribute("vo", service.select(Integer.parseInt(no)));
		return "board/view";
	}

	@PostMapping("/update")
	public String update(Board b) throws IllegalStateException, IOException {
		if (!b.getFile().isEmpty()) {
			if (b.getUrl() != null) {
				File file = new File(path + b.getUrl());
				file.delete();
			}
			String url = fileUpload(b.getFile());
			b.setUrl(url);
		}

		service.update(b);

		return "redirect:/board/view?no=" + b.getNo();
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
		if (b.getUrl() != null) {
			File file = new File(path + b.getUrl());
			file.delete();
		}
		service.delete(parsingNo);
		return "redirect:board/list";
	}

	@PostMapping("/multiUpload")
	public String multiUpload(List<MultipartFile> files) throws IllegalStateException, IOException {
		for (MultipartFile file : files) {
			fileUpload(file);
		}
		return "redirect:/";
	}

	@GetMapping("/error")
	public String errorPage() {
		return "/error";
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