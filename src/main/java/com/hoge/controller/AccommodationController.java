package com.hoge.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoge.dto.AccommoListDto;
import com.hoge.service.AccommodationService;

@Controller
@RequestMapping("/accommo")
public class AccommodationController {
	
	static final Logger logger = LogManager.getLogger(AccommodationController.class);
	
	@Autowired
	private AccommodationService accommodationService;
	
	@GetMapping("/list.do")
	public String list(Model model) {
		List<AccommoListDto> dtos = accommodationService.getAllAccommoList();
		model.addAttribute("accommos", dtos);
		
		return "accommo/list";
	}
}
