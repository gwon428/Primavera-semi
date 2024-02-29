package com.semi.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
	private int reviewnum;
	private String id;
	private String title;
	private String content;
	private int ordernum;
	private Date writedate;
	private int starpoint;
}