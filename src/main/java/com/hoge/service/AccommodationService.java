package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.dto.AccommoListDto;
import com.hoge.mapper.AccommodationMapper;

@Service
public class AccommodationService {
	
	@Autowired
	private AccommodationMapper accommoMapper;

	public List<AccommoListDto> getAllAccommoList() {
		return accommoMapper.getAccommoListDto();
	}
	
}
