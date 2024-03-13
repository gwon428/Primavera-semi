package com.semi.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class QnaAnswer {
	private int qnaNum;
	private String id;
	private String content;
	private String url;
	private Date answerDate;
}
