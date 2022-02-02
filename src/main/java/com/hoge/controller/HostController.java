package com.hoge.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hoge.config.auth.LoginedUser;
import com.hoge.dto.AccMainDto;
import com.hoge.dto.ActListDto;
import com.hoge.dto.ActMainDto;
import com.hoge.dto.AdminActivityReviewDto;
import com.hoge.dto.ChattingListDto;
import com.hoge.dto.ChattingMessageDto;
import com.hoge.dto.RoomListDto;
import com.hoge.form.Criteria;
import com.hoge.form.HostApplyForm;
import com.hoge.form.InsertRoomForm;
import com.hoge.mapper.HostMapper;
import com.hoge.pagination.Pagination;
import com.hoge.pagination.PaginationPerPage5;
import com.hoge.service.AccommodationService;
import com.hoge.service.ChatRoomService;
import com.hoge.service.QnAService;
import com.hoge.service.HostService;
import com.hoge.service.HostTransactionService;
import com.hoge.util.SessionUtils;
import com.hoge.vo.accommo.AccommoImage;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.accommo.Room;
import com.hoge.vo.accommo.RoomImage;
import com.hoge.vo.activities.Activity;
import com.hoge.vo.activities.ActivityImage;
import com.hoge.vo.other.ChatRoom;
import com.hoge.vo.other.Host;
import com.hoge.vo.other.HostQnA;
import com.hoge.vo.other.HostTransaction;
import com.hoge.vo.other.Message;
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
	
	static final Logger logger = LogManager.getLogger(HostController.class);
	
	//성하민
		@PostMapping(value = "/transactionList.do", produces = "application/json")
		public @ResponseBody HashMap<String, Object> getwithdrawalList(@RequestParam(name = "page", required = false, defaultValue="1") String page, String hostNo) throws Exception {
			
			
			logger.info("페이지 :" + page);
			HashMap<String, Object> result = new HashMap<>();
			// 검색조건에 해당하는 총 데이터 갯수 조회
			int currentHostNo = Integer.parseInt(hostNo);
			int totalRecords = hostTransactionService.getHostTransactionCountByHostNo(currentHostNo);
			logger.info("토탈레코드 :" + totalRecords);
			// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
			Pagination pagination = new Pagination(page, totalRecords);
			
			int begin = pagination.getBegin();
			int end = pagination.getEnd();

			// 요청한 페이지에 대한 조회범위를 criteria에 저장
			
		
			List<HostTransaction> list = hostTransactionService.getHostTransactionByHostNo(currentHostNo, begin, end);
			
			logger.info("디티오 :" + list);
			logger.info("페이지네이션 :" + pagination);
			
			// 페이징
			result.put("pagination", pagination);
			
			// 게시글 화면 출력
			result.put("list", list);
			
			return result;
		}
	
		@PostMapping(value = "/withdrawalList.do", produces = "application/json")
		public @ResponseBody HashMap<String, Object> TransactionList(@RequestParam(name = "page", required = false, defaultValue="1") String page, String hostNo) throws Exception {
			
			
			logger.info("페이지 :" + page);
			HashMap<String, Object> result = new HashMap<>();
			// 검색조건에 해당하는 총 데이터 갯수 조회
			int currentHostNo = Integer.parseInt(hostNo);
			int totalRecords = hostService.getWithdrawalCountByHostNo(currentHostNo);
			logger.info("토탈레코드 :" + totalRecords);
			// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
			PaginationPerPage5 pagination = new PaginationPerPage5(page, totalRecords);
			
			int begin = pagination.getBegin();
			int end = pagination.getEnd();
			
			// 요청한 페이지에 대한 조회범위를 criteria에 저장
			List<Withdrawal> list = hostService.getHostWithdrawalListByHostNo(currentHostNo, begin, end);
			
			logger.info("디티오 :" + list);
			logger.info("페이지네이션 :" + pagination);
			
			// 페이징
			result.put("pagination", pagination);
			
			// 게시글 화면 출력
			result.put("list", list);
			
			return result;
		}
		
	
	
	

	@PostMapping("/message.do")
	public void save(@RequestBody Message message) throws IOException {
		
		System.out.println("프론트에서 넘어온 메시지:" +message);
		
		chatRoomService.insertMessage(message); //새로운 메시지 삽입
		
		ChatRoom chatRoom = chatRoomService.getChatRoomByChatRoomNo(message.getChatRoomNo()); //방번호로 채팅방 가져옴
		
		chatRoom.setLastMessage(message.getContent()); //채팅방의 마지막 메시지를 새로운 메시지로 삽입
		chatRoom.setLastMessageSenderNo(message.getSendingUserNo());
		chatRoom.setLastMessageChecked(message.getChecked());
		
		chatRoomService.updateChatRoom(chatRoom); //채팅방 업데이트
	}
	
	
	
	// 유상효 호스트등록폼 호출
	@GetMapping("/applyForm")
	public String ApplyForm() {
		//SessionUtils.addAttribute("세션아이디", "세션값");
		return "hostpage/applyForm.tiles";
	}
	
	// 유상효 hostApply 입력
	@PostMapping(value = "/insertHostApply")
	public String insertHostApply(HostApplyForm form) throws IOException {
		
		// 숙소 사진 저장
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
		
		// 체험 사진 저장
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
		
		// 호스트 정보 담기
		Host host = new Host();
		host.setHostingType(form.getHostingType());
		host.setName(form.getHostName());
		host.setTel(form.getTel());
		host.setAccountHolderName(form.getAccountHolderName());
		host.setBankName(form.getBankName());
		host.setAccountNumber(form.getAccountNumber());
		// 메인사진 저장
		String hostImageSave = "C:\\final-workspace\\finalproject-chanel5\\src\\main\\webapp\\resources\\images\\hostMainImage";
		MultipartFile hostfile = form.getHostMainImage();
		if (!hostfile.isEmpty()) {
			String fileName = hostfile.getOriginalFilename();
			host.setMainImage(fileName);
			InputStream in = hostfile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(hostImageSave, fileName));
			FileCopyUtils.copy(in, out);
		}
		
		// 숙소 정보 담기
		Accommodation acc = new Accommodation();
		acc.setType(form.getAccType());
		acc.setName(form.getAccName());
		acc.setWebAddress(form.getAccWebAddress());
		acc.setIntroTitle(form.getAccIntroTitle());
		acc.setIntroContent(form.getAccIntroContent());
		acc.setAddress(form.getAccAddress());
		acc.setCheckInTime(form.getAccCheckInTime());
		acc.setCheckOutime(form.getAccCheckOutime());
		
		// 체험 정보 담기
		Activity act = new Activity();
		act.setName(form.getActName());
		act.setIntroTitle(form.getActIntroTitle());
		act.setIntroContent(form.getActIntroContent());
		act.setMaximumNumber(form.getActMaximumNumber());
		act.setPricePerPerson(form.getActPricePerPerson());
		act.setAddress(form.getActAddress());
		
		hostService.hostApply(host, acc, act, accImages, actImages);
		return "redirect:../mypage/hostingList";
	}
	
	// 유상효 호스트 메인페이지
	@GetMapping("/main")
	public String hostMain(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, Model model) {
		if (hostingType == 1) {
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			model.addAttribute("accMainDto", accMainDto);
		return "hostpage/accMain.hosttiles";
		} else {
			ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
			model.addAttribute("actMaintDto", actMainDto);
		return "hostpage/actMain.hosttiles";
		}
	}
	
	// 유상효 호스트 수정페이지
	@GetMapping("/modify")
	public String hostModify(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, Model model) {
		if (hostingType == 1) {
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			model.addAttribute("accMainDto", accMainDto);
		return "hostpage/accModifyForm.hosttiles";
		} else {
			ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
			model.addAttribute("actMaintDto", actMainDto);
		return "hostpage/actModifyForm.hosttiles";
		}
	}
	
	// 유상효 객실 관리페이지
	@GetMapping("/mainRoom")
	public String mainRoom(@RequestParam(name = "hostNo") int hostNo, @RequestParam(name = "hostingType") int hostingType, Model model) {
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			model.addAttribute("accMainDto", accMainDto);
			
			List<RoomListDto> roomDto = accommodationService.getRoomListByAccNo(accMainDto.getAccNo());
			model.addAttribute("roomListDto", roomDto);
			
		return "accommo/mainRoom.hosttiles";
	}
	
	// 유상효 객실등록폼 호출
	@GetMapping("insertRoom")
	public String roomInsertForm(@RequestParam(name = "hostNo") int hostNo, Model model) {
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			model.addAttribute("accMainDto", accMainDto);
		return "accommo/insertRoomForm.hosttiles";
	}
	
	// 유상효 객실등록
	@PostMapping(value = "/insertRooms")
	public String insertRooms(InsertRoomForm form) throws IOException {
		// 객실 사진 저장
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
		// 객실 정보 담기
		Room room = new Room();
		BeanUtils.copyProperties(form, room);
		accommodationService.insertRoom(room, roomImages);
		// 객실 등록후 객실메인페이지로 리다이렉트
		return "redirect:mainRoom?hostNo="+form.getHostNo()+"&hostingType="+form.getHostingType();
	}
	
	
	
	
	
	
	
	public ModelAndView MainReq() {
		return null;	
	}
	
	//성하민
	@GetMapping("/qna")
	public ModelAndView qna(@RequestParam(name = "page", required = false, defaultValue = "1") String page, 
			ModelAndView mv, int hostNo, int hostingType) {
		if (hostingType == 1) {
			AccMainDto accMainDto = hostService.getAccMainByHostNo(hostNo);
			mv.addObject("accMainDto", accMainDto);
		} else {
			ActMainDto actMainDto = hostService.getActMainByHostNo(hostNo);
			mv.addObject("actMaintDto", actMainDto);
		}
		
		
		mv.setViewName("hostpage/qna.hosttiles");
		
		
		int totalRecords = hostQnAService.getHostQnACountByHostNo(hostNo);
				// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		
		
		PaginationPerPage5 pagination = new PaginationPerPage5(page, totalRecords);
				
		int begin = pagination.getBegin();
		int end = pagination.getEnd();

		
		List<HostQnA> qnaList = hostQnAService.getHostQnAListByHostNo(hostNo, begin, end);
		mv.addObject("qnaList", qnaList);
		mv.addObject("pagination", pagination);
		mv.addObject("totalRecords", totalRecords);
	
		return mv;
	}
	
	//성하민
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
		mv.addObject("savedHost", savedHost);
		
		mv.setViewName("hostpage/sales.hosttiles");
	
		return mv;
	}
	
	
	@GetMapping("/chat")
	public ModelAndView chat(ModelAndView mv, int hostNo, int hostingType) {
		mv.setViewName("hostpage/chat.hosttiles");
		List<ChattingListDto> chatList = chatRoomService.getChattingListDtobyHostNo(hostNo);
		
		Host savedHost = hostService.getHostByNo(hostNo);
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

	//성하민
	@GetMapping("/chat-enter.do")							// 요청핸들러 메소드에 @ResponseBody를 붙인다.
	public @ResponseBody List<ChattingMessageDto> enter(@RequestParam(name = "no",required = false) int no) {
		System.out.println("호스트 컨트롤러 서버로 들어온 채팅방번호:"+no);
		List<ChattingMessageDto> msgList = chatRoomService.getMessagesByChatRoomNo(no);
		System.out.println("호스트 컨트롤러 서버로 들어온 번호로 찾은 메시지:"+msgList);
		return msgList;
	}
	
	
	@PostMapping("/qna-insert.do")
	public String save(HostQnA hostQnA) throws IOException {
		hostQnAService.insertHostQnA(hostQnA);
		
		return "redirect:qna";
	}
	
	@PostMapping("/withdrawal")
	public String saveWithdrawal(Withdrawal withdrawal, int hostingType) throws IOException {
		System.out.println(withdrawal.getHostNo());
		System.out.println("넘어온 값:" +withdrawal);
		
		hostService.insertWithdrawal(withdrawal);
		return "redirect:sales?hostNo="+withdrawal.getHostNo()+"&hostingType="+hostingType;
	}
	
	
}
