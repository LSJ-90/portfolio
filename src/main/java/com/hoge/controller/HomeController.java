package com.hoge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * HOGE 웹사이트의 홈 컨트롤러
 * @author 이승준
 *
 */
@Controller
public class HomeController {
	
	// 이승준: 홈 페이지로 리턴
	@GetMapping("/home")
	public String home(Model model) throws Exception {
		model.addAttribute("message", "HOGE 방문을 환영합니다.");
		
		return "home.tiles";
	}
}