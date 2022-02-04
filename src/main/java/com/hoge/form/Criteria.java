package com.hoge.form;

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
public class Criteria {

	private String opt;
	private String value;
	private String opt1;
	private String addressValue;
	private String opt2;
	private String checkInBoxValue;
	private String opt3;
	private String checkOutBoxValue;
	private String opt4;
	private String maxStandardNumberValue;
	private int beginIndex;
	private int endIndex;
}
