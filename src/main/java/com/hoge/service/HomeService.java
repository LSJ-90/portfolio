package com.hoge.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.controller.AdminController;
import com.hoge.dto.AccMainDto;
import com.hoge.dto.HomeAccommoDto;
import com.hoge.mapper.HomeMapper;
import com.hoge.mapper.PromotionMapper;
import com.hoge.vo.accommo.AccommoImage;

/**
 * User에 관한 서비스 로직
 * @author 이승준
 *
 */
@Service
public class HomeService {
	
	static final Logger logger = LogManager.getLogger(AdminController.class);
	
	@Autowired
	private HomeMapper homeMapper;
	
	@Autowired
	private PromotionMapper promotionMapper;
	
	public List<AccMainDto> getNewSixAccommoMainImages() {
		return homeMapper.getNewSixAccommoMainImages();
	}

	public List<HomeAccommoDto> getAccPromotionsForHome() {
		
		List<HomeAccommoDto> homePromotionDiscountDtos = promotionMapper.getAccPromotionsForHome();
		
		for (HomeAccommoDto homePromotionDiscountDto : homePromotionDiscountDtos) {
			
			AccommoImage accommoImage = new AccommoImage();
			accommoImage = homeMapper.getAccMainImage(homePromotionDiscountDto.getNo());
			homePromotionDiscountDto.setMainImage(accommoImage.getImage());

			HomeAccommoDto minMaxDto = new HomeAccommoDto();
			minMaxDto = homeMapper.getMinMaxByHostNo(homePromotionDiscountDto.getHostNo());
			homePromotionDiscountDto.setMinPrice(minMaxDto.getMinPrice());
			homePromotionDiscountDto.setMaxPrice(minMaxDto.getMaxPrice());
			homePromotionDiscountDto.setMinNumber(minMaxDto.getMinNumber());
			homePromotionDiscountDto.setMaxNumber(minMaxDto.getMaxNumber());
			
			logger.info(homePromotionDiscountDto);
		}
		
		return homePromotionDiscountDtos;
	}

	public List<HomeAccommoDto> getAllAccommodation() {
		
		return homeMapper.getAllAccommodation();
	}
	
	
}