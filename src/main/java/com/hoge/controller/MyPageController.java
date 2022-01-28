package com.hoge.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hoge.dto.ChattingListDto;
import com.hoge.dto.ChattingMessageDto;
import com.hoge.pagination.PaginationQnA;
import com.hoge.service.ChatRoomService;
import com.hoge.service.QnAService;
import com.hoge.vo.other.ChatRoom;
import com.hoge.vo.other.HostQnA;
import com.hoge.vo.other.Message;
import com.hoge.vo.other.UserQnA;

import com.hoge.util.SessionUtils;
import com.hoge.vo.other.User;

/**
 * 마이페이지 컨트롤러
 * @author 이승준, 성하민
 *
 */
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	
	@Autowired
	private QnAService qnAService;
	
	
	// 이승준: 마이페이지 메인 페이지로 리턴
	@GetMapping("/main")
	public String myPageMainInit() { 
		
		User savedUser = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		if (savedUser == null) {
			return "redirect:../login";
		}
		
		return "mypage/main.mytiles";
	}
	
	//성하민
	@GetMapping("/chat")
	public @ResponseBody List<ChattingListDto> chat(@RequestParam(name = "no",required = false) int no) {
		
		System.out.println(no);
		List<ChattingListDto> chatList = chatRoomService.getChattingListDtobyUserNo(no);
		
		return chatList;
	}
	
	//성하민
	@GetMapping("/chat-enter.do")							// 요청핸들러 메소드에 @ResponseBody를 붙인다.
	public @ResponseBody List<ChattingMessageDto> enter(@RequestParam(name = "no",required = false) int no) {
		System.out.println("백으로 들어온 방번호:" +no);
		List<ChattingMessageDto> msgList = chatRoomService.getMessagesByChatRoomNo(no);
		
		System.out.println(msgList);
		return msgList;
	}
		
	//성하민
		@GetMapping("/qna")
		public ModelAndView qna(@RequestParam(name = "page", required = false, defaultValue = "1") String page, ModelAndView mv) {
			mv.setViewName("mypage/qna.mytiles");
			
			User user = (User) SessionUtils.getAttribute("LOGIN_USER");
			
			int totalRecords = qnAService.getUserQnACountByUserNo(user.getNo());
					// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
			
			
			PaginationQnA pagination = new PaginationQnA(page, totalRecords);
					
			int begin = pagination.getBegin();
			int end = pagination.getEnd();

			
			List<UserQnA> qnaList = qnAService.getUserQnAListByUserNo(user.getNo(), begin, end);
			mv.addObject("qnaList", qnaList);
			mv.addObject("pagination", pagination);
			mv.addObject("totalRecords", totalRecords);
		
			return mv;
		}
		

		@PostMapping("/qna-insert.do")
		public String save(UserQnA userQnA) throws IOException {
			System.out.println(userQnA.getNo() +"유저넘버:" + userQnA.getUserNo());
			qnAService.insertUserQnA(userQnA);
			
			return "redirect:qna";
		}
			
		
		@PostMapping("/message.do")
		public void save(@RequestBody Message message) throws IOException {
			
			System.out.println(message);
			
			chatRoomService.insertMessage(message); //새로운 메시지 삽입
			
			ChatRoom chatRoom = chatRoomService.getChatRoomByChatRoomNo(message.getChatRoomNo()); //방번호로 채팅방 가져옴
			
			chatRoom.setLastMessage(message.getContent()); //채팅방의 마지막 메시지를 새로운 메시지로 삽입
			chatRoom.setLastMessageSenderNo(message.getSendingUserNo());
			chatRoom.setLastMessageChecked(message.getChecked());
			
			chatRoomService.updateChatRoom(chatRoom); //채팅방 업데이트
		}
		
		
}
