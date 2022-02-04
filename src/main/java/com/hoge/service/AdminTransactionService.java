package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.dto.RegisterCountPerDayDto;
import com.hoge.form.Criteria;
import com.hoge.mapper.HostTransactionMapper;
import com.hoge.mapper.StatisticsMapper;
import com.hoge.mapper.TransactionMapper;
import com.hoge.vo.other.HostTransaction;
import com.hoge.vo.other.Transaction;

/**
 * 
 * @author 성하민
 *
 */
@Service
public class AdminTransactionService {

	
	@Autowired
	private TransactionMapper transactionMapper;
	
	public List<Transaction> getTransactionList(Criteria criteria){
		List<Transaction> transactionList = transactionMapper.getTransactionList(criteria);
		return transactionList;
	}
	
	public int getTransactionListTotalRows(Criteria criteria) {
		return transactionMapper.getTransactionListTotalRows(criteria);
		
	}

	
}
