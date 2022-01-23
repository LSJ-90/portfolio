package com.hoge.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.mapper.ReserveMapper;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveMapper reserveMapper;

}
