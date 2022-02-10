package com.hoge.dto;

import java.util.Date;
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
public class UserRevInfoDto {
	private int roomBookingNo;
	private int accommoNo;
    private String accommoName;
    private String roomName;
    private int roomNo;
    private String accommoRegionDepth1;
    private String accommoRegionDepth2;
    private Date checkInDate;
    private Date checkOutDate;
    private String roomTaxIncludedPrice;
    private List<AccommoImage> accommoImages;
}