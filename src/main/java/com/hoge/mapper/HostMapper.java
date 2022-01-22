package com.hoge.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.hoge.vo.other.Host;

/**
 * 유저 기능에 관한 메서드명을 정의하였다.
 * @author 유상효, 성하민
 *
 */
@Mapper
public interface HostMapper {

	Host insertHostApply(Host host);
	
	/**
	 * 성하민
	 * @return Host번호로 Host반환
	 */
	Host getHostByNo(int no);



}
