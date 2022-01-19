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
public class ReviewAccommo {

	private int no;
	private int userNo;
	private int accommoNo;
	private double cleanlinessStar;
	private double communicationStar;
	private double accuracyStar;
	private double locationStar;
	private Date createdDate;
	private String deleted;
	private Date updatedDate;
	
}
