package com.hoge.dto;

import java.util.List;


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
public class PriceDto {

	private int weekdayNumber;
	private int weekendNumber;
	private int peakSeasonNumber;
	private long roomPrice;
	private long surcharge;
	private long totalPrice;
	private long pricePerPerson;
	private long discountAmount;
	private List<PromotionDiscountDto> promotionDiscounts;
	
}
