package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.dto.AccommoListDto;

@Mapper
public interface AccommodationMapper {
	
	List<AccommoListDto> getAccommoListDto();

}
