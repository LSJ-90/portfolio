package com.hoge.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.dto.ReserveAccommoDto;
import com.hoge.mapper.ReserveMapper;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveMapper reserveMapper;
	
	public ReserveAccommoDto getReserveAccommoDto(int accommoNo, int roomNo) {
		return reserveMapper.getReserveAccommoDto(accommoNo, roomNo);
	}

}
