package com.hoge.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

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
import com.hoge.dto.AccListDto;
import com.hoge.dto.AccMainDto;
import com.hoge.dto.ActListDto;
import com.hoge.dto.ActMainDto;
import com.hoge.dto.ChattingListDto;
import com.hoge.dto.ChattingMessageDto;
import com.hoge.form.HostApplyForm;
import com.hoge.mapper.HostMapper;
import com.hoge.pagination.Pagination;
import com.hoge.pagination.PaginationQnA;
import com.hoge.service.ChatRoomService;
import com.hoge.service.QnAService;
import com.hoge.service.HostService;
import com.hoge.service.HostTransactionService;
import com.hoge.util.SessionUtils;
import com.hoge.vo.accommo.AccommoImage;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.activities.Activity;
import com.hoge.vo.activities.ActivityImage;
import com.hoge.vo.other.Host;
import com.hoge.vo.other.HostQnA;
import com.hoge.vo.other.HostTransaction;
import com.hoge.vo.other.User;

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
	
	// 유상효 hostApplyForm 호출
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
		String hostImageSave = "C:\\final-workspace\\finalproject-chanel5\\src\\main\\webapp\\resources\\images\\hostMainImage";
		MultipartFile hostfile = form.getHostMainImage(); // 메인사진
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
	
	public ModelAndView MainReq() {
		return null;	
	}
	
	//성하민
	@GetMapping("/host/qna")
	public ModelAndView qna(@RequestParam(name = "page", required = false, defaultValue = "1") String page, ModelAndView mv) {
		mv.setViewName("hostpage/qna.hosttiles");
		
		
		int totalRecords = hostQnAService.getHostQnACountByHostNo(100);
				// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		
		
		PaginationQnA pagination = new PaginationQnA(page, totalRecords);
				
		int begin = pagination.getBegin();
		int end = pagination.getEnd();

		
		List<HostQnA> qnaList = hostQnAService.getHostQnAListByHostNo(100, begin, end);
		mv.addObject("qnaList", qnaList);
		mv.addObject("pagination", pagination);
		mv.addObject("totalRecords", totalRecords);
	
		return mv;
	}
	
	//성하민
	@GetMapping("/sales")
	public ModelAndView sales (ModelAndView mv, int hostNo) {
		
		System.out.println(hostNo);
		
		List<HostTransaction> transactionList = hostTransactionService.getHostTransactionByHostNo(hostNo);
		System.out.println(transactionList);
		mv.addObject("transactionList", transactionList);
		mv.setViewName("hostpage/sales.hosttiles");
	
		return mv;
	}
	
	
	@GetMapping("/host/chat")
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("hostpage/chat.hosttiles");
		List<ChattingListDto> chatList = chatRoomService.getChattingListDtobyHostNo(210);
		mv.addObject("chatList", chatList);
		
		return mv;
	}

	//성하민
	@GetMapping("/host/chat-enter.do")							// 요청핸들러 메소드에 @ResponseBody를 붙인다.
	public @ResponseBody List<ChattingMessageDto> enter(@RequestParam(name = "no",required = false) int no) {
		
		List<ChattingMessageDto> msgList = chatRoomService.getMessagesByChatRoomNo(no);
		return msgList;
	}
	
	
	@PostMapping("/host/qna-insert.do")
	public String save(HostQnA hostQnA) throws IOException {
		
		hostQnAService.insertHostQnA(hostQnA);
		
		return "redirect:qna";
	}
	
	
}
