package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hoge.dto.AccommoListDto;
import com.hoge.dto.ReserveAccommoDto;
import com.hoge.dto.RoomBookingBatchDto;
import com.hoge.dto.RoomDto;
import com.hoge.dto.RoomListDto;
import com.hoge.form.Criteria;
import com.hoge.vo.accommo.AccommoImage;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.accommo.Room;
import com.hoge.vo.accommo.RoomBooking;
import com.hoge.vo.accommo.RoomImage;

@Mapper
public interface AccommodationMapper {
	
	// list페이지
	// 염주환 listDtos
	List<AccommoListDto> searchAccommoListDtos(Criteria criteria);
	// 염주환 페이지네이션을 위함
	int getAccommodationsTotalRows(Criteria criteria);				// list
	// 염주환 숙소list 사진
	List<AccommoImage> getAccommoImagesByAccommoNo(int no);			// list
	
	Accommodation getAccommodationByNo(int no);						// 예약페이지
	Room getRoomByNo(int no);										// 예약페이지

	
	// 예약페이지
	// 염주환 예약페이지 숙소 관련 정보
	ReserveAccommoDto getReserveAccommoDto(@Param("accommoNo") int accommoNo, @Param("roomNo") int roomNo);
	// 염주환 roombooking insert
	void insertRoomBooking(@Param("roomBooking") RoomBooking roomBooking, @Param("userNo") int userNo, @Param("no") int no, @Param("tid") String tid);
	// 염주환 roombooking, availability, transactions에 같은 no 넣기 위함
	int getRoomBookingNoSeq();
	// 염주환 availability insert
	void insertRoomAvailability(@Param("no") int no, @Param("sqlDate") java.sql.Date sqlDate);
	// 염주환 AccumulatedMoney 금액 추가하기 위함
	long getAccumulatedMoney();
	// 염주환 transactions insert
	void insertTransactions(@Param("amount") long amount, @Param("accumulated") long accumulated, @Param("userNo") int userNo, @Param("no") int no);
	// 염주환 user usedPnt
	void updateUserPnt(@Param("userNo") int userNo, @Param("usedPnt") long usedPnt);
	
	// 예약완료페이지
	// 염주환 예약정보 가져오기
	RoomBooking getRoomBookingByUserNO(int userNo);
	
	// 유상효 객실 등록
	void insertRoom(Room room);
	// 유상효 객실사진 등록
	void insertRoomImage(RoomImage roomImage);
	// 유상효 accNo로 객실리스트 찾기
	List<RoomListDto> getRoomListByAccNo(int accNo);
	// 유상효  roomNo로 객실이미지 찾기
	List<RoomImage> getRoomImagesByRoomNo(int roomNo);
	// 유상효 roomNo로 객실정보 가져오기
	RoomDto getRoomByRoomNo(int roomNo);
	// 유상효 객실 수정
	void roomModify(Room room);
	
	
	//성하민 예약정보 변경
	void updateRoomBooking(RoomBooking roomBooking);
	
	//성하민 방 예약정보 가져오기
	RoomBooking getRoomBookingByRoomBookingNo(int no);
	
	//성하민 방 예약+호스트정보+grade 정보 가져오기
	List<RoomBookingBatchDto> getRoomBookingBatchDto();
}
