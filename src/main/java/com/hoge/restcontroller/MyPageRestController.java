package com.hoge.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hoge.config.auth.LoginedUser;
import com.hoge.dto.MyTourListDto;
import com.hoge.service.MyPageService;
import com.hoge.vo.other.User;

@RestController
@RequestMapping("/rest/mypage")
public class MyPageRestController {
	
	@Autowired
	MyPageService myPageService;
	
	@GetMapping("/mytourlist")
	public List<MyTourListDto> list(@LoginedUser User user) {
		List<MyTourListDto> dtos = myPageService.getMyTourListAccommos(user.getNo());
		List<MyTourListDto> dtos2 = myPageService.getMyTourListActivities(user.getNo());
		dtos.addAll(dtos2);
		
		return dtos;
	}

}
