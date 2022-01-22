package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.vo.other.ChatRoom;


@Mapper
public interface ChatRoomMapper {

	List<ChatRoom> getChatRoomsbyUserNo(int no); //게스트 유저 번호로 chatroom 조회, 마이페이지 채팅구현 
	
	List<ChatRoom> getChatRoomsbyHostNo(int no); //호스트 번호로 chatroom 조회, 호스프 페이지 채팅 구현
	
	
	
}
