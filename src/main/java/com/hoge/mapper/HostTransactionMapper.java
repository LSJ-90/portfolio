package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.vo.other.HostTransaction;



@Mapper
public interface HostTransactionMapper {
	
	List<HostTransaction> getHostTransactionByHostNo(int no);
	
	
}
