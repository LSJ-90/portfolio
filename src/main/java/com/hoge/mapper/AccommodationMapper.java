package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.vo.accommo.Accommodation;

@Mapper
public interface AccommodationMapper {
	
	List<Accommodation> getAllAccommodations();

}
