package com.hoge.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hoge.dto.PromotionDto;
import com.hoge.form.Criteria;
import com.hoge.vo.other.PromotionDiscount;

@Mapper
public interface PromotionMapper {
	
	List<PromotionDiscount> getPromotionDiscount(@Param("accommoNo") int accommoNo, @Param("checkIn") Date checkIn, @Param("checkOut") Date checkOut);

	
	
	
	List<PromotionDto> getAccDiscountPromotions(Criteria criteria);
	List<PromotionDto> getAccOfferPromotions(Criteria criteria);
	List<PromotionDto> getActDiscountPromotions(Criteria criteria);
	List<PromotionDto> getActOfferPromotions(Criteria criteria);

	int getAccDiscountPromotionCount(Criteria criteria);
	int getAccOfferPromotionCount(Criteria criteria);
	int getActDiscountPromotionCount(Criteria criteria);
	int getActOfferPromotionCount(Criteria criteria);
	
	
	
	
}
