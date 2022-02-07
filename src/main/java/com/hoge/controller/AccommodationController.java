package com.hoge.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoge.dto.AccommoListDto;
import com.hoge.dto.MergeAccommoListDto;
import com.hoge.form.Criteria;
import com.hoge.pagination.Pagination;
import com.hoge.restcontroller.AccommoRestController;
import com.hoge.service.AccommodationService;
import com.hoge.vo.accommo.AccommoImage;

@Controller
@RequestMapping("/accommo")
public class AccommodationController {
	
	static final Logger logger = LogManager.getLogger(AccommodationController.class);
	
	@Autowired
	private AccommodationService accommodationService;
	@Autowired
	private AccommoRestController accommoRestController;
	
	// 염주환
	@GetMapping("/list")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page,
			Criteria criteria, Model model) throws Exception {
		
		// logger.info("검색조건값:"+criteria);
		// System.out.println(criteria.getCheckInBoxValue());
		
		int totalRecords = accommodationService.getTotalRows(criteria);
		
		Pagination pagination = new Pagination(page, totalRecords, 5);
		
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		//if (criteria.getCheckInBoxValue() == "" & criteria.getCheckOutBoxValue() == "")
		List<AccommoListDto> accommoListDtos = accommodationService.searchAccommoListDto(criteria);
		
		if (criteria.getCheckInBoxValue() != "" & criteria.getCheckOutBoxValue() != "") {
			List<MergeAccommoListDto> merges = accommoRestController.getMergeAccommoListDto(accommoListDtos, criteria.getCheckInBoxValue(), criteria.getCheckOutBoxValue());

			for (MergeAccommoListDto merge : merges) {
				merge.setAccommoImages(accommodationService.getAccommoImages(merge.getNo()));
			};
			
			model.addAttribute("accommos", merges);
		} else {
			for (AccommoListDto dto : accommoListDtos) {
				dto.setAccommoImages(accommodationService.getAccommoImages(dto.getNo()));
			};
			
			model.addAttribute("accommos", accommoListDtos);
		}
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("criteria", criteria);

		return "accommo/list.tiles";
	}
}