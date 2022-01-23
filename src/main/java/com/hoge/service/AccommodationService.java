package com.hoge.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.dto.AccommoDto;
import com.hoge.dto.AccommoPositionDto;
import com.hoge.mapper.AccommodationMapper;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.accommo.Room;

@Service
public class AccommodationService {
	
	@Autowired
	private AccommodationMapper accommoMapper;
	
	// 염주환
	public List<AccommoDto> getAccommoDto() {
		List<Accommodation> accommoList = accommoMapper.getAllAccommodations();
		List<AccommoDto> accommoDto = new ArrayList<>();
		
		for (Accommodation accommo : accommoList) {
			AccommoDto dto = new AccommoDto(); 
			dto.setNo(accommo.getNo());
			dto.setHostNo(accommo.getHostNo());
			dto.setType(accommo.getType());
			dto.setName(accommo.getName());
			dto.setAverageStar((accommo.getCleanlinessStar() + accommo.getCommunicationStar() + accommo.getAccuracyStar() + accommo.getLocationStar())/4); 
			dto.setRegionDepth1(accommo.getRegionDepth1());
			dto.setRegionDepth2(accommo.getRegionDepth2());
			dto.setRegionDepth3(accommo.getRegionDepth3());
			dto.setXce(accommo.getXce()); 
			dto.setYce(accommo.getYce());
			
			dto.setMinPrice(0);
			dto.setMaxPrice(0);
			
			List<Room> rooms = accommoMapper.getRoomsByAccommoNo(accommo.getNo());
			int min = 100;
			int max = 0;
			for (Room room : rooms) {
				if (min > room.getStandardNumber()) {
					min = room.getStandardNumber();
				} 
				if (max < room.getStandardNumber()) {
					max = room.getStandardNumber();
				}
			}
			dto.setMinNumber(min);
			dto.setMaxNumber(max);
			
			accommoDto.add(dto);
		}
		
		return accommoDto;
	}
	
	public List<AccommoPositionDto> getAccommoPosition() {
		return accommoMapper.getAllAccommoPosition();
	}
	
	public Accommodation getAccommodationDetail(int no) {
		return accommoMapper.getAccommodationByNo(no);
	}
	
	public Room getRoomDetail(int no) {
		return accommoMapper.getRoomByNo(no);
	}
}
