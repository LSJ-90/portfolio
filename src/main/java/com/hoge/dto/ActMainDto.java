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
public class ActMainDto {
	
	private int hostNo;
	private int hostingType;
	private String hostName;
	private String tel;
	private String accountHolderName;
	private String bankName;
	private int accountNumber;
	private String mainImage;
	
	private int actNo;
	private String actName;
	private String actIntroTitle;
	private String actIntroContent;
	private int actMaximumNumber;
	private int actPricePerPerson;
	private String actAddress;

}
