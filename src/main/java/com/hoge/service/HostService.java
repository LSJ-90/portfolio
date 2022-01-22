package com.hoge.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.mapper.HostMapper;
import com.hoge.util.SessionUtils;
import com.hoge.vo.other.Host;

/**
 * 
 * @author 성하민, 유상효
 *
 */
@Service
public class HostService {
	
	@Autowired
	private HostMapper hostMapper;
  
  // 유상효
	public void apply(Host host) {
		SessionUtils.addAttribute("user_no", "1000"); //세션값 임의 테스트
		int userNo = Integer.parseInt((String) SessionUtils.getAttribute("user_no"));
		host.setUserNo(userNo); //세션값 임의 테스트
		
		hostMapper.insertHostApply(host);
		
		int x = host.getHostingType();
		if(x == 1) {
			//숙박
		} else {
			//체험
		}
	}
  
  // 성하민
	public Host getHostByNo(int no) {
		return hostMapper.getHostByNo(no);
	}
}
