package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.dto.AdminAccommoReviewDto;
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
	
}
