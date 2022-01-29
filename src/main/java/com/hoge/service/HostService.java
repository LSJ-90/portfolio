package com.hoge.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.swing.text.html.parser.DTD;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.hoge.dto.AccListDto;
import com.hoge.dto.ActListDto;
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
	    // int getUserNo = hostMapper.getUserNoByUserId(user.getId());
	    host.setUserNo(user.getNo());
	    
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
	
	// 유저 아이디로 유저번호 반환
	public int getUserNoByUserId(String userId) {
		int userNo = hostMapper.getUserNoByUserId(userId);
		return userNo;
	}
	
	
	// 숙소 리스트 가져오기
	public List<AccListDto> getAccListByUserNo(int userNo) {
		return hostMapper.getAccListByUserNo(userNo);
	}
	// 체험 리스트 가져오기
	public List<ActListDto> getActListByUserNo(int userNo) {
		return hostMapper.getActListByUserNo(userNo);
	}
	
	
	
  // 성하민
	public Host getHostByNo(int no) {
		return hostMapper.getHostByNo(no);

	}



}
