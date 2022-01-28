package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.dto.ChattingListDto;
import com.hoge.dto.ChattingMessageDto;
import com.hoge.mapper.ChatRoomMapper;
import com.hoge.vo.other.ChatRoom;
import com.hoge.vo.other.Message;

/**
 * ChatRoom관련 로직
 * @author 성하민
 *
 */
@Service
public class ChatRoomService {
	
	@Autowired
	private ChatRoomMapper chatRoomMapper;
	
	//성하민
	public List<ChatRoom> getChatRoomsbyUserNo(int no) {
		
		//게스트 유저 번호로 chatroom 조회, 마이페이지 채팅구현 
		return chatRoomMapper.getChatRoomsbyUserNo(no);
	}
	
	//성하민
	public List<ChatRoom> getChatRoomsbyHostNo(int no) {
		//호스트 번호로 chatroom 조회, 호스프 페이지 채팅 구현
		return chatRoomMapper.getChatRoomsbyHostNo(no);
	}
	
	
	//성하민
	public List<ChattingMessageDto> getMessagesByChatRoomNo(int no){
		return chatRoomMapper.getMessagesByChatRoomNo(no);
	}
	
	

	//성하민
	public List<ChattingListDto> getChattingListDtobyHostNo(int no) {
		return chatRoomMapper.getChattingListDtobyHostNo(no);
	}
	// //호스트 번호로 chatroom 조회, 호스프 페이지 채팅 구현
	
	
	//성하민
	public List<ChattingListDto> getChattingListDtobyUserNo(int no) {
		return chatRoomMapper.getChattingListDtobyUserNo(no);
	}
	// //호스트 번호로 chatroom 조회, 마이 페이지 채팅 구현
	
	
	public void insertMessage(Message message) {
		chatRoomMapper.insertMessage(message);
	}
	
	
	
	public void updateChatRoom(ChatRoom chatRoom) {
		chatRoomMapper.updateChatRoom(chatRoom);
	}
	
	public ChatRoom getChatRoomByChatRoomNo(int no) {
		return chatRoomMapper.getChatRoomByChatRoomNo(no);
		
	}
	
}
