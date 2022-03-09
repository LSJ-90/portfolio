package com.hoge.dto;



import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HogeUserDto {
	
	@NotBlank(message = "아이디를 입력해주세요.")
	@Pattern(regexp = "^[a-z][a-z0-9]{5,12}$", message = "아이디는 영문으로 시작하여, 소문자와 숫자를 사용해 6~12자리까지만 가능합니다!! :(")
	private String id;
	
	@NotBlank(message = "비밀번호를 입력해주세요.")
	@Pattern(regexp = "^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\\\(\\\\)\\-_=+]).{8,16}$", 
			 message = "아이디는 영문으로 시작하여, 소문자와 숫자를 사용해 6~12자리까지만 가능합니다!! :(")
	private String pwd;
	
	@NotBlank(message = "이름을 입력해주세요.")
	@Pattern(regexp = "[가-힣]{2,}", message = "이름 형식이 맞지 않습니다. 확인해주세요.")
	private String name;
	
	@NotBlank(message = "이메일을 입력해주세요.")
	@Email(message = "올바른 이메일 형식이 아닙니다.")
	private String email;
	
	private String tel;
	
	private String gender;
}