package com.hoge.reservation.vo;

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
public class PromotionDiscount {

	private int no;
	private int hostNo;
	private double weekdaysDiscountRate;
	private double weekendDiscountRate;
	private double peakSeasonDiscountRate;
	private Date startingDate;
	private Date endingDate;
	private Date registeredDate;
	private String introContent;
	
	
	
}
