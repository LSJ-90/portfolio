package com.hoge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hoge.service.UserService;
import com.hoge.vo.other.User;
import com.hoge.exception.LoginErrorException;
import com.hoge.util.SessionUtils;

/**
 * 로그인을 위한 컨트롤러
 * @author 이승준
 *
 */
@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/login")
	public String loginFrom(Model model) throws Exception {
		
		return "form/loginForm.tiles";
	}
	
	@PostMapping("/login")
	public String login(String id, String password, Model model) {
		if (!StringUtils.hasText(id) || !StringUtils.hasText(password)) {
			throw new LoginErrorException("<strong>아이디</strong>와 <strong>비밀번호</strong>를 입력해주세요.");
		}		
		
		User user = userService.login(id, password);
		
		SessionUtils.addAttribute("LOGIN_USER", user);
		
		return "redirect:home";
	}
	
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.removeAttribute("LOGIN_USER");
		
		return "redirect:home";
	}
}
