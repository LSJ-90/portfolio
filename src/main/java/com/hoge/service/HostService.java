package com.hoge.service;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.hoge.mapper.HostMapper;
import com.hoge.util.SessionUtils;
import com.hoge.vo.accommo.AccommoImage;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.activities.Activity;
import com.hoge.vo.activities.ActivityImage;
import com.hoge.vo.other.Host;
import com.hoge.vo.other.User;

/**
 * 
 * @author 성하민, 유상효
 *
 */
@Service
public class HostService {
	
	@Autowired
	private HostMapper hostMapper;
  
	// 유상효 호스트 등록
	public void hostApply(Host host, Accommodation acc, Activity act, List<AccommoImage> accImages, List<ActivityImage> actImages) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER"); // 로그인 세션으로 유저정보 불러오기
	    int getUserNo = hostMapper.getUserNoByUserId(user.getId());
	    host.setUserNo(getUserNo);
	    
	    int hostType = host.getHostingType();
	    if (hostType == 1) {
	    	hostMapper.insertHostApply(host);
	    	acc.setHostNo(host.getNo()); // 호스트 시퀀스 들고오기
	    	hostMapper.insertAcc(acc);
	    	for (AccommoImage accImage : accImages) {
	    		accImage.setAccommoNo(acc.getNo()); // 숙소 시퀀스 들고오기
	    		hostMapper.insertAccImage(accImage);
	    	}
	    	
	    } else {
	    	hostMapper.insertHostApply(host);
	    	act.setHostNo(host.getNo()); // 호스트 시퀀스 들고오기
	    	hostMapper.insertAct(act);
	    	for (ActivityImage actImage : actImages) {
	    		actImage.setActivityNo(act.getNo()); // 체험 시퀀스 들고오기
	    		hostMapper.insertActImage(actImage);
	    	}
	    }
	}
	
	// 유상효 숙소 등록
	public void insertAcc(Accommodation acc) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER"); // 로그인 세션으로 유저정보 불러오기
	    int getHostNo = hostMapper.getHostNoByUserId(user.getId());
	    acc.setHostNo(getHostNo);
		
		hostMapper.insertAcc(acc);
	}
	
  // 성하민
	public Host getHostByNo(int no) {
		return hostMapper.getHostByNo(no);

	}


}
