package com.semi.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Paging {

	private int page = 1;
	private int offset = 0;
	private int limit = 10;
	private int pageSize = 10;
	private int endPage;
	private int startPage;

	private boolean prev;
	private boolean next;

	public Paging(int page, int total) {
		// 현재 페이지 번호가 1 미만인 경우 1로 설정
		this.page = Math.max(page, 1);

		this.offset = (this.page - 1) * this.limit;

		this.endPage = (int) (Math.ceil((double) this.page / this.pageSize)) * this.pageSize;
		this.startPage = this.endPage - this.pageSize + 1;

		int lastPage = (int) (Math.ceil((double) total / this.limit));
		if (lastPage < this.endPage) {
			this.endPage = lastPage;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < lastPage;
	}
}
