package com.hoge.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * sender와 reciever의 정보를 반환하는 dto
 * @author 성하민
 *
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChattingMessageDto {
	
	private int chatRoomNo;
	private int hostNo;
	private int hostName;
	
	private int hostingType; // 1. 시설 2.체험
	private String tel;
	private String gradeName;
	
	private int sendingUserNo;
	private int sendingUserName;
	private String sendingUserImage;
	
	private int receivingUserNo;
	private String receivingUserImage;
	private int receivingUserName;
	
	private String content;
	private String checked; //확인 여부
	private Date sendingDate;

}
