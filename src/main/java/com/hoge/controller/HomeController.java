package com.hoge.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoge.dto.AccMainDto;
import com.hoge.dto.HomeAccommoDto;
import com.hoge.form.Criteria;
import com.hoge.service.HomeService;
import com.hoge.service.HostService;
import com.hoge.vo.accommo.AccommoImage;

/**
 * HOGE 웹사이트의 홈 컨트롤러
 * @author 이승준
 *
 */
@Controller
public class HomeController {
	
	static final Logger logger = LogManager.getLogger(AdminController.class);
	
	@Autowired
	private HomeService homeService;
	
	// 이승준: 홈 페이지로 리턴
	@GetMapping("/home")
	public String home(Model model) throws Exception {
		
		List<AccMainDto> newSixAccommoDtos = homeService.getNewSixAccommoMainImages();
		List<HomeAccommoDto> homePromotionDiscountDtos = homeService.getAccPromotionsForHome();
		List<HomeAccommoDto> accommoDtos = homeService.getAllAccommodation();
		
		model.addAttribute("newSixAccommoDtos", newSixAccommoDtos);
		model.addAttribute("homePromotionDiscountDtos", homePromotionDiscountDtos);
		model.addAttribute("accommoDtos", accommoDtos);
		
		logger.info(accommoDtos);
		return "home.tiles";
	}
}