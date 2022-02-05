package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hoge.dto.ActivityBookingDto;
import com.hoge.form.ActivityReserveForm;
import com.hoge.vo.activities.Activity;
import com.hoge.vo.activities.ActivityBooking;
import com.hoge.vo.activities.ActivityImage;
import com.hoge.vo.activities.ActivityTimeTable;
import com.hoge.vo.other.Transaction;

@Mapper
public interface ActivityMapper {
	
	// 염주환 체험 디테일
	Activity getActivityByNo(int no);
	// 염주환 예약페이지 조회
	List<ActivityTimeTable> getActivityTimeTableByActivityNo(int activitNo);
	// 염주환 booking, transaction 같은 시퀀스번호
	int getActivityBookingNoSeq();
	// 염주환 activitybooking insert
	void insertActivityBooking(@Param("activityReserveForm") ActivityReserveForm activityReserveForm, @Param("activityBookingNo") int activityBookingNo);
	// 염주환 activityTimes update
	void updateActivityTimes(@Param("activityReserveForm") ActivityReserveForm activityReserveForm);
	void updateActivityTimesClosed(@Param("activityReserveForm") ActivityReserveForm activityReserveForm);
	// 염주환 transaction insert
	void insertTransaction(@Param("transaction") Transaction transaction);
	
	// 염주환 예약 완료 페이지
	// 염주환 예약 정보
	ActivityBookingDto getActivityBooking(int userNo);
	// 염주환 체험 이미지
	List<ActivityImage> getActivityImageList(int activitNo);

}
