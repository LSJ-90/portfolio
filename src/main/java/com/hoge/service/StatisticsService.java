package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.dto.LabelDataDto;
import com.hoge.mapper.StatisticsMapper;

/**
 * 
 * @author 성하민
 *
 */
@Service
public class StatisticsService {

	
	@Autowired
	private StatisticsMapper statisticsMapper;
	
	public List<LabelDataDto> getRegisterCountPerDayDto(){
		return statisticsMapper.getRegisterCountPerDayDto();
	}
	
	public List<LabelDataDto> getTransactionAmountPerDay(){
		return statisticsMapper.getTransactionAmountPerDay();
	}
	
	 public List<LabelDataDto> getSalesPerDayByHostNo(int no){
		 return statisticsMapper.getSalesPerDayByHostNo(no);
	 }
	 
	 public List<LabelDataDto> getProfitAmountPerMonth(){
		 return statisticsMapper.getProfitAmountPerMonth();
	 }

	
}
