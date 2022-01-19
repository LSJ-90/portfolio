package com.hoge.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PromotionOffer {

	private int no;
	private int hostNo;
	private String Content; //증정 내용
	private Date startingDate;
	private Date endingDate;
	private Date registeredDate;
	private String introContent; //기본적인 소개 내용
	
}
