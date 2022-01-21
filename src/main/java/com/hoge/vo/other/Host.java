package com.hoge.vo.other;



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
public class Host {
	private int no;
	private String name;
	private int userNo;
	private String accountHolderName;
	private int accountNumber;
	private String bankName;
	private int hostingType; // 1. 시설 2.체험
	private String tel;
	private String gradeName;

}
