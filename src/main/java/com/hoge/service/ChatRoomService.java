package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.form.CriteriaAdminUser;
import com.hoge.mapper.ChatRoomMapper;
import com.hoge.mapper.UserMapper;
import com.hoge.vo.other.ChatRoom;
import com.hoge.vo.other.User;

/**
 * ChatRoom관련 로직
 * @author 성하민
 *
 */
@Service
public class ChatRoomService {
	
	@Autowired
	private ChatRoomMapper chatRoomMapper;
	
	public List<ChatRoom> getChatRoomsbyUserNo(int no) {
		
		//게스트 유저 번호로 chatroom 조회, 마이페이지 채팅구현 
		return chatRoomMapper.getChatRoomsbyUserNo(no);
	}
	
	public List<ChatRoom> getChatRoomsbyHostNo(int no) {
		//호스트 번호로 chatroom 조회, 호스프 페이지 채팅 구현
		return chatRoomMapper.getChatRoomsbyHostNo(no);
	}
	
	
	
}
