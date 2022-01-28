package com.hoge.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HogeUserUpdateDto {

	private int no;
	private String image;
	private String name;
	private String tel;
	private String email;
}