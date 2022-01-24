package com.hoge.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDto {

	private String id;
	private String name;
	private String pwd;
	private String email;
	private String tel;
	private String gender;
}