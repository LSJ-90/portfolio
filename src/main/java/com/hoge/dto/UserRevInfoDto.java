package com.hoge.dto;

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
public class UserRevInfoDto {
    private String accommoName;
    private String roomName;
    private int roomNo;
    private String accommoRegionDepth1;
    private String accommoRegionDepth2;
    private Date checkInDate;
    private Date checkOutDate;
    private String roomTaxIncludedPrice;
    private int no;
}