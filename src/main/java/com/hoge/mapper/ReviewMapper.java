package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hoge.dto.AdminAccommoReviewDto;
import com.hoge.dto.AdminActivityReviewDto;
import com.hoge.form.Criteria;



@Mapper
public interface ReviewMapper {
	
	List<AdminAccommoReviewDto> getAccommoReviewsByCriteria(Criteria criteria);
	
	int getAccommoReviewsTotalRows(Criteria criteria);
	
	
	List<AdminActivityReviewDto> getActivityReviewsByCriteria(Criteria criteria);
	
	int getActivityReviewsTotalRows(Criteria criteria);
	
}
