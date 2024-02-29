package com.semi.service;

import com.semi.model.dao.BoardDAO;
import com.semi.model.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    private BoardDAO boarddao;

    
    public List<BoardVO> getAllBoard() {
        return boarddao.getAllBoard();
    }

  
    public int writeBoard(BoardVO boardVO) {
    	return boarddao.writeBoard(boardVO);
    }
}