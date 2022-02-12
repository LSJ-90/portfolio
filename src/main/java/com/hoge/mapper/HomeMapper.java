package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.dto.AccMainDto;
import com.hoge.dto.HomeAccommoDto;
import com.hoge.vo.accommo.AccommoImage;

/**
 * 홈 기능에 관한 메서드명을 정의하였다.
 * @author 이승준
 *
 */
@Mapper
public interface HomeMapper {
	
	List<AccMainDto> getNewSixAccommoMainImages();
	AccommoImage getAccMainImage(int discountProMotionNo);
	HomeAccommoDto getMinMaxByHostNo(int hostNo);
	List<HomeAccommoDto> getAllAccommodation();
}
