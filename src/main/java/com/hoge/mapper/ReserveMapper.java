package com.hoge.mapper;

import org.apache.ibatis.annotations.Param;

import com.hoge.dto.ReserveAccommoDto;

public interface ReserveMapper {
	
	ReserveAccommoDto getReserveAccommoDto(@Param("accommoNo") int accommoNo, @Param("roomNo") int roomNo);
	
}
