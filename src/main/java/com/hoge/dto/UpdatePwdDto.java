package com.hoge.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UpdatePwdDto {

	private int no;
	private String changePwd;
	private String pwd;
	private String confirmPwd;
}