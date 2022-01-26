package com.hoge.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoge.annotation.LoginedUser;
import com.hoge.dto.ReserveAccommoDto;
import com.hoge.service.AccommodationService;
import com.hoge.service.ActivityService;
import com.hoge.service.ReserveService;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.accommo.Room;
import com.hoge.vo.activities.Activity;
import com.hoge.vo.other.User;

@Controller
@RequestMapping("/reserve")
public class ReservationController {
	
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private AccommodationService AccommodationService;
	@Autowired
	private ActivityService activityService;
	
	// 염주환
	@GetMapping("/accommo")
	public String form(@RequestParam("no") int no, @RequestParam("roomNo") int roomNo,
			@RequestParam("checkIn") @DateTimeFormat(pattern = "yyyyMMdd") Date checkIn,
			@RequestParam("checkOut") @DateTimeFormat(pattern = "yyyyMMdd") Date checkOut,
			@LoginedUser User user,	Model model) {
		
		ReserveAccommoDto reserveAccommoDto = reserveService.getReserveAccommoDto(no, roomNo);
		
		model.addAttribute("accommo", reserveAccommoDto);
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		model.addAttribute("user", user);
		return "form/reserveForm";
	}
}
