package com.hoge.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hoge.dto.ChattingListDto;
import com.hoge.dto.ChattingMessageDto;
import com.hoge.pagination.PaginationQnA;
import com.hoge.service.ChatRoomService;
import com.hoge.service.QnAService;
import com.hoge.vo.other.HostQnA;
import com.hoge.vo.other.UserQnA;

/**
 * 마이페이지 컨트롤러
 * @author 이승준
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
		
		return "mypage/main.mytiles";
	}
	
	//성하민
	@GetMapping("/chat")
	public @ResponseBody List<ChattingListDto> chat(@RequestParam(name = "no",required = false) int no) {
		List<ChattingListDto> chatList = chatRoomService.getChattingListDtobyUserNo(1001);
		
		return chatList;
	}
	
	//성하민
	@GetMapping("/chat-enter.do")							// 요청핸들러 메소드에 @ResponseBody를 붙인다.
	public @ResponseBody List<ChattingMessageDto> enter(@RequestParam(name = "no",required = false) int no) {
		
		List<ChattingMessageDto> msgList = chatRoomService.getMessagesByChatRoomNo(no);
		return msgList;
	}
		
	//성하민
		@GetMapping("/qna")
		public ModelAndView qna(@RequestParam(name = "page", required = false, defaultValue = "1") String page, ModelAndView mv) {
			mv.setViewName("mypage/qna.mytiles");
			
			
			int totalRecords = qnAService.getUserQnACountByUserNo(1009);
					// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
			
			
			PaginationQnA pagination = new PaginationQnA(page, totalRecords);
					
			int begin = pagination.getBegin();
			int end = pagination.getEnd();

			
			List<UserQnA> qnaList = qnAService.getUserQnAListByUserNo(totalRecords, begin, end);
			mv.addObject("qnaList", qnaList);
			mv.addObject("pagination", pagination);
			mv.addObject("totalRecords", totalRecords);
		
			return mv;
		}
		
}
