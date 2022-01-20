package com.hoge.vo.other;

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
public class ReviewActivity {

	private int no;
	private int userNo;
	private int activityNo;
	private double star;
	private Date createdDate;
	private String deleted;
	private Date updatedDate;
	
}
