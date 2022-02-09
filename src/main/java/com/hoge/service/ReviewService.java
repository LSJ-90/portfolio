package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.dto.AdminAccommoReviewDto;
import com.hoge.dto.AdminActivityReviewDto;
import com.hoge.form.Criteria;
import com.hoge.mapper.ReviewMapper;

/**
 * 
 * @author 성하민
 *
 */
@Service
public class ReviewService {

	
	@Autowired
	private ReviewMapper reviewMapper;
	
	
	public List<AdminAccommoReviewDto> getAccommoReviewsByCriteria(Criteria criteria){
		return reviewMapper.getAccommoReviewsByCriteria(criteria);
	}
	
	
	
	public int getAccommoReviewsTotalRows(Criteria criteria) {
		return reviewMapper.getAccommoReviewsTotalRows(criteria);
	}
	
	public List<AdminActivityReviewDto> getActivityReviewsByCriteria(Criteria criteria){
		return reviewMapper.getActivityReviewsByCriteria(criteria);
	}
	
	
	
	public int getActivityReviewsTotalRows(Criteria criteria) {
		return reviewMapper.getActivityReviewsTotalRows(criteria);
	}
	
	

	//성하민 호스트페이지 메인에서 최근 3일 리뷰건수 가져오기
	public int getRecentReviewCountByAccommoNo(int no) {
		return reviewMapper.getRecentReviewCountByAccommoNo(no);
	}
	
	//성하민 호스트페이지 메인에서 최근 3일 리뷰데이터 가져오기
	public List<AdminAccommoReviewDto> getRecentReviewListByAccommoNo(Criteria criteria){
		return reviewMapper.getRecentReviewListByAccommoNo(criteria);
	}
	
	//성하민 호스트페이지 메인에서 오늘 리뷰건수 가져오기
	public int getTodayReviewCountByAccommoNo(int no) {
		return reviewMapper.getTodayReviewCountByAccommoNo(no);
	}
	
	
}
