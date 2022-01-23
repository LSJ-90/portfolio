package com.hoge.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.vo.activities.Activity;

@Mapper
public interface ActivityMapper {
	
	Activity getActivityByNo(int no);

}
