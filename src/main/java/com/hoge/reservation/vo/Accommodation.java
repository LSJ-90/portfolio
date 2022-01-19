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
public class Accommodation {

	private int no;
	private int hostNo;
	private String type;
	private String name;
	private String introTitle;
	private String introContent;
	private String webAddress;
	private Date checkInTime;
	private Date checkOutime;
	private double cleanlinessStar;
	private double communicationStar;
	private double accuracyStar;
	private double locationStar;
	private String adress;
	private String regionDepth1;
	private String regionDepth2;
	private String regionDepth3;
	private double xce;
	private double yce;
	private Date registeredDate;
	
}
