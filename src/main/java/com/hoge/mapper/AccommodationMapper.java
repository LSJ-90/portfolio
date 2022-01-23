package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.dto.AccommoPositionDto;
import com.hoge.vo.accommo.AccommoImage;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.accommo.Room;

@Mapper
public interface AccommodationMapper {
	
	List<Accommodation> getAllAccommodations();
	List<Room> getRoomsByAccommoNo(int no);
	List<AccommoImage> getAccommoImageListByAccommoNo(int no);
	List<AccommoPositionDto> getAllAccommoPosition();
	Accommodation getAccommodationByNo(int no);
	Room getRoomByNo(int no);

}
