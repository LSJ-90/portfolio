package com.hoge.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.dto.AccListDto;
import com.hoge.dto.AccMainDto;
import com.hoge.dto.ActListDto;
import com.hoge.dto.ActMainDto;
import com.hoge.vo.accommo.AccommoImage;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.activities.Activity;
import com.hoge.vo.activities.ActivityImage;
import com.hoge.vo.other.Host;
import com.hoge.vo.other.User;

/**
 * 유저 기능에 관한 메서드명을 정의하였다.
 * @author 유상효, 성하민
 *
 */
@Mapper
public interface HostMapper {
	
	// 유상효 호스트 등록
	void insertHostApply(Host host);
	// 유상효 숙소 등록
	void insertAcc(Accommodation acc);
	// 유상효 체험 등록
	void insertAct(Activity act);
	// 유상효 로그인세션에서 userNo 가져오기
	int getUserNoByUserId(String userId);
	// 유상효 로그인세션에서 userId를 받아와서 hostNo 가져오기(hostNo중 가장 큰 넘버를 가져온다)
	int getHostNoByUserId(String userId);
	
	// 유상효 이미지 저장 & 이미지 불러오기
	void insertAccImage(AccommoImage accommoImage);
	void insertActImage(ActivityImage activityImage);
	List<AccommoImage> getAccImagesByAccNo(int accNo);
	List<AccommoImage> getAccImagesByHostNo(int hostNo);
	List<ActivityImage> getActImagesByActNo(int actNo);
	List<ActivityImage> getActImagesByHostNo(int hostNo);
	
	// 유상효 유저넘버로 호스팅리스트 찾기
	List<AccListDto> getAccListByUserNo(int userNo);
	List<ActListDto> getActListByUserNo(int userNo);
	
	// 유상효 호스트넘버로 정보 찾기
	AccMainDto getAccMainByHostNo(int hostNo);
	ActMainDto getActMainByHostNo(int hostNo);
	
	// 유상효 호스트넘버로 호스트수정
	void modifyHostByHostNo(Host host);
	void modifyAccByHostNo(Accommodation acc);
	void modifyActByHostNo(Activity act);
	void modifyAccImagesByHostNo(List<AccommoImage> accImages);
	void modifyActImagesByHostNo(List<ActivityImage> actImages);
	
	
	// 호스트 번호로 호스트객체 반환
	Host getHostByNo(int no);
	
	
	
	
	

	void insertAccomadation(Accommodation acc);

	void insertActivity(Activity act);
	

	
	
	//성하민
	void updateHost(Host host);
	

}
