package com.semi.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class User {
	private String id;
	private String password;
	private String name;
	private String phone;
	private int postCode;
	private String roadAddress;
	private String detailAddress;
	private String email;
	private String bankName;
	private String account;
	private String auth;
}
