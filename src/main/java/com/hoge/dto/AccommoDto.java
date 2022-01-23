package com.hoge.dto;

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
public class AccommoDto {
	
	private int no;
	private int hostNo;
	private String type;
	private String name;
	private double averageStar;
	private String regionDepth1;
	private String regionDepth2;
	private String regionDepth3;
	private double xce;
	private double yce;
	private long minPrice;
	private long maxPrice;
	private int minNumber;
	private int maxNumber;

}
