package com.hoge.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hoge.dto.AccMainDto;
import com.hoge.dto.AdminActivityReviewDto;
import com.hoge.dto.AdminUserQnADto;
import com.hoge.dto.HomeAccommoDto;
import com.hoge.dto.PromotionDto;
import com.hoge.form.Criteria;
import com.hoge.form.CriteriaAdminQnA;
import com.hoge.pagination.Pagination;
import com.hoge.service.HomeService;

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
	public String home(@RequestParam(name = "page", required = false, defaultValue = "1") String page, 
														Criteria criteria, Model model) throws Exception {
		
		List<AccMainDto> newSixAccommoDtos = homeService.getNewSixAccommoMainImages();
		List<HomeAccommoDto> homePromotionDiscountDtos = homeService.getAccPromotionsForHome();
		
		model.addAttribute("newSixAccommoDtos", newSixAccommoDtos);
		model.addAttribute("homePromotionDiscountDtos", homePromotionDiscountDtos);
		
		int totalRecords = homeService.getAllAccommodationTotalRows();
		Pagination pagination = new Pagination(page, totalRecords, 3);
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		List<HomeAccommoDto> accommoDtos = homeService.getAllAccommodation(criteria);
		model.addAttribute("accommoDtos", accommoDtos);
		model.addAttribute("pagination", pagination);
		
		logger.info("어코모:" + homePromotionDiscountDtos);
		return "home.tiles";
	}
	
	/* @GetMapping("/home")
	public String getAllAccommodation(@RequestParam(name = "page", required = false, defaultValue = "1") String page, 
			Criteria criteria, Model model) {
		
		// 검색조건에 해당하는 총 데이터 갯수 조회
		
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		
		
		// 요청한 페이지에 대한 조회범위를 criteria에 저장
		//criteria.setBeginIndex(pagination.getBegin());
		//criteria.setEndIndex(pagination.getEnd());
		//logger.info("검색조건 및 값 :" + criteria);

		
		
		
		
		
		return "home.tiles";
	} */
	
	//?page=1&answered=N&opt=%ED%9A%8C%EC%9B%90%EB%B2%88%ED%98%B8&value=1052
	/*
	@GetMapping("/user-qna")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page, 
			CriteriaAdminQnA criteriaAdminQnA, Model model) {
	
		if (criteriaAdminQnA.getAnswered() == null) {
			criteriaAdminQnA.setAnswered("N");
		}
		
		// 검색조건에 해당하는 총 데이터 갯수 조회
		int totalRecords = qnAService.getUserQnAsTotalRows(criteriaAdminQnA);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		Pagination pagination = new Pagination(page, totalRecords);
		
		// 요청한 페이지에 대한 조회범위를 criteria에 저장
		criteriaAdminQnA.setBeginIndex(pagination.getBegin());
		criteriaAdminQnA.setEndIndex(pagination.getEnd());
		logger.info("검색조건 및 값 :" + criteriaAdminQnA);

		
		
		List<AdminUserQnADto> userQnaList = qnAService.getUserQnAsByCriteria(criteriaAdminQnA);
		
		model.addAttribute("userQnaList", userQnaList);
		model.addAttribute("pagination", pagination);
		
		return "adminpage/user-qna.admintiles";
	}
	*/
}