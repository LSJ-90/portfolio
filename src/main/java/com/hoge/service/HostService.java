package com.hoge.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.mapper.HostMapper;
import com.hoge.vo.other.Host;

/**
 * 
 * @author 성하민
 *
 */
@Service
public class HostService {
	
	@Autowired
	private HostMapper hostMapper;
  
  // 
	public void apply(Host host) {
		hostMapper.insertHostApply(host);
	}
  
  // 성하민
	public Host getHostByNo() {
		return hostMapper.getHostByNo();
	}
}
