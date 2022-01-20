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
public class Withdrawal {

	private int hostNo;
	private String accountHolderName;
	private int accountNumber;
	private String BankName;
	private long Amount;
	private String status;
	private Date createdDate;
}
