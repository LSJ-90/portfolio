package com.hoge.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoge.form.Criteria;

@Controller
@RequestMapping("/accommo")
public class AccommodationController {
	
	static final Logger logger = LogManager.getLogger(AccommodationController.class);
	
	// 염주환
	@GetMapping("/list")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page,
			Criteria criteria, Model model) throws Exception {
		
		model.addAttribute("criteria", criteria);

		return "accommo/list.tiles";
	}
}