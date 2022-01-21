package com.hoge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hoge.service.UserService;
import com.hoge.vo.other.User;
import com.hoge.exception.LoginException;
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
	
	// 이승준: 로그인폼 페이지 리턴
	@GetMapping("/login")
	public String loginFrom(Model model) throws Exception {
		
		return "form/loginForm.tiles";
	}
	
	// 이승준: 로그인 성공 시 홈 페이지로 리다이렉트(관리자일 경우 관리자페이지 메인으로 리다이렉트)
	@PostMapping("/login")
	public String login(String id, String pwd) {
		if (!StringUtils.hasText(id) || !StringUtils.hasText(pwd)) {
			throw new LoginException("<strong>아이디</strong> 또는 <strong>비밀번호</strong>를 입력하지 않았습니다.");
		}		
		
		User user = userService.login(id, pwd);
		
		SessionUtils.addAttribute("LOGIN_USER", user);
		
		if ("hong".equals(user.getId())) {
			return "redirect:admin/main";
		}
		
		return "redirect:home";
	}
	
	// 이승준: 로그아웃 시 홈 페이지로 리다이렉트
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.removeAttribute("LOGIN_USER");
		
		return "redirect:home";
	}
}