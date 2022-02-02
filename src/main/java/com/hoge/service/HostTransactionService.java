package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.dto.RegisterCountPerDayDto;
import com.hoge.mapper.HostTransactionMapper;
import com.hoge.mapper.StatisticsMapper;
import com.hoge.vo.other.HostTransaction;

/**
 * 
 * @author 성하민
 *
 */
@Service
public class HostTransactionService {

	
	@Autowired
	private HostTransactionMapper hostTransactionMapper;
	
	public List<HostTransaction> getHostTransactionByHostNo(int no){
		return hostTransactionMapper.getHostTransactionByHostNo(no);
	}
	

	
}
