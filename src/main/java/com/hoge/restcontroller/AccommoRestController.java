package com.hoge.restcontroller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hoge.dto.AccommoPositionDto;
import com.hoge.service.AccommodationService;
import com.hoge.vo.accommo.Accommodation;

@RestController
@RequestMapping("/rest/accommo")
public class AccommoRestController {
	
	@Autowired
	private AccommodationService accommodationService;
	
	// 염주환 보류
	@GetMapping("/marker")
	public List<AccommoPositionDto> list(@RequestParam(value="accommoNoArray[]") List<String> accommoNoArray) {
		List<AccommoPositionDto> positionDtos = new ArrayList<>();
		for (String no : accommoNoArray) {
			AccommoPositionDto dto = new AccommoPositionDto();
			Accommodation accommo = accommodationService.getAccommodationDetail(Integer.parseInt(no));
			dto.setTitle(accommo.getName());
			dto.setXce(accommo.getXce());
			dto.setYce(accommo.getYce());
			positionDtos.add(dto);
		}
		return positionDtos;
	}
}
