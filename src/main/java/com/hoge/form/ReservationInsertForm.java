package com.hoge.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.hoge.vo.accommo.Accommodation;

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
public class ReservationInsertForm {
	
	private int roomNo;
	private String checkInDate;
	private String checkOutDate;
	private String payment;
	private long taxIncludedPrice;
	private long usedPnt;
	private long paidPrice;
	private String roomUserName;
	private String roomUserTel;
	private int extraPeople;

}
