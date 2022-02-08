package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.dto.LabelDataDto;



@Mapper
public interface StatisticsMapper {
	
	List<LabelDataDto> getRegisterCountPerDayDto();
	
	List<LabelDataDto> getSalesPerDayByHostNo(int no);
	
	
	List<LabelDataDto> getTransactionAmountPerDay();
	
	List<LabelDataDto> getProfitAmountPerMonth();
	
}
