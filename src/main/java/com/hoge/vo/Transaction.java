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
public class Transaction {
	
	private int no;
	private String type;
	private long amount;
	private int hostNo;
	private Date createdDate;
	private int activityBookingNo;
	private int accommoBookingNo;
	private long accumulatedMoney;
	
	

}
