package com.semi.controller;

import com.semi.model.vo.BoardVO;
import com.semi.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 게시판 페이지 진입
		@GetMapping("listpage")
		public String listPage(Model model) {
			return "board/list";
		}
	
	
	// 글 전체 목록 보기

	@GetMapping("list")
	public String list(Model model) {
		List<BoardVO> list = boardService.getAllBoard();
		model.addAttribute("boardList", list);
		return "list";
	}

	// 버튼 누르면 글쓰기 페이지로
	@GetMapping("/board/write-form")
	public String writeForm(Model model) {
		return "write";
	}

	// 글쓰기 페이지

	@PostMapping("/board/write")
	public String write(BoardVO boardVO) {
		boardService.writeBoard(boardVO);
		return "redirect:/board/list";
	}
}