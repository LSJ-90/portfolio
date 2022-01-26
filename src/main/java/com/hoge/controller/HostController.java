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

import com.hoge.dto.ChattingListDto;
import com.hoge.dto.ChattingMessageDto;
import com.hoge.pagination.Pagination;
import com.hoge.pagination.PaginationQnA;
import com.hoge.service.ChatRoomService;
import com.hoge.service.HostQnAService;
import com.hoge.service.HostService;
import com.hoge.util.SessionUtils;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.activities.Activity;
import com.hoge.vo.other.Host;
import com.hoge.vo.other.HostQnA;
import com.hoge.vo.other.User;

@Controller
public class HostController {
	
	@Autowired
	private HostService hostService;
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	@Autowired
	private HostQnAService hostQnAService;
	
	// 유상효
	@GetMapping("/host/applyForm")
	public String ApplyForm() {
		//SessionUtils.addAttribute("세션아이디", "세션값");
		return "hostpage/applyForm.tiles";
	}
	
	// 유상효
	@GetMapping("/mypage/hostingList")
	public String Main() {
		return "mypage/hostingList.hosttiles";
	}
	
	// 유상효
	@RequestMapping(value = "/host/req", method = RequestMethod.POST)
	public String ApplyReq(Host host, Accommodation acc, Activity act, MultipartHttpServletRequest req) throws IllegalStateException, IOException {
		hostService.apply(host);
		return "넘어갈곳";	
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
	@GetMapping("/host/sales")
	public ModelAndView sales (ModelAndView mv) {
		mv.setViewName("hostpage/sales.hosttiles");
		
		return mv;
	}
	
	
	@GetMapping("/host/chat")
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("hostpage/chat.hosttiles");
		List<ChattingListDto> chatList = chatRoomService.getChattingListDtobyHostNo(100);
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
