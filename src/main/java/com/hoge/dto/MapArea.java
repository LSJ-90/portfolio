package com.hoge.dto;

import java.util.List;

import com.hoge.vo.accommo.AccommoImage;

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
public class MapArea {
	
	private String number;
	private String checkIn;
	private String checkOut;
	private double swLat;
	private double swLng;
	private double neLat;
	private double neLng;

}
