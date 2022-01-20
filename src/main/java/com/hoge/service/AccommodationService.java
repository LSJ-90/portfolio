package com.hoge.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.mapper.AccommodationMapper;
import com.hoge.vo.accommo.Accommodation;

@Service
public class AccommodationService {
	
	static final Logger logger = LogManager.getLogger(AccommodationService.class);
	
	@Autowired
	private AccommodationMapper accommodationMapper;

	public List<Accommodation> getAllAccommodationList() {
		return accommodationMapper.getAllAccommodations();
	}
	
}
