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
public class AccListDto {
	
	private String accName;
	private int accNo;
	private int hostingType;
	private String mainImage;

}
