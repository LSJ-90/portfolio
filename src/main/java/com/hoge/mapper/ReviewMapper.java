package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hoge.dto.AdminAccommoReviewDto;
import com.hoge.dto.AdminActivityReviewDto;
import com.hoge.form.Criteria;
import com.hoge.vo.accommo.RoomBooking;
import com.hoge.vo.other.ReviewAccommo;



@Mapper
public interface ReviewMapper {
	
	List<AdminAccommoReviewDto> getAccommoReviewsByCriteria(Criteria criteria);
	
	int getAccommoReviewsTotalRows(Criteria criteria);
	
	
	List<AdminActivityReviewDto> getActivityReviewsByCriteria(Criteria criteria);
	
	int getActivityReviewsTotalRows(Criteria criteria);
	
	
		
		
		
		//성하민 호스트페이지 메인에서 최근 3일 리뷰건수 가져오기
		int getRecentReviewCountByAccommoNo(int no);
		
		//성하민 호스트페이지 메인에서 최근 3일 리뷰데이터 가져오기
		List<AdminAccommoReviewDto> getRecentReviewListByAccommoNo(Criteria criteria); 
		
		//성하민 호스트페이지 메인에서 오늘 리뷰건수 가져오기
		int getTodayReviewCountByAccommoNo(int no);
	
}
