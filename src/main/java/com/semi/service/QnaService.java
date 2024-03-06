package com.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.model.dao.QnaDAO;
import com.semi.model.vo.PagingQna;
import com.semi.model.vo.Qna;

@Service
public class QnaService {

	@Autowired
	private QnaDAO dao;
	
	// 리스트 페이징 처리
	public List<Qna> showAllQna(PagingQna paging){
		paging.setOffset(paging.getLimit()*(paging.getPage()-1));
		return dao.showAllQna(paging);
	}
	
	public int total() {
		return dao.total();
	}
	
	// qna 등록 - insert
	public int insert(Qna qna) {
		return dao.insert(qna);
	}
	
	// 작성한 QnA 전문 보이게 - selectOne
	public Qna select(int qnaNum) {
		return dao.select(qnaNum);
	}
}
