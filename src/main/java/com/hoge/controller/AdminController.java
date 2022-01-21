package com.hoge.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoge.form.CriteriaAdminUser;
import com.hoge.pagination.Pagination;
import com.hoge.service.UserService;
import com.hoge.vo.other.User;



/**
 * 
 * @author 성하민
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	static final Logger logger = LogManager.getLogger(AdminController.class);
	
	@Autowired
	private UserService userService;
	
	//성하민
	@GetMapping("/user-list")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page, 
			CriteriaAdminUser CAU, Model model) {
	
		if (CAU.getDeleted() == null) {
			CAU.setDeleted("N");
		}
		
		// 검색조건에 해당하는 총 데이터 갯수 조회
		int totalRecords = userService.getUsersTotalRows(CAU);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		Pagination pagination = new Pagination(page, totalRecords);
		
		// 요청한 페이지에 대한 조회범위를 criteria에 저장
		CAU.setBeginIndex(pagination.getBegin());
		CAU.setEndIndex(pagination.getEnd());
		logger.info("검색조건 및 값 :" + CAU);

		// 검색조건(opt, value)과 조회범위(beginIndex, endIndex)가 포함된 Criteria를 서비스에 전달해서 데이터 조회
		List<User> users = userService.searchUsers(CAU);
		
		model.addAttribute("users", users);
		model.addAttribute("pagination", pagination);
		
		return "adminpage/user-list.admintiles";
	}

	
}
