package com.hoge.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoge.annotation.LoginedUser;
import com.hoge.service.AccommodationService;
import com.hoge.service.ActivityService;
import com.hoge.service.ReserveService;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.accommo.Room;
import com.hoge.vo.activities.Activity;
import com.hoge.vo.other.User;

@Controller
public class ReservationController {
	
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private AccommodationService AccommodationService;
	@Autowired
	private ActivityService activityService;
	
	// 염주환
	@GetMapping("/reserve")
	public String form(@RequestParam("no") int no, @RequestParam (defaultValue="0") int roomNo,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyyMMdd") Date startDate,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyyMMdd") Date endDate,
			/* @LoginedUser User user, */
			Model model) {
		
		if (roomNo == 0) {
			Activity activity = activityService.getActivityDetail(no);
			model.addAttribute("info", activity);
		} else {
			// AccommodationDto 가져오면 가장 좋을 것 같음
			Accommodation accommodation = AccommodationService.getAccommodationDetail(no);
			model.addAttribute("info", accommodation);
			Room room = AccommodationService.getRoomDetail(roomNo);
			model.addAttribute("room", room);
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
		}
		/* model.addAttribute("user", user); */
		return "form/reserveForm";
	}

}
