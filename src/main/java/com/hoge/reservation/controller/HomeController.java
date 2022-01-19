package com.hoge.reservation.controller;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@Autowired
	DataSource dataSource;

	@GetMapping("/")
	public String home(Model model) throws Exception {
		model.addAttribute("message", "홈페이지 방문을 환영합니다.");
		
		return "home";
	}
}
