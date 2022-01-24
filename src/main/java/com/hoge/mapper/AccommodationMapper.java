package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.dto.AccommoListDto;
import com.hoge.dto.AccommoPositionDto;
import com.hoge.form.Criteria;
import com.hoge.vo.accommo.AccommoImage;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.accommo.Room;

@Mapper
public interface AccommodationMapper {
	
	List<AccommoPositionDto> getAllAccommoPosition();				// 보류
	Accommodation getAccommodationByNo(int no);						// 예약페이지
	Room getRoomByNo(int no);										// 예약페이지

	int getAccommodationsTotalRows(Criteria criteria);				// list(검색 기능 추가 해야함)
	List<AccommoListDto> searchAccommoListDtos(Criteria criteria);	// list(검색 기능 추가 해야함)
	List<AccommoImage> getAccommoImagesByAccommoNo(int no);			// list
}
