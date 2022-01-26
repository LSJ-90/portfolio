package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hoge.vo.other.HostQnA;


@Mapper
public interface HostQnAMapper {
	
	// 성하민 호스트번호로 문의글 찾기
	List<HostQnA> getHostQnAListByHostNo(@Param("no") int no, @Param("begin") int begin, @Param("end") int end);
	
	//성하민
	void insertHostQnA(HostQnA hostQnA);
	
	//성하민
	int getHostQnACountByHostNo(int no);

}
