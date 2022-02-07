package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.dto.AdminAccommoListDto;
import com.hoge.form.Criteria;
import com.hoge.mapper.AccommodationMapper;
@Service
public class AdminService {

	@Autowired
	private AccommodationMapper accommodationMapper;

	//성하민 관리자페이지에서 숙소정보 가져오기
	public List<AdminAccommoListDto> getAccommoListForAdmin(Criteria criteria){
		return accommodationMapper.getAccommoListForAdmin(criteria);
	}
	
	//성하민 관리자페이지에서 숙소 개수 가져오기
	public int getAccommoCountForAdmin(Criteria criteria) {
		return accommodationMapper.getAccommoCountForAdmin(criteria);
	}
	
}
