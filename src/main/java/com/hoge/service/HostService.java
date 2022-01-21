package com.hoge.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.mapper.HostMapper;
import com.hoge.vo.other.Host;

@Service
public class HostService {
	
	@Autowired
	private HostMapper hostMapper;

	public void apply(Host host) {
		hostMapper.insertHostApply(host);
	}
	
	
	
}
