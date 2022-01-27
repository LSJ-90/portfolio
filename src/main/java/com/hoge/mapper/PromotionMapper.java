package com.hoge.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hoge.vo.other.PromotionDiscount;

@Mapper
public interface PromotionMapper {
	
	List<PromotionDiscount> getPromotionDiscount(@Param("accommoNo") int accommoNo, @Param("checkIn") Date checkIn, @Param("checkOut") Date checkOut);

}
