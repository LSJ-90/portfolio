package com.hoge.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hoge.dto.AccommoPositionDto;
import com.hoge.service.AccommodationService;

@RestController
@RequestMapping("/rest/accommo")
public class AccommoRestController {
	
	@Autowired
	private AccommodationService accommodationService;
	
	// 염주환 보류
	@GetMapping("/list")
	public List<AccommoPositionDto> list() {
		return accommodationService.getAccommoPosition();
	}
}
