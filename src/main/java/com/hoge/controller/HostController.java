package com.hoge.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

import com.hoge.dto.ChattingMessageDto;
import com.hoge.service.ChatRoomService;
import com.hoge.service.HostService;
import com.hoge.util.SessionUtils;
import com.hoge.vo.accommo.Accommodation;
import com.hoge.vo.activities.Activity;
import com.hoge.vo.other.ChatRoom;
import com.hoge.vo.other.Host;

@Controller
public class HostController {
	
	@Autowired
	private HostService hostService;
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	// 유상효
	@GetMapping("/host/applyForm")
	public String ApplyForm() {
		//SessionUtils.addAttribute("세션아이디", "세션값");
		return "hostpage/applyForm.tiles";
	}
	
	// 유상효
	@GetMapping("/host/main")
	public String Main() {
		return "hostpage/main.hosttiles";
	}
	
	// 유상효
	@RequestMapping(value = "/host/req", method = RequestMethod.POST)
	public String ApplyReq(Host host, Accommodation acc, Activity act, MultipartHttpServletRequest req) throws IllegalStateException, IOException {
		hostService.apply(host, acc, act, req);
		return "넘어갈곳";	
	}
	
	
	public ModelAndView MainReq() {
		return null;	
	}
	
	//성하민
	@GetMapping("/host/chat")
	public ModelAndView chat(Host host, ModelAndView mv) {
		mv.setViewName("hostpage/chat");
		List<ChatRoom> chatList = chatRoomService.getChatRoomsbyHostNo(100);
		mv.addObject("chatList", chatList);
	
		return mv;
	}

	//성하민
	@GetMapping("/host/chat-enter.do")							// 요청핸들러 메소드에 @ResponseBody를 붙인다.
	public @ResponseBody List<ChattingMessageDto> enter(@RequestParam(name = "no",required = false) int no) {
		
		List<ChattingMessageDto> msgList = chatRoomService.getMessagesByChatRoomNo(no);
		return msgList;
	}
	
	
}
