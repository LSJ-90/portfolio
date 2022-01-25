package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.vo.other.HostQnA;


@Mapper
public interface HostQnAMapper {
	
	// 성하민 호스트번호로 문의글 찾기
	List<HostQnA> getHostQnAListByHostNo(int no);

}
