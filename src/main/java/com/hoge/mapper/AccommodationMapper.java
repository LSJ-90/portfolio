package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hoge.dto.AccommoListDto;
import com.hoge.dto.AccommoPositionDto;
import com.hoge.dto.ReserveAccommoDto;
import com.hoge.dto.RoomListDto;
import com.hoge.form.Criteria;
import com.hoge.vo.accommo.AccommoImage;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.accommo.Room;
import com.hoge.vo.accommo.RoomBooking;
import com.hoge.vo.accommo.RoomImage;

@Mapper
public interface AccommodationMapper {
	
	List<AccommoPositionDto> getAllAccommoPosition();				// 보류
	Accommodation getAccommodationByNo(int no);						// 예약페이지
	Room getRoomByNo(int no);										// 예약페이지

	int getAccommodationsTotalRows(Criteria criteria);				// list(검색 기능 추가 해야함)
	List<AccommoListDto> searchAccommoListDtos(Criteria criteria);	// list(검색 기능 추가 해야함)
	List<AccommoImage> getAccommoImagesByAccommoNo(int no);			// list
	
	ReserveAccommoDto getReserveAccommoDto(@Param("accommoNo") int accommoNo, @Param("roomNo") int roomNo);
	void insertRoomBooking(@Param("roomBooking") RoomBooking roomBooking, @Param("userNo") int userNo, @Param("no") int no);
	int getRoomBookingNoSeq();
	void insertRoomAvailability(@Param("no") int no, @Param("sqlDate") java.sql.Date sqlDate);
	long getAccumulatedMoney();
	void insertTransactions(@Param("amount") long amount, @Param("accumulated") long accumulated, @Param("userNo") int userNo, @Param("no") int no);
	
	// 유상효 객실 등록
	void insertRoom(Room room);
	// 유상효 객실사진 등록
	void insertRoomImage(RoomImage roomImage);
	// 유상효 accNo로 객실리스트 찾기
	List<RoomListDto> getRoomListByAccNo(int accNo);
	// 유상효  accNo로 객실이미지 찾기
	List<RoomImage> getRoomImagesByRoomNo(int roomNo);
}
