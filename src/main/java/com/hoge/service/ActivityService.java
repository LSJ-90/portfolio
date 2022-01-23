package com.hoge.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.mapper.ActivityMapper;
import com.hoge.vo.activities.Activity;

@Service
public class ActivityService {
	
	@Autowired
	private ActivityMapper activityMapper;
	
	// 염주환
	public Activity getActivityDetail(int no) {
		return activityMapper.getActivityByNo(no);
	}
	

}
