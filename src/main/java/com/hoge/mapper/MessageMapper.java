package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.logging.log4j.message.Message;

@Mapper
public interface MessageMapper {

	List<Message> getMessagesByChatRoomNo();
	
	
}
