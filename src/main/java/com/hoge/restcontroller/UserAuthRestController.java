package com.hoge.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hoge.service.UserService;

@RestController
public class UserAuthRestController {
	
	@Autowired
	private UserService userService;

	// 이승준: 아이디 중복여부 체크
	@PostMapping("/register/checkId")
	public int checkId(@RequestParam("userId") String id) {
		
		return userService.userCheckById(id);
	}

	// 이승준: 전화번호 중복여부 체크
	@PostMapping("/register/checkTel")
	public int checkTel(@RequestParam("userTel") String tel) {
		
		return userService.userCheckByTel(tel);
	}

	// 이승준: 이메일 중복여부 체크
	@PostMapping("/register/checkEmail")
	public int checkEmail(@RequestParam("userEmail") String email) {
		
		return userService.userCheckByEmail(email);
	}
}