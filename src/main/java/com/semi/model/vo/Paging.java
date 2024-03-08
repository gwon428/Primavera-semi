package com.semi.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Paging {
	private int page = 1; // 현재

	// ------ Database 기준 !!
	private int offset = 0; // 시작
	private int limit = 10; // 레코드 수
	// ---------------------------------

	private int pageSize = 10; // 페이지에 등록물 개수
	private int endPage = this.pageSize; // 페이지에 등록물의 마지막 개수
	private int startPage = this.endPage - this.pageSize + 1; // 한페이지의 첫 페이지수

	// 비활성화를 위한 리턴타입
	private boolean prev;
	private boolean next;

	public Paging(int page, int total) {
		this.page = page;
		this.endPage = (int) (Math.ceil((double) page / this.pageSize)) * this.pageSize;
		this.startPage = this.endPage - this.pageSize + 1;

		// ex > 100개의 공지사항은 끝쪽수로 나눈게 우리는 라스트 페이지인거다 !
		int lastPage = (int) (Math.ceil((double) total / this.limit));

		if (lastPage < this.endPage) {
			this.endPage = lastPage;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < lastPage;

	}

}
