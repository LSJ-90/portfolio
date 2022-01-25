package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.mapper.HostQnAMapper;
import com.hoge.vo.other.HostQnA;

/**
 * 
 * @author 성하민, 유상효
 *
 */
@Service
public class HostQnAService {
	
	@Autowired
	private HostQnAMapper hostQnAMapper;
	

	// 성하민 호스트번호로 문의글 찾기
	public List<HostQnA> getHostQnAListByHostNo(int no) {

		// 성하민 호스트번호로 문의글 찾기
		return hostQnAMapper.getHostQnAListByHostNo(no);
	}
  

}
