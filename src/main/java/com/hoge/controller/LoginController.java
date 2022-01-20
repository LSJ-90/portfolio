package com.hoge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hoge.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/login")
	public String home(Model model) throws Exception {
		
		// TODO: 로그인 레지스터 구현해야함, 메인에서 로그인페이지로 이동하는것 구현
		
		return "form/loginForm.tiles";
	}
}
