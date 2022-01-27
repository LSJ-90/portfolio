package com.hoge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoge.util.SessionUtils;
import com.hoge.vo.other.User;

/**
 * 마이페이지 컨트롤러
 * @author 이승준
 *
 */
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	// 이승준: 마이페이지 메인 페이지로 리턴
	@GetMapping("/main")
	public String myPageMainInit() { 
		
		User savedUser = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		if (savedUser == null) {
			return "redirect:../login";
		}
		
		return "mypage/main.mytiles";
	}
}
