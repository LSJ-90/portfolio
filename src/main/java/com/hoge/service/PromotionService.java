package com.hoge.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.mapper.PromotionMapper;
import com.hoge.vo.other.PromotionDiscount;

@Service
public class PromotionService {
	
	@Autowired
	private PromotionMapper promotionMapper;
	
	public List<PromotionDiscount> getPromotionDiscountDetail(int accommoNo, Date checkIn, Date checkOut) {
		return promotionMapper.getPromotionDiscount(accommoNo, checkIn, checkOut);
	}

}
