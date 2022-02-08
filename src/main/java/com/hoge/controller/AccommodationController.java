package com.hoge.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoge.form.Criteria;
import com.hoge.pagination.Pagination;
import com.hoge.service.AccommodationService;

@Controller
@RequestMapping("/accommo")
public class AccommodationController {
	
	static final Logger logger = LogManager.getLogger(AccommodationController.class);
	
	@Autowired
	private AccommodationService accommodationService;
	
	// 염주환
	@GetMapping("/list")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page,
			Criteria criteria, Model model) throws Exception {
		
		int totalRecords = accommodationService.getTotalRows(criteria);
		
		Pagination pagination = new Pagination(page, totalRecords, 5);
		
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("criteria", criteria);

		return "accommo/list.tiles";
	}
}