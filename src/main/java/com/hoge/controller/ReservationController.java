package com.hoge.controller;

import java.io.IOException;
import java.util.Date;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoge.config.auth.LoginedUser;
import com.hoge.dto.ReserveAccommoDto;
import com.hoge.form.ReservationInsertForm;
import com.hoge.service.AccommodationService;
import com.hoge.service.ActivityService;
import com.hoge.vo.accommo.RoomBooking;
import com.hoge.vo.other.User;

import ch.qos.logback.core.joran.util.beans.BeanUtil;

@Controller
@RequestMapping("/reserve")
public class ReservationController {
	
	@Autowired
	private AccommodationService accommodationService;
	@Autowired
	private ActivityService activityService;
	
	// 염주환
	@GetMapping("/accommo")
	public String form(@RequestParam("no") int no, @RequestParam("roomNo") int roomNo,
			@RequestParam("checkIn") @DateTimeFormat(pattern = "yyyyMMdd") Date checkIn,
			@RequestParam("checkOut") @DateTimeFormat(pattern = "yyyyMMdd") Date checkOut,
			@LoginedUser User user,	Model model) {
		
		ReserveAccommoDto reserveAccommoDto = accommodationService.getReserveAccommoDto(no, roomNo);
		
		System.out.println(user.getName());
		
		model.addAttribute("accommo", reserveAccommoDto);
		model.addAttribute("user", user);
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		model.addAttribute("user", user);
		return "form/reserveForm";
	}
	
	// 염주환
	@PostMapping("/insert")
	public String save(ReservationInsertForm form, @LoginedUser User user) throws IOException {
		if (form.getRoomUserName() == "" && form.getRoomUserTel() == "") {
			form.setRoomUserName(user.getName());
			form.setRoomUserTel(user.getTel());
		}
		System.out.println(form);
		
		RoomBooking roomBooking = new RoomBooking();
		BeanUtils.copyProperties(form, roomBooking);
		accommodationService.addNewBooking(roomBooking, user.getNo());
		
		return "accommo/completePayment";
	}
}
