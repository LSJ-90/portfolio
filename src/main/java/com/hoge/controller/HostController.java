package com.hoge.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hoge.dto.AccMainDto;
import com.hoge.dto.ActMainDto;
import com.hoge.dto.ActivityBookingHostDto;
import com.hoge.dto.AdminAccommoReviewDto;
import com.hoge.dto.AdminActivityReviewDto;
import com.hoge.dto.ChattingListDto;
import com.hoge.dto.ChattingMessageDto;
import com.hoge.dto.HostCalendar;
import com.hoge.dto.LabelDataDto;
import com.hoge.dto.RoomBookingDto;
import com.hoge.dto.RoomDto;
import com.hoge.dto.RoomListDto;
import com.hoge.form.AccHostModifyForm;
import com.hoge.form.AccInfoForm;
import com.hoge.form.ActHostModifyForm;
import com.hoge.form.Criteria;
import com.hoge.form.HostApplyForm;
import com.hoge.form.InsertRoomForm;
import com.hoge.form.ModifyPromotionDiscountForm;
import com.hoge.form.ModifyPromotionOfferForm;
import com.hoge.form.PromotionDiscountForm;
import com.hoge.form.PromotionOfferForm;
import com.hoge.form.RoomModifyForm;
import com.hoge.pagination.Pagination;
import com.hoge.pagination.PaginationPerPage5;
import com.hoge.service.AccommodationService;
import com.hoge.service.ActivityService;
import com.hoge.service.ChatRoomService;
import com.hoge.service.QnAService;
import com.hoge.service.ReviewService;
import com.hoge.service.StatisticsService;
import com.hoge.service.HostService;
import com.hoge.service.HostTransactionService;
import com.hoge.util.SessionUtils;
import com.hoge.vo.accommo.AccommoImage;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.accommo.Room;
import com.hoge.vo.accommo.RoomBooking;
import com.hoge.vo.accommo.RoomImage;
import com.hoge.vo.activities.Activity;
import com.hoge.vo.activities.ActivityImage;
import com.hoge.vo.activities.ActivityTimeTable;
import com.hoge.vo.other.ChatRoom;
import com.hoge.vo.other.Host;
import com.hoge.vo.other.HostQnA;
import com.hoge.vo.other.HostTransaction;
import com.hoge.vo.other.Message;
import com.hoge.vo.other.PromotionDiscount;
import com.hoge.vo.other.PromotionOffer;
import com.hoge.vo.other.ReviewAccommo;
import com.hoge.vo.other.User;
import com.hoge.vo.other.Withdrawal;

@Controller
@RequestMapping("/host")
public class HostController {
	
	@Autowired
	private HostService hostService;
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	@Autowired
	private QnAService hostQnAService;
	
	@Autowired
	private HostTransactionService hostTransactionService;
	
	@Autowired
	private AccommodationService accommodationService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private StatisticsService statisticsService;
	
	static final Logger logger = LogManager.getLogger(HostController.class);
	
	//?????????
		@GetMapping("/dailyHostSalesGraph")							// ??????????????? ???????????? @ResponseBody??? ?????????.
		public @ResponseBody List<LabelDataDto> getUserNumberGraph(@RequestParam String hostNo) {
			int no = Integer.parseInt(hostNo);
			List<LabelDataDto> result = statisticsService.getSalesPerDayByHostNo(no);
			logger.info("?????????:" + result);
			return result;
		}
		//?????????
		@GetMapping("/hostCalendar.do")							// ??????????????? ???????????? @ResponseBody??? ?????????.
		public @ResponseBody List<HostCalendar> gethostCalendar(@RequestParam int hostNo) {
			List<RoomBooking> bookings = hostService.getRoomBookingByHostNo(hostNo);
			List<HostCalendar> bookingList = new ArrayList<>();
			Random randomGenerator = new Random();
			if (bookings != null) {
				for(RoomBooking booking : bookings) {
					HostCalendar hostCalendar = new HostCalendar();
					int red = randomGenerator.nextInt(256);
					int green = randomGenerator.nextInt(256);
					int blue = randomGenerator.nextInt(256);
					// rgba(215, 215, 215, 0.3);
					String color = "rgba("+red+", "+green+","+blue+", 0.2)";
					String borderColor = "rgba("+red+", "+green+","+blue+", 1)";
					
					
					hostCalendar.setBackgroundcolor(color);
					hostCalendar.setTextColor("black");
					hostCalendar.setBordercolor(borderColor);
					hostCalendar.setTitle(booking.getRoomName()+"-"+booking.getRoomUserName()+" ("+booking.getRoomUserTel()+") ????????????: "+booking.getExtraPeople()+"???");
					hostCalendar.setStart(booking.getCheckInDate());
					hostCalendar.setEnd(booking.getCheckOutDate());
					
					bookingList.add(hostCalendar);
				}
			}
			
			
			logger.info("?????????:" + bookingList);
			return bookingList;
		}
	
	
	//?????????
		@PostMapping(value = "/transactionList.do", produces = "application/json")
		public @ResponseBody HashMap<String, Object> getwithdrawalList(@RequestParam(name = "page", required = false, defaultValue="1") String page, 
				String hostNo) throws Exception {
			
			
			logger.info("????????? :" + page);
			HashMap<String, Object> result = new HashMap<>();
			// ??????????????? ???????????? ??? ????????? ?????? ??????
			int currentHostNo = Integer.parseInt(hostNo);
			int totalRecords = hostTransactionService.getHostTransactionCountByHostNo(currentHostNo);
			logger.info("??????????????? :" + totalRecords);
			// ?????? ?????????????????? ??? ????????? ????????? ???????????? ????????? ????????? ????????? ????????? ???????????? Pagination?????? ??????
			Pagination pagination = new Pagination(page, totalRecords);
			
			int begin = pagination.getBegin();
			int end = pagination.getEnd();

			// ????????? ???????????? ?????? ??????????????? criteria??? ??????
			
		
			List<HostTransaction> list = hostTransactionService.getHostTransactionByHostNo(currentHostNo, begin, end);
			
			logger.info("????????? :" + list);
			logger.info("?????????????????? :" + pagination);
			
			// ?????????
			result.put("pagination", pagination);
			
			// ????????? ?????? ??????
			result.put("list", list);
			
			return result;
		}
		//?????????
		@PostMapping(value = "/getMainAccReviewList.do", produces = "application/json")
		public @ResponseBody HashMap<String, Object> getMainAccReviewList(@RequestParam(name = "page", required = false, defaultValue="1")
		String page, Criteria criteria) throws Exception {
			
			
			logger.info("????????? :" + page);
			HashMap<String, Object> result = new HashMap<>();
			
			int totalRecords = reviewService.getRecentReviewCountByAccommoNo(criteria.getNo());
			logger.info("??????????????? :" + totalRecords);
			// ?????? ?????????????????? ??? ????????? ????????? ???????????? ????????? ????????? ????????? ????????? ???????????? Pagination?????? ??????
			PaginationPerPage5 pagination = new PaginationPerPage5(page, totalRecords);
			
			criteria.setBeginIndex(pagination.getBegin());
			criteria.setEndIndex(pagination.getEnd());
			
			List<AdminAccommoReviewDto> list = reviewService.getRecentReviewListByAccommoNo(criteria);
			
			logger.info("????????? :" + list);
			logger.info("?????????????????? :" + pagination);
			
			// ?????????
			result.put("pagination", pagination);
			
			// ????????? ?????? ??????
			result.put("list", list);
			
			return result;
		}
		//?????????
		@PostMapping(value = "/getMainActReviewList.do", produces = "application/json")
		public @ResponseBody HashMap<String, Object> getMainActReviewList(@RequestParam(name = "page", required = false, defaultValue="1")
		String page, Criteria criteria) throws Exception {
			
			
			logger.info("????????? :" + page);
			HashMap<String, Object> result = new HashMap<>();
			
			int totalRecords = reviewService.getRecentReviewCountByActivityNo(criteria.getNo());
			logger.info("??????????????? :" + totalRecords);
			// ?????? ?????????????????? ??? ????????? ????????? ???????????? ????????? ????????? ????????? ????????? ???????????? Pagination?????? ??????
			PaginationPerPage5 pagination = new PaginationPerPage5(page, totalRecords);
			
			criteria.setBeginIndex(pagination.getBegin());
			criteria.setEndIndex(pagination.getEnd());
			
			List<AdminActivityReviewDto> list = reviewService.getRecentReviewListByActivityNo(criteria);
			
			logger.info("????????? :" + list);
			logger.info("?????????????????? :" + pagination);
			
			// ?????????
			result.put("pagination", pagination);
			
			// ????????? ?????? ??????
			result.put("list", list);
			
			return result;
		}
	
		//?????????
		@PostMapping(value = "/getMainBookingList.do", produces = "application/json")
		public @ResponseBody HashMap<String, Object> getMainBookingList(@RequestParam(name = "page", required = false, defaultValue="1") String page, Criteria criteria) throws Exception {
			
			
			logger.info("????????? :" + page);
			HashMap<String, Object> result = new HashMap<>();
			
			int totalRecords = hostService.getRecentBookingCountByAccommoNo(criteria.getNo());
			logger.info("??????????????? :" + totalRecords);
			// ?????? ?????????????????? ??? ????????? ????????? ???????????? ????????? ????????? ????????? ????????? ???????????? Pagination?????? ??????
			PaginationPerPage5 pagination = new PaginationPerPage5(page, totalRecords);
			
			criteria.setBeginIndex(pagination.getBegin());
			criteria.setEndIndex(pagination.getEnd());
			
			
			
			List<RoomBooking> list = hostService.getRecentBookingListByAccommoNo(criteria);
			
			logger.info("????????? :" + list);
			logger.info("?????????????????? :" + pagination);
			
			// ?????????
			result.put("pagination", pagination);
			
			// ????????? ?????? ??????
			result.put("list", list);
			
			return result;
		}
		//?????????
		@PostMapping(value = "/getMainActBookingList.do", produces = "application/json")
		public @ResponseBody HashMap<String, Object> getMainActBookingList(@RequestParam(name = "page", required = false, defaultValue="1") String page, Criteria criteria) throws Exception {
			
			
			logger.info("????????? :" + page);
			HashMap<String, Object> result = new HashMap<>();
			
			int totalRecords = activityService.getRecentBookingCountByActivityNo(criteria.getNo());
			logger.info("??????????????? :" + totalRecords);
			// ?????? ?????????????????? ??? ????????? ????????? ???????????? ????????? ????????? ????????? ????????? ???????????? Pagination?????? ??????
			PaginationPerPage5 pagination = new PaginationPerPage5(page, totalRecords);
			
			criteria.setBeginIndex(pagination.getBegin());
			criteria.setEndIndex(pagination.getEnd());
			
			
			
			List<ActivityBookingHostDto> list = activityService.getRecentBookingListByActivityNo(criteria);
			
			logger.info("????????? :" + list);
			logger.info("?????????????????? :" + pagination);
			
			// ?????????
			result.put("pagination", pagination);
			
			// ????????? ?????? ??????
			result.put("list", list);
			
			return result;
		}
		
		@PostMapping(value = "/withdrawalList.do", produces = "application/json")
		public @ResponseBody HashMap<String, Object> TransactionList(@RequestParam(name = "page", required = false, defaultValue="1") String page, String hostNo) throws Exception {
			
			
			logger.info("????????? :" + page);
			HashMap<String, Object> result = new HashMap<>();
			// ??????????????? ???????????? ??? ????????? ?????? ??????
			int currentHostNo = Integer.parseInt(hostNo);
			int totalRecords = hostService.getWithdrawalCountByHostNo(currentHostNo);
			logger.info("??????????????? :" + totalRecords);
			// ?????? ?????????????????? ??? ????????? ????????? ???????????? ????????? ????????? ????????? ????????? ???????????? Pagination?????? ??????
			PaginationPerPage5 pagination = new PaginationPerPage5(page, totalRecords);
			
			int begin = pagination.getBegin();
			int end = pagination.getEnd();
			
			// ????????? ???????????? ?????? ??????????????? criteria??? ??????
			List<Withdrawal> list = hostService.getHostWithdrawalListByHostNo(currentHostNo, begin, end);
			
			logger.info("????????? :" + list);
			logger.info("?????????????????? :" + pagination);
			
			// ?????????
			result.put("pagination", pagination);
			
			// ????????? ?????? ??????
			result.put("list", list);
			
			return result;
		}
		
		@PostMapping(value = "/get-room-info.do", produces = "application/json")
		public @ResponseBody HashMap<String, Object> bookingList(@RequestBody Criteria criteria) throws Exception {
			
			
			List<RoomDto> availableRoomList = hostService.getAvailableRoomInfo(criteria);
			List<RoomBookingDto> bookedRoomList = hostService.getBookedRoomInfo(criteria);
			HashMap<String, Object> result = new HashMap<>();
			// ?????????
			result.put("availableRoomList", availableRoomList);
			
			// ????????? ?????? ??????
			result.put("bookedRoomList", bookedRoomList);
			
			return result;
		}
		
	
	
	

	@PostMapping("/message.do")
	public void save(@RequestBody Message message) throws IOException {
		
		System.out.println("??????????????? ????????? ?????????:" +message);
		
		chatRoomService.insertMessage(message); //????????? ????????? ??????
		
		ChatRoom chatRoom = chatRoomService.getChatRoomByChatRoomNo(message.getChatRoomNo()); //???????????? ????????? ?????????
		
		chatRoom.setLastMessage(message.getContent()); //???????????? ????????? ???????????? ????????? ???????????? ??????
		chatRoom.setLastMessageSenderNo(message.getSendingUserNo());
		chatRoom.setLastMessageChecked(message.getChecked());
		chatRoom.setUserUnreadCount(chatRoom.getUserUnreadCount()+1);
		
		chatRoomService.updateChatRoom(chatRoom); //????????? ????????????
	}
	
	@PostMapping("/checkMessage")
	public void checkMessage(@RequestBody ChatRoom chatRoom) throws IOException {
		User savedUser = (User) SessionUtils.getAttribute("LOGIN_USER");
		int chatRoomNo = chatRoom.getNo();
		System.out.println("????????????:"+chatRoomNo);
		
		chatRoomService.changeHostPageUnreadToZero(chatRoomNo, savedUser.getNo());
	}
	
	
	// ????????? ?????????????????? ??????
	@GetMapping("/applyForm")
	public String ApplyForm() {
		//SessionUtils.addAttribute("???????????????", "?????????");
		return "form/applyForm.tiles";
	}
	
	// ????????? hostApply ??????
	@PostMapping(value = "/insertHostApply")
	public String insertHostApply(HostApplyForm form) throws IOException {
		
		// ?????? ?????? ??????
		String saveDirectory1 = "C:\\final-workspace\\finalproject-chanel5\\src\\main\\webapp\\resources\\images\\accommodation";
		List<AccommoImage> accImages = new ArrayList<AccommoImage>();
		List<MultipartFile> accFiles = form.getAccImages();
		for (MultipartFile multipartFile1 : accFiles) {
			if (!multipartFile1.isEmpty()) {
				String fileName1 = multipartFile1.getOriginalFilename();
				AccommoImage accImage = new AccommoImage();
				accImage.setImage(fileName1);
				accImages.add(accImage);
				InputStream in1 = multipartFile1.getInputStream();
				FileOutputStream out1 = new FileOutputStream(new File(saveDirectory1, fileName1));
				FileCopyUtils.copy(in1, out1);
			}
		}
		
		// ?????? ?????? ??????
		String saveDirectory2 = "C:\\final-workspace\\finalproject-chanel5\\src\\main\\webapp\\resources\\images\\activities";
		List<ActivityImage> actImages = new ArrayList<ActivityImage>();
		List<MultipartFile> actFiles = form.getActImages();
		for (MultipartFile multipartFile2 : actFiles) {
			if (!multipartFile2.isEmpty()) {
				String fileName2 = multipartFile2.getOriginalFilename();
				ActivityImage actImage = new ActivityImage();
				actImage.setImage(fileName2);
				actImages.add(actImage);
				InputStream in2 = multipartFile2.getInputStream();
				FileOutputStream out2 = new FileOutputStream(new File(saveDirectory2, fileName2));
				FileCopyUtils.copy(in2, out2);
			}
		}
		
		// ????????? ?????? ??????
		Host host = new Host();
		host.setHostingType(form.getHostingType());
		host.setName(form.getHostName());
		host.setTel(form.getTel());
		host.setAccountHolderName(form.getAccountHolderName());
		host.setBankName(form.getBankName());
		host.setAccountNumber(form.getAccountNumber());
		// ???????????? ??????
		String hostImageSave = "C:\\final-workspace\\finalproject-chanel5\\src\\main\\webapp\\resources\\images\\hostMainImage";
		MultipartFile hostfile = form.getHostMainImage();
		if (!hostfile.isEmpty()) {
			String fileName = hostfile.getOriginalFilename();
			host.setMainImage(fileName);
			InputStream in = hostfile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(hostImageSave, fileName));
			FileCopyUtils.copy(in, out);
		}
		
		// ?????? ?????? ??????
		Accommodation acc = new Accommodation();
		acc.setType(form.getAccType());
		acc.setName(form.getAccName());
		acc.setWebAddress(form.getAccWebAddress());
		acc.setIntroTitle(form.getAccIntroTitle());
		acc.setIntroContent(form.getAccIntroContent());
		String accMainAddress = form.getAccMainAddress();
		String accDetailAddress = form.getAccDetailAddress();
		acc.setAddress(accMainAddress + " " + accDetailAddress);
		acc.setCheckInTime(form.getAccCheckInTime());
		acc.setCheckOutime(form.getAccCheckOutime());
		acc.setXce(form.getXce());
		acc.setYce(form.getYce());
		
		StringTokenizer accDepth = new StringTokenizer(form.getAccMainAddress());
		acc.setRegionDepth1(accDepth.nextToken());
		acc.setRegionDepth2(accDepth.nextToken());
		acc.setRegionDepth3(accDepth.nextToken());
		
		
		// ?????? ?????? ??????
		Activity act = new Activity();
		act.setName(form.getActName());
		act.setIntroTitle(form.getActIntroTitle());
		act.setIntroContent(form.getActIntroContent());
		act.setMaximumNumber(form.getActMaximumNumber());
		act.setPricePerPerson(form.getActPricePerPerson());
		String actMainAddress = form.getActMainAddress();
		String actDetailAddress = form.getActDetailAddress();
		act.setAddress(actMainAddress + " " + actDetailAddress);
		act.setXce(form.getXce());
		act.setYce(form.getYce());
		
		StringTokenizer actDepth = new StringTokenizer(form.getActMainAddress());
		act.setRegionDepth1(actDepth.nextToken());
		act.setRegionDepth2(actDepth.nextToken());
		act.setRegionDepth3(actDepth.nextToken());
		
		logger.info("????????????" + acc);
		logger.info("????????????" + act);
		
		int userNo = form.getUserNo();
		hostService.hostApply(host, acc, act, accImages, actImages);
		hostService.userIsHostUpdate(userNo);
		return "redirect:../mypage/hostingList";
	}
	
	//????????? ????????? ???????????????
	@GetMapping("/main")
	public String hostMain(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, Model model) {
		if (hostingType == 1) {
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			model.addAttribute("accMainDto", accMainDto);
			List<RoomBooking> todayCheckOutList = hostService.getTodayCheckOutByAccommoNo(accMainDto.getAccNo());
			List<RoomBooking> todayCheckInList = hostService.getTodayCheckInByAccommoNo(accMainDto.getAccNo());
			List<RoomListDto> roomList = accommodationService.getRoomListByAccNo(accMainDto.getAccNo());
			model.addAttribute("roomList", roomList);
			System.out.println("todayCheckOutList:" +todayCheckOutList);
			System.out.println("todayCheckInList:" +todayCheckInList);
			
			//????????? ?????????????????? ???????????? ?????? ???????????? ????????????
			int todayBookingCount = hostService.getTodayBookingCountByAccommoNo(accMainDto.getAccNo());
			int todayReviewCount = reviewService.getTodayReviewCountByAccommoNo(accMainDto.getAccNo());
			Host savedHost = hostService.getHostByNo(hostNo);
			model.addAttribute("todayReviewCount", todayReviewCount);
			model.addAttribute("todayBookingCount", todayBookingCount);
			model.addAttribute("todayCheckOutList", todayCheckOutList);
			model.addAttribute("todayCheckInList", todayCheckInList);
			model.addAttribute("roomList", roomList);
			model.addAttribute("savedHost", savedHost);
					
		
			
		return "hostpage/accMain.hosttiles";
		} else {
			ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
			List<ActivityTimeTable> actTimeList = activityService.getActivityTimeListByActivityNo(actMainDto.getActNo());
			Host savedHost = hostService.getHostByNo(hostNo);
			int todayReviewCount = reviewService.getTodayReviewCountByActivityNo(actMainDto.getActNo());
			int todayBookingCount = activityService.getTodayBookingCountByActivityNo(actMainDto.getActNo());
			model.addAttribute("todayBookingCount", todayBookingCount);
			model.addAttribute("todayReviewCount", todayReviewCount);
			model.addAttribute("actMainDto", actMainDto);
			model.addAttribute("actTimeList", actTimeList);
			model.addAttribute("savedHost", savedHost);
		return "hostpage/actMain.hosttiles";
		}
	}
	
	// ????????? ????????? ???????????? ?????????
	@GetMapping("/booking-calendar")
	public String hostBookingCalendar(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, Model model) {
		if (hostingType == 1) {
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			model.addAttribute("accMainDto", accMainDto);
			Host savedHost = hostService.getHostByNo(hostNo);
			model.addAttribute("savedHost", savedHost);
			
			return "hostpage/accBookingCalendar.hosttiles";
		} else {
			ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
			model.addAttribute("actMainDto", actMainDto);
			Host savedHost = hostService.getHostByNo(hostNo);
			model.addAttribute("savedHost", savedHost);
			return "hostpage/actBookingCalendar.hosttiles";
		}
	}
	
	//?????????
		@GetMapping("/review-answer.do")							// ??????????????? ???????????? @ResponseBody??? ?????????.
		public @ResponseBody AdminAccommoReviewDto reviewdetail(@RequestParam(name = "no",required = true) int no) {
			AdminAccommoReviewDto reviewDto = reviewService.getAccommoReviewsDtoByReviewNo(no);
			return reviewDto;
		}
		
		
		
		@PostMapping("/review-answer-insert")
		public String reviewAnswer(int hostNo, int hostingType, String answerContent, int reviewNo) throws IOException {
			ReviewAccommo review = reviewService.getAccommoReviewByReviewNo(reviewNo);
			review.setAnswerContent(answerContent);
			reviewService.answerUpdateAccommReview(review);
			
			return "redirect:review?page=1&hostNo="+hostNo+"&hostingType="+hostingType;
		}
		
	
	// ????????? ????????? ???????????? ?????????
	@GetMapping("/review")
	public String review(String page, int hostNo, int hostingType, Model model) {
		if (hostingType == 1) {

			Criteria criteria = new Criteria();
			criteria.setOpt("???????????????");
			String hostNoString = Integer.toString(hostNo);
			criteria.setValue(hostNoString);
			int totalrecords = reviewService.getAccommoReviewsTotalRows(criteria);
			
			Pagination pagination = new Pagination(page, totalrecords);
			
			criteria.setBeginIndex(pagination.getBegin());
			criteria.setEndIndex(pagination.getEnd());
			
			List<AdminAccommoReviewDto> reviewList = reviewService.getAccommoReviewsByCriteria(criteria);
			
			model.addAttribute("pagination", pagination);
			model.addAttribute("reviewList", reviewList);
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			model.addAttribute("accMainDto", accMainDto);
			Host savedHost = hostService.getHostByNo(hostNo);
			model.addAttribute("savedHost", savedHost);
			
			return "hostpage/review.hosttiles";
		} else {
			ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
			model.addAttribute("actMainDto", actMainDto);
			Host savedHost = hostService.getHostByNo(hostNo);
			model.addAttribute("savedHost", savedHost);
			return "hostpage/review.hosttiles";
		}
	}
	
	// ????????? ????????? ????????? ??????
	@GetMapping("/modify")
	public String hostModify(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, Model model) {
		if (hostingType == 1) {
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			model.addAttribute("accMainDto", accMainDto);
			List<AccommoImage> accImages = hostService.getAccImagesByHostNo(hostNo);
			model.addAttribute("accImages", accImages);
		return "form/accModifyForm.hosttiles";
		} else {
			ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
			model.addAttribute("actMainDto", actMainDto);
			List<ActivityImage> actImages = hostService.getActImagesByHostNo(hostNo);
			model.addAttribute("actImages", actImages);
		return "form/actModifyForm.hosttiles";
		}
	}
	
	// ????????? ??????????????? ??????
	@PostMapping("/accHostModify")
	public String accHostModify(AccHostModifyForm form) throws IOException {
		
		Host host = new Host();
		host.setNo(form.getHostNo());
		host.setName(form.getHostName());
		host.setTel(form.getTel());
		host.setAccountHolderName(form.getAccountHolderName());
		host.setBankName(form.getBankName());
		host.setAccountNumber(form.getAccountNumber());
		String hostImageSave = "C:\\final-workspace\\finalproject-chanel5\\src\\main\\webapp\\resources\\images\\hostMainImage";
		MultipartFile hostfile = form.getHostMainImage();
		if (!hostfile.isEmpty()) {
			String fileName = hostfile.getOriginalFilename();
			host.setMainImage(fileName);
			InputStream in = hostfile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(hostImageSave, fileName));
			FileCopyUtils.copy(in, out);
		}
		
		Accommodation acc = new Accommodation();
		acc.setHostNo(form.getHostNo());
		acc.setType(form.getAccType());
		acc.setName(form.getAccName());
		acc.setWebAddress(form.getAccWebAddress());
		acc.setAddress(form.getAccAddress());
		acc.setCheckInTime(form.getAccCheckInTime());
		acc.setCheckOutime(form.getAccCheckOutime());
		acc.setIntroTitle(form.getAccIntroTitle());
		acc.setIntroContent(form.getAccIntroContent());
		
		hostService.accHostModify(host, acc);
		logger.info("????????? :" + host);
		logger.info("?????? :" + acc);
		
		
		return "redirect:/host/main?hostNo="+form.getHostNo()+"&hostingType="+form.getHostingType();
	}
	
	// ????????? ??????????????? ??????
	@PostMapping("/actHostModify")
	public String actHostModify(ActHostModifyForm form) throws IOException {
		
		Host host = new Host();
		host.setNo(form.getHostNo());
		host.setName(form.getHostName());
		host.setTel(form.getTel());
		host.setAccountHolderName(form.getAccountHolderName());
		host.setBankName(form.getBankName());
		host.setAccountNumber(form.getAccountNumber());
		String hostImageSave = "C:\\final-workspace\\finalproject-chanel5\\src\\main\\webapp\\resources\\images\\hostMainImage";
		MultipartFile hostfile = form.getHostMainImage();
		if (!hostfile.isEmpty()) {
			String fileName = hostfile.getOriginalFilename();
			host.setMainImage(fileName);
			InputStream in = hostfile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(hostImageSave, fileName));
			FileCopyUtils.copy(in, out);
		}
		
		Activity act = new Activity();
		act.setHostNo(form.getHostNo());
		act.setName(form.getActName());
		act.setAddress(form.getActAddress());
		act.setMaximumNumber(form.getActMaximumNumber());
		act.setPricePerPerson(form.getActPricePerPerson());
		act.setIntroTitle(form.getActIntroTitle());
		act.setIntroContent(form.getActIntroContent());
		
		hostService.actHostModify(host, act);
		
		return "redirect:/host/main?hostNo="+form.getHostNo()+"&hostingType="+form.getHostingType();
	}
	
	
	
	// ????????? ?????? ???????????????
	@GetMapping("/mainRoom")
	public String mainRoom(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, Model model) {
		AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
		model.addAttribute("accMainDto", accMainDto);
		
		List<RoomListDto> roomDto = accommodationService.getRoomListByAccNo(accMainDto.getAccNo());
		model.addAttribute("roomListDto", roomDto);
			
	return "accommo/mainRoom.hosttiles";
	}
	
	// ????????? ??????????????? ??????
	@GetMapping("insertRoom")
	public String roomInsertForm(@RequestParam(name = "hostNo") int hostNo, Model model) {
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			model.addAttribute("accMainDto", accMainDto);
		return "form/insertRoomForm.hosttiles";
	}
	
	// ????????? ????????????
	@PostMapping(value = "/insertRooms")
	public String insertRooms(InsertRoomForm form) throws IOException {
		// ?????? ?????? ??????
		String saveDirectory = "C:\\final-workspace\\finalproject-chanel5\\src\\main\\webapp\\resources\\images\\room";
		List<RoomImage> roomImages = new ArrayList<RoomImage>();
		List<MultipartFile> roomFiles = form.getRoomImages();
		for (MultipartFile multipartFile : roomFiles) {
			if (!multipartFile.isEmpty()) {
				String fileName = multipartFile.getOriginalFilename();
				RoomImage roomImage = new RoomImage();
				roomImage.setImage(fileName);
				roomImages.add(roomImage);
				InputStream in = multipartFile.getInputStream();
				FileOutputStream out = new FileOutputStream(new File(saveDirectory, fileName));
				FileCopyUtils.copy(in, out);
			}
		}
		// ?????? ?????? ??????
		Room room = new Room();
		BeanUtils.copyProperties(form, room);
		accommodationService.insertRoom(room, roomImages);
		// ?????? ????????? ???????????????????????? ???????????????
		return "redirect:mainRoom?hostNo="+form.getHostNo()+"&hostingType="+form.getHostingType();
	}
	
	// ????????? ??????????????? ??????
	@GetMapping("roomModify")
	public String roomModifyForm(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, @RequestParam(name = "roomNo") int roomNo, Model model) {
		AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
		model.addAttribute("accMainDto", accMainDto);
		
		RoomDto roomDto = accommodationService.getRoomByRoomNo(roomNo);
		roomDto.setHostNo(hostNo);
		roomDto.setHostingType(hostingType);
		model.addAttribute("roomDto", roomDto);
		
		List<RoomImage> roomImages = accommodationService.getRoomImages(roomNo);
		model.addAttribute("roomImages", roomImages);
		
	return "form/roomModifyForm.hosttiles";
	}
	
	// ????????? ????????????
	@PostMapping("/roomModify")
	public String roomModify(RoomModifyForm form) throws IOException {
		
		logger.info("???????????? :" + form);
		Room room = new Room();
		room.setNo(form.getNo());
		room.setAccommoNo(form.getAccommoNo());
		room.setName(form.getName());
		room.setWeekdaysPrice(form.getWeekdaysPrice());
		room.setWeekendPrice(form.getWeekendPrice());
		room.setPeakSeasonPrice(form.getPeakSeasonPrice());
		room.setStandardNumber(form.getStandardNumber());
		room.setMaximumNumber(form.getMaximumNumber());
		room.setPricePerPerson(form.getPricePerPerson());
		room.setAmenity(form.getAmenity());
		room.setFeature(form.getFeature());
		
		logger.info("???????????? :" + room);
		accommodationService.roomModify(room);
		
		return "redirect:mainRoom?hostNo="+form.getHostNo()+"&hostingType="+form.getHostingType();
	}
	
	// ????????? ???????????? ???????????????
	@GetMapping("/mainPromotion")
	public String mainPromotion(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, @RequestParam(name = "status", defaultValue = "A") String status, Model model) {
		AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
		model.addAttribute("accMainDto", accMainDto);
		ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
		model.addAttribute("actMainDto", actMainDto);
		
		if (status.equals("A")) {
			List<PromotionDiscount> promotionDiscountList = hostService.getPromotionDiscountByHostNo(hostNo);
			model.addAttribute("promotionDiscountList", promotionDiscountList);
			List<PromotionOffer> promotionOfferList = hostService.getPromotionOfferByHostNo(hostNo);
			model.addAttribute("promotionOfferList", promotionOfferList);
		} else if (status.equals("Y")) {
			List<PromotionDiscount> promotionDiscountList = hostService.getPromotionDiscountByHostNoAndStatusY(hostNo);
			model.addAttribute("promotionDiscountList", promotionDiscountList);
			List<PromotionOffer> promotionOfferList = hostService.getPromotionOfferByHostNoAndStatusY(hostNo);
			model.addAttribute("promotionOfferList", promotionOfferList);
		} else if (status.equals("W")) {
			List<PromotionDiscount> promotionDiscountList = hostService.getPromotionDiscountByHostNoAndStatusW(hostNo);
			model.addAttribute("promotionDiscountList", promotionDiscountList);
			List<PromotionOffer> promotionOfferList = hostService.getPromotionOfferByHostNoAndStatusW(hostNo);
			model.addAttribute("promotionOfferList", promotionOfferList);
		} else if (status.equals("N")) {
			List<PromotionDiscount> promotionDiscountList = hostService.getPromotionDiscountByHostNoAndStatusN(hostNo);
			model.addAttribute("promotionDiscountList", promotionDiscountList);
			List<PromotionOffer> promotionOfferList = hostService.getPromotionOfferByHostNoAndStatusN(hostNo);
			model.addAttribute("promotionOfferList", promotionOfferList);
		} else if (status.equals("D")) {
			List<PromotionDiscount> promotionDiscountList = hostService.getPromotionDiscountByHostNoAndStatusD(hostNo);
			model.addAttribute("promotionDiscountList", promotionDiscountList);
			List<PromotionOffer> promotionOfferList = hostService.getPromotionOfferByHostNoAndStatusD(hostNo);
			model.addAttribute("promotionOfferList", promotionOfferList);
		}
		
		logger.info("model ????????? :" + model);
			
	return "hostpage/promotion.hosttiles";
	}
	
	// ????????? ?????? ??????????????? ??????
	@GetMapping("/addPromotionDiscount")
	public String addPromotionDiscountForm(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, Model model) {
		AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
		model.addAttribute("accMainDto", accMainDto);
		ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
		model.addAttribute("actMainDto", actMainDto);
		
		return "form/addPromotionDiscountForm.hosttiles";
	}
	
	// ????????? ?????? ???????????? ??????
	@PostMapping("/addPromotionDiscount")
	public String addPromotionDiscount(PromotionDiscountForm form) {
		
		logger.info("form????????? :" + form);
		
		java.util.Date utilStarting = form.getStartingDate();
		java.sql.Date sqlStarting = new java.sql.Date(utilStarting.getTime());
		
		java.util.Date utilEnding = form.getEndingDate();
		java.sql.Date sqlEnding = new java.sql.Date(utilEnding.getTime());
		
		PromotionDiscount promotionDiscount = new PromotionDiscount();
		promotionDiscount.setHostNo(form.getHostNo());
		promotionDiscount.setWeekdaysDiscountRate(form.getWeekdaysDiscountRate());
		promotionDiscount.setWeekendDiscountRate(form.getWeekendDiscountRate());
		promotionDiscount.setPeakSeasonDiscountRate(form.getPeakSeasonDiscountRate());
		promotionDiscount.setStartingDate(sqlStarting);
		promotionDiscount.setEndingDate(sqlEnding); // ???????????? ????????? ??????
		promotionDiscount.setIntroContent(form.getIntroContent());
		
		logger.info("????????????????????? :" + promotionDiscount);
		
		hostService.addPromotionDiscount(promotionDiscount);
		return "redirect:mainPromotion?hostNo="+form.getHostNo()+"&hostingType="+form.getHostingType();
	}
	
	// ????????? ?????? ??????????????? ??????
	@GetMapping("/addPromotionOffer")
	public String addPromotionOfferForm(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, Model model) {
		AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
		model.addAttribute("accMainDto", accMainDto);
		ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
		model.addAttribute("actMainDto", actMainDto);
		
		return "form/addPromotionOfferForm.hosttiles";
	}
	
	// ????????? ?????? ???????????? ??????
	@PostMapping("/addPromotionOffer")
	public String addPromotionOffer(PromotionOfferForm form) {
		
		logger.info("form????????? :" + form);
		
		java.util.Date utilStarting = form.getStartingDate();
		java.sql.Date sqlStarting = new java.sql.Date(utilStarting.getTime());
		
		java.util.Date utilEnding = form.getEndingDate();
		java.sql.Date sqlEnding = new java.sql.Date(utilEnding.getTime());
		
		PromotionOffer promotionOffer = new PromotionOffer();
		promotionOffer.setHostNo(form.getHostNo());
		promotionOffer.setContent(form.getContent());
		promotionOffer.setIntroContent(form.getIntroContent());
		promotionOffer.setStartingDate(sqlStarting);
		promotionOffer.setEndingDate(sqlEnding);
		
		hostService.addPromotionOffer(promotionOffer);
		return "redirect:mainPromotion?hostNo="+form.getHostNo()+"&hostingType="+form.getHostingType();
	}
	
	// ????????? ?????? ???????????? ????????? ??????
	@GetMapping("modifyPromotionDiscount")
	public String modifyPromotionDiscount(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, @RequestParam(name = "no") int no, Model model) {
		AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
		model.addAttribute("accMainDto", accMainDto);
		ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
		model.addAttribute("actMainDto", actMainDto);
		PromotionDiscount promotionDiscount = hostService.getPromotionDiscountByPromotionNo(no);
		model.addAttribute("promotionDiscount", promotionDiscount);
		
		return "form/modifyPromotionDiscountForm.hosttiles";
	}
	
	// ????????? ?????? ???????????? ??????
	@PostMapping("/modifyPromotionDiscount")
	public String modifyPromotionDiscount(ModifyPromotionDiscountForm form) {
		
		logger.info("form????????? :" + form);
		
		java.util.Date utilStarting = form.getStartingDate();
		java.sql.Date sqlStarting = new java.sql.Date(utilStarting.getTime());
		
		java.util.Date utilEnding = form.getEndingDate();
		java.sql.Date sqlEnding = new java.sql.Date(utilEnding.getTime());
		
		PromotionDiscount promotionDiscount = new PromotionDiscount();
		promotionDiscount.setNo(form.getNo());
		promotionDiscount.setHostNo(form.getHostNo());
		promotionDiscount.setWeekdaysDiscountRate(form.getWeekdaysDiscountRate());
		promotionDiscount.setWeekendDiscountRate(form.getWeekendDiscountRate());
		promotionDiscount.setPeakSeasonDiscountRate(form.getPeakSeasonDiscountRate());
		promotionDiscount.setStartingDate(sqlStarting);
		promotionDiscount.setEndingDate(sqlEnding);
		promotionDiscount.setIntroContent(form.getIntroContent());
		
		logger.info("????????????????????? :" + promotionDiscount);
		
		hostService.modifyPromotionDiscount(promotionDiscount);
		
		return "redirect:mainPromotion?hostNo="+form.getHostNo()+"&hostingType="+form.getHostingType();
	}
		
	// ????????? ?????? ???????????? ????????? ??????
	@GetMapping("modifyPromotionOffer")
	public String modifyPromotionOffer(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, @RequestParam(name = "no") int no, Model model) {
		AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
		model.addAttribute("accMainDto", accMainDto);
		ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
		model.addAttribute("actMainDto", actMainDto);
		PromotionOffer promotionOffer = hostService.getPromotionOfferByPromotionNo(no);
		model.addAttribute("promotionOffer", promotionOffer);
		
		return "form/modifyPromotionOfferForm.hosttiles";
	}
	
	// ????????? ?????? ???????????? ??????
	@PostMapping("/modifyPromotionOffer")
	public String modifyPromotionOffer(ModifyPromotionOfferForm form) {
		
		logger.info("form????????? :" + form);
		
		java.util.Date utilStarting = form.getStartingDate();
		java.sql.Date sqlStarting = new java.sql.Date(utilStarting.getTime());
		
		java.util.Date utilEnding = form.getEndingDate();
		java.sql.Date sqlEnding = new java.sql.Date(utilEnding.getTime());
		
		PromotionOffer promotionOffer = new PromotionOffer();
		promotionOffer.setNo(form.getNo());
		promotionOffer.setHostNo(form.getHostNo());
		promotionOffer.setContent(form.getContent());
		promotionOffer.setIntroContent(form.getIntroContent());
		promotionOffer.setStartingDate(sqlStarting);
		promotionOffer.setEndingDate(sqlEnding);
		
		logger.info("????????????????????? :" + promotionOffer);
		
		hostService.modifyPromotionOffer(promotionOffer);
		
		return "redirect:mainPromotion?hostNo="+form.getHostNo()+"&hostingType="+form.getHostingType();
	}
	
	// ????????? ?????? ???????????? ??? ?????? ?????? ?????? ????????? ??????
	@GetMapping("/addAccInfo")
	public String addAccInfoForm(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, Model model) {
		AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
		model.addAttribute("accMainDto", accMainDto);
		ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
		model.addAttribute("actMainDto", actMainDto);
		
		return "form/addAccInfoForm.hosttiles";
	}
	
	// ????????? ???????????? ??? ?????? ?????? ??????
	@PostMapping("/addAccInfo")
	public String addAccInfo(AccInfoForm form) {
		hostService.addAccInfo(form);
		return "redirect:/host/main?hostNo="+form.getHostNo()+"&hostingType="+form.getHostingType();
	}
	
	// ????????? ?????? ???????????? ??? ?????? ?????? ?????? ????????? ??????
	@GetMapping("/addActInfo")
	public String addActInfoForm(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, Model model) {
		AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
		model.addAttribute("accMainDto", accMainDto);
		ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
		model.addAttribute("actMainDto", actMainDto);
		
		return "form/addActInfoForm.hosttiles";
	}
	
	// ????????? ???????????? ??? ?????? ?????? ??????
	@PostMapping("/addActInfo")
	public String addActInfo(AccInfoForm form) {
		hostService.addActInfo(form);
		return "redirect:/host/main?hostNo="+form.getHostNo()+"&hostingType="+form.getHostingType();
	}
	
	
		
	
	public ModelAndView MainReq() {
		return null;	
	}
	
	//?????????
	@GetMapping("/qna")
	public ModelAndView qna(String page, ModelAndView mv, int hostNo, int hostingType) {
		if (hostingType == 1) {
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			mv.addObject("accMainDto", accMainDto);
		} else {
			ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
			mv.addObject("actMaintDto", actMainDto);
		}
		
		Host savedHost = hostService.getHostByNo(hostNo);
		mv.setViewName("hostpage/qna.hosttiles");
		
		
		int totalRecords = hostQnAService.getHostQnACountByHostNo(hostNo);
				// ?????? ?????????????????? ??? ????????? ????????? ???????????? ????????? ????????? ????????? ????????? ???????????? Pagination?????? ??????
		
		
		PaginationPerPage5 pagination = new PaginationPerPage5(page, totalRecords);
				
		int begin = pagination.getBegin();
		int end = pagination.getEnd();

		
		List<HostQnA> qnaList = hostQnAService.getHostQnAListByHostNo(hostNo, begin, end);
		mv.addObject("qnaList", qnaList);
		mv.addObject("pagination", pagination);
		mv.addObject("totalRecords", totalRecords);
		mv.addObject("savedHost", savedHost);
	
		return mv;
	}
	
	//?????????
	@GetMapping("/sales")
	public ModelAndView sales (ModelAndView mv, int hostNo, int hostingType) {
		if (hostingType == 1) {
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			mv.addObject("accMainDto", accMainDto);
		} else {
			ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
			mv.addObject("actMaintDto", actMainDto);
		}
		
		
		System.out.println(hostNo);
		Host savedHost = hostService.getHostByNo(hostNo);
		long appliedAmount = hostService.getWithdrawalwaitingAmountByHostNo(hostNo);
		long possibleAmount = savedHost.getAccumulatedMoney()-appliedAmount;
		mv.addObject("savedHost", savedHost);
		mv.addObject("appliedAmount", appliedAmount);
		mv.addObject("possibleAmount", possibleAmount);
		
		mv.setViewName("hostpage/sales.hosttiles");
	
		return mv;
	}
	
	
	@GetMapping("/chat")
	public ModelAndView chat(ModelAndView mv, int hostNo, int hostingType) {
		mv.setViewName("hostpage/chat.hosttiles");
		List<ChattingListDto> chatList = chatRoomService.getChattingListDtobyHostNo(hostNo);
		
		Host savedHost = hostService.getHostByNo(hostNo);
		
		String chatListString = Integer.toString(chatList.get(0).getChatRoomNo());
		
		for (int i = 1; i<chatList.size(); i++) {
			chatListString += ","+ Integer.toString(chatList.get(i).getChatRoomNo());
			
		}
		System.out.println(chatListString);
		
		mv.addObject("chatListString", chatListString);
		mv.addObject("chatList", chatList);
		mv.addObject("savedHost", savedHost);
		
		if (hostingType == 1) {
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			mv.addObject("accMainDto", accMainDto);
		} else {
			ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
			mv.addObject("actMaintDto", actMainDto);
		}
		
		
		return mv;
	}

	//?????????
	@GetMapping("/chat-enter.do")							// ??????????????? ???????????? @ResponseBody??? ?????????.
	public @ResponseBody List<ChattingMessageDto> enter(@RequestParam(name = "no",required = false) int no) {
		System.out.println("????????? ???????????? ????????? ????????? ???????????????:"+no);
		List<ChattingMessageDto> msgList = chatRoomService.getMessagesByChatRoomNo(no);
		System.out.println("????????? ???????????? ????????? ????????? ????????? ?????? ?????????:"+msgList);
		return msgList;
	}
	
	
	@PostMapping("/qna-insert.do")
	public String save(HostQnA hostQnA, int hostNo, int hostingType) throws IOException {
		hostQnA.setHostNo(hostNo);
		hostQnAService.insertHostQnA(hostQnA);
		
		return "redirect:qna?page=1&hostNo="+hostNo+"&hostingType="+hostingType;
	}
	
	@PostMapping("/withdrawal")
	public String saveWithdrawal(Withdrawal withdrawal, int hostingType) throws IOException {
		System.out.println(withdrawal.getHostNo());
		System.out.println("????????? ???:" +withdrawal);
		
		hostService.insertWithdrawal(withdrawal);
		return "redirect:sales?hostNo="+withdrawal.getHostNo()+"&hostingType="+hostingType;
	}
	
	
}
