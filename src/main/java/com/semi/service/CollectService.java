package com.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.semi.model.dao.CollectDAO;
import com.semi.model.vo.Collect;
import com.semi.model.vo.PagingCollect;

@Service
public class CollectService {
	
	@Autowired
	private CollectDAO dao;
	
	// 전체 수거 신청 리스트 보기
	public List<Collect> showAllCollect(PagingCollect paging){
		paging.setOffset(paging.getLimit() * (paging.getPage()-1));
		return dao.showAllCollect(paging); 
	}
	
	public int total() {
		return dao.total();
	}
	// 관리자용 수거신청현황 페이지 (prog제외)
	public List<Collect> showAllCollect(){
		
		return dao.showAllCollect(); 
	}
	
	// 회원용 진행상황 페이지용 
		public List<Collect> showCollect(){
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserDetails userDetails = (UserDetails)principal;
			System.out.println(userDetails.getUsername());
			System.out.println(userDetails);
			return dao.showCollect(userDetails.getUsername());
	}
	
	// 관리자용 progress 관리 페이지용(조건x)
	public List<Collect> showProgress(){
		return dao.showProgress();
	}	
		
	// update : 수거 신청 진행상황 변경
	public int updateProgress(Collect collect) {
		return dao.updateProgress(collect);
	}
	
/*--------------------------------------------------------------*/
	
	// 수거 신청 
	public int registerCollect(Collect vo) {
		return dao.registerCollect(vo);
	}
}
