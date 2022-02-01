package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hoge.vo.other.Withdrawal;




@Mapper
public interface WithdrawalMapper {
	
	void insertWithdrawal(Withdrawal withdrawal); 
	List<Withdrawal> getHostWithdrawalListByHostNo(@Param("no") int no, @Param("begin") int begin, @Param("end") int end);
	
	int getWithdrawalCountByHostNo(int no);
	
}
