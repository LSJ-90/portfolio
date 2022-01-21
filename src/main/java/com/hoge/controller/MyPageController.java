package com.hoge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		return "mypage/main.tiles";
	}
}
