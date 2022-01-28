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
public class AdminUserQnADto {
	
	private int questionNo;
	private int userNo;
	private String userName;
	private String userId;
	private String category;
	private String title;
	private String content;
	private String answered;
	private Date questionDate;
	private String answerContent;
	private Date answerUpdateDate;
	private String answerModified; //답변 수정 여부
	

	

}
