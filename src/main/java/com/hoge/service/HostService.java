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
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.activities.Activity;
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
	public void hostApply(Host host) throws IllegalStateException, IOException {
		//SessionUtils.addAttribute("user_no", "1000"); //세션값 임의 테스트
		//int userNo = Integer.parseInt((String) SessionUtils.getAttribute("user_no"));
		//host.setUserNo(userNo); //세션값 임의 테스트

		User user = (User) SessionUtils.getAttribute("LOGIN_USER"); // 로그인 세션으로 유저정보 불러오기
	    int getUserNo = hostMapper.getUserNoByUserId(user.getId());
	    host.setUserNo(getUserNo);
	    
		hostMapper.insertHostApply(host);
		
		//int x = host.getHostingType();
		//if(x == 1) {
			//숙박
			//hostMapper.insertAccomadation(acc);
		//} else {
			//체험
			//hostMapper.insertActivity(act);
		//}
		
		//이미지삽입
		//imgSave(req);
		
	}
	
	// 유상효 숙소 등록
	public void insertAcc(Accommodation acc) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER"); // 로그인 세션으로 유저정보 불러오기
	    int getHostNo = hostMapper.getHostNoByUserId(user.getId());
	    acc.setHostNo(getHostNo);
		
		hostMapper.insertAcc(acc);
	}
	
  // 유상효
	private void imgSave(MultipartHttpServletRequest req) {

		//이미지명을 가져와서
		//hostMapper.insertImg(fileName);
		
	}

  // 성하민
	public Host getHostByNo(int no) {
		return hostMapper.getHostByNo(no);

	}


}
