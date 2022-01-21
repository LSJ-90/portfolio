package com.hoge.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoge.service.AccommodationService;
import com.hoge.vo.accommo.Accommodation;

@Controller
@RequestMapping("/accommo")
public class AccommodationController {
	
	static final Logger logger = LogManager.getLogger(AccommodationController.class);
	
	@Autowired
	private AccommodationService accommodationService;
	
	@GetMapping("/list.do")
	public String list(Model model) {
		List<Accommodation> accommodations = accommodationService.getAllAccommodationList();
		model.addAttribute("accommodations", accommodations);
		
		return "accommo/list.tiles";
	}
}
