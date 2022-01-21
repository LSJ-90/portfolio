package com.hoge.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.vo.other.Host;

@Mapper
public interface HostMapper {
	
	/**
	 * 성하민
	 * @return Host번호로 Host반환
	 */
	Host getHostByNo();

}
