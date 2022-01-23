package com.hoge.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.activities.Activity;
import com.hoge.vo.other.Host;

/**
 * 유저 기능에 관한 메서드명을 정의하였다.
 * @author 유상효, 성하민
 *
 */
@Mapper
public interface HostMapper {
	
	// 유상효 호스트 등록
	Host insertHostApply(Host host);
	Accommodation insertAcc(Accommodation accommodation);
	Activity insertAct(Activity activity);
	
	
	/**
	 * 성하민
	 * @return Host번호로 Host반환
	 */
	Host getHostByNo();

	void insertAccomadation(Accommodation acc);

	void insertActivity(Activity act);


}
