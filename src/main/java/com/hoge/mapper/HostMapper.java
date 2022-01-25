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
	// 유상효 숙소 등록
	Accommodation insertAcc(Accommodation accommodation);
	// 유상효 체험 등록
	Activity insertAct(Activity activity);
	
	
	// 호스트 번호로 호스트객체 반환
	Host getHostByNo(int no);
	
	
	
	
	

	void insertAccomadation(Accommodation acc);

	void insertActivity(Activity act);


}
