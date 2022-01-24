package com.hoge.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.dto.AccommoListDto;
import com.hoge.dto.AccommoPositionDto;
import com.hoge.form.Criteria;
import com.hoge.mapper.AccommodationMapper;
import com.hoge.vo.accommo.AccommoImage;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.accommo.Room;

@Service
public class AccommodationService {
	
	@Autowired
	private AccommodationMapper accommoMapper;
	
	// 보류
	public List<AccommoPositionDto> getAccommoPosition() {
		return accommoMapper.getAllAccommoPosition();
	}
	
	// 염주환
	public Accommodation getAccommodationDetail(int no) {
		return accommoMapper.getAccommodationByNo(no);
	}
	
	// 염주환
	public Room getRoomDetail(int no) {
		return accommoMapper.getRoomByNo(no);
	}
	
	// 염주환
	public int getTotalRows(Criteria criteria) {
		return accommoMapper.getAccommodationsTotalRows(criteria);
	}
	
	// 염주환
	public List<AccommoListDto> searchAccommoListDto(Criteria criteria) {
		List<AccommoListDto> accommoListDtos = accommoMapper.searchAccommoListDtos(criteria);
		for (AccommoListDto dto : accommoListDtos) {
			List<AccommoImage> accommoImages = accommoMapper.getAccommoImagesByAccommoNo(dto.getNo());
			dto.setAccommoImages(accommoImages);
		}
		
		return accommoListDtos;
	}
}
