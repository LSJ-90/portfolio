package com.hoge.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.hoge.dto.AccMainDto;
import com.hoge.dto.RoomDto;
import com.hoge.dto.RoomListDto;
import com.hoge.form.Criteria;
import com.hoge.service.AccommodationService;
import com.hoge.service.HostService;
import com.hoge.vo.accommo.AccommoImage;
import com.hoge.vo.accommo.RoomImage;
import com.hoge.vo.other.PromotionDiscount;
import com.hoge.vo.other.PromotionOffer;


@Controller
@RequestMapping("/accommo")
public class AccommodationController {

	static final Logger logger = LogManager.getLogger(AccommodationController.class);

	@Autowired
	private AccommodationService accommodationService;
	@Autowired
	private HostService hostService;

	// 염주환
	@GetMapping("/list")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page,
			Criteria criteria, Model model) throws Exception {

		model.addAttribute("criteria", criteria);

		return "accommo/list.tiles";
	}

	// 유상효 숙소 디테일 페이지
	@GetMapping("/detail")
	public String accDetail(@RequestParam(name = "accNo") int accNo, @RequestParam(name = "check_in", required = false) String checkin,
			@RequestParam(name = "check_out", required = false) String checkout, Criteria criteria, Model model) throws Exception {
		AccMainDto accMainDto = accommodationService.getAccDetailByAccNo(accNo);
		int hostNo = accMainDto.getHostNo();
		model.addAttribute("accMainDto", accMainDto);
		List<AccommoImage> accImages = hostService.getAccImagesByHostNo(hostNo);
		model.addAttribute("accImages", accImages);
		criteria.setCheckInDate(checkin);
		criteria.setCheckOutDate(checkout);
		criteria.setAccNo(accNo);
		List<RoomListDto> roomDto = accommodationService.getRoomListByDate(criteria);
		model.addAttribute("roomSearchList", roomDto);
		List<RoomListDto> roomListDto = accommodationService.getRoomListByAccNo(accNo);
		model.addAttribute("roomListDto", roomListDto);
		
		List<RoomListDto> roomInfoType1 = accommodationService.getRoomInfoType1(accNo);
		model.addAttribute("roomInfoType1", roomInfoType1);
		List<RoomListDto> roomInfoType2 = accommodationService.getRoomInfoType2(accNo);
		model.addAttribute("roomInfoType2", roomInfoType2);
		
		List<PromotionDiscount> promotionDiscountList = hostService.getPromotionDiscountByHostNoAndStatusY(hostNo);
		model.addAttribute("promotionDiscountList", promotionDiscountList);
		List<PromotionOffer> promotionOfferList = hostService.getPromotionOfferByHostNoAndStatusY(hostNo);
		model.addAttribute("promotionOfferList", promotionOfferList);
		
		logger.info("결과값:" + roomInfoType1);

		return "accommo/accDetail.tiles";
	}
	
	// 유상효 객실 디테일 페이지
	@GetMapping("/roomDetail")
	public String roomDetail(@RequestParam(name = "accNo") int accNo, @RequestParam(name = "check_in", required = false) String checkin,
			@RequestParam(name = "check_out", required = false) String checkout, @RequestParam(name = "roomNo", required = false) int roomNo, Criteria criteria, Model model) throws Exception {
		AccMainDto accMainDto = accommodationService.getAccDetailByAccNo(accNo);
		int hostNo = accMainDto.getHostNo();
		model.addAttribute("accMainDto", accMainDto);
		RoomDto roomDto = accommodationService.getRoomByRoomNo(roomNo);
		roomDto.setCheckInTime(accMainDto.getAccCheckInTime());
		roomDto.setCheckOutTime(accMainDto.getAccCheckOutime());
		model.addAttribute("roomDto", roomDto);
		List<RoomImage> roomImages = accommodationService.getRoomImages(roomNo);
		model.addAttribute("roomImages", roomImages);
		criteria.setCheckInDate(checkin);
		criteria.setCheckOutDate(checkout);
		criteria.setAccNo(accNo);
		List<RoomListDto> otherRoomDto = accommodationService.getRoomListByDate(criteria);
		model.addAttribute("otherRoomDto", otherRoomDto);
		List<RoomListDto> roomListDto = accommodationService.getRoomListByAccNo(accNo);
		model.addAttribute("roomListDto", roomListDto);
		
		List<RoomListDto> roomInfoType1 = accommodationService.getRoomInfoType1(accNo);
		model.addAttribute("roomInfoType1", roomInfoType1);
		List<RoomListDto> roomInfoType2 = accommodationService.getRoomInfoType2(accNo);
		model.addAttribute("roomInfoType2", roomInfoType2);
		
		List<PromotionDiscount> promotionDiscountList = hostService.getPromotionDiscountByHostNoAndStatusY(hostNo);
		model.addAttribute("promotionDiscountList", promotionDiscountList);
		List<PromotionOffer> promotionOfferList = hostService.getPromotionOfferByHostNoAndStatusY(hostNo);
		model.addAttribute("promotionOfferList", promotionOfferList);

		logger.info("결과값:" );

		return "accommo/roomDetail.tiles";
	}



	// 유상효 날짜 검색
	@PostMapping("/search")
	public String dateSearch(@RequestParam(name = "accNo") int accNo, @RequestParam(name = "check_in", required = false) String checkin,
			@RequestParam(name = "check_out", required = false) String checkout, Model model) throws Exception {

		AccMainDto accMainDto = accommodationService.getAccDetailByAccNo(accNo);
		model.addAttribute("accMainDto", accMainDto);

		// 체크아웃 - 체크인 날짜 계산
		String date1 = checkin;
		String date2 = checkout;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date FirstDate = format.parse(date1);
		Date SecondDate = format.parse(date2);
		long calDate = FirstDate.getTime() - SecondDate.getTime(); 
		long calDateDays = calDate / ( 24*60*60*1000); 
		calDateDays = Math.abs(calDateDays);
		System.out.println("두 날짜의 날짜 차이: " + calDateDays);

		return "redirect:detail?accNo="+accNo+"&check_in="+checkin+"&check_out="+checkout+"&days="+calDateDays;
	}












}