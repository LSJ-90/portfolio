package com.hoge.exceptionhandler;

import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
// import org.springframework.web.bind.annotation.ResponseBody;

import com.hoge.exception.AdminException;
// import com.hoge.dto.ResponseDto;
import com.hoge.exception.CustomException;
import com.hoge.exception.FindException;
import com.hoge.exception.FindPwdException;
import com.hoge.exception.UpdateException;
import com.hoge.exception.LoginException;
import com.hoge.exception.RegisterException;

/**
 * try/catch문의 사용빈도를 줄이고 각 페이지에 알맞는 예외메세지를 제공하기 위해 만든 예외핸들러
 * 예외 발생 시 발생한 예외와 일치하는 메서드가 실행된다.
 * 일치하는 예외가 없다면 부모타입의 예외처리 메소드가 실행된다.
 * @author 이승준
 *
 */
@ControllerAdvice
public class ExceptionHandlerControllerAdvice {
	
	// 이승준: 메세지를 포함하여 LoginException이 발생한 로그인폼 페이지로 리턴
	@ExceptionHandler(LoginException.class) 
	public String handleLoginException(LoginException e, Model model){
		e.printStackTrace();
		model.addAttribute("error", e.getMessage());
		return "form/loginForm.tiles";
	}
	
	// 이승준: 메세지를 포함하여 FindException이 발생한 findIdForm 페이지로 리턴
	@ExceptionHandler(FindException.class) 
	public String handleFindException(FindException e, Model model){
		e.printStackTrace();
		model.addAttribute("error", e.getMessage());
		return "form/findIdForm.tiles";
	}

	// 이승준: 메세지를 포함하여 FindPwdException이 발생한 findPwdForm 페이지로 리턴
	@ExceptionHandler(FindPwdException.class) 
	public String handleFindPwdException(FindPwdException e, Model model){
		e.printStackTrace();
		model.addAttribute("error", e.getMessage());
		return "form/findPwdForm.tiles";
	}
	
	 // 이승준: 메세지를 포함하여 UpdateException이 발생한 findIdForm 페이지로 리턴
	 @ExceptionHandler(UpdateException.class) 
	 public String handleUpdateException(UpdateException e, Model model) { 
		 e.printStackTrace();
		 model.addAttribute("error", e.getMessage()); 
		 return "mypage/userUpdate.mytiles"; 
	 }
	
	
	// 이승준: 메세지를 포함하여 RegisterException이 발생한 registerForm 페이지로 리턴
	@ExceptionHandler(RegisterException.class) 
	public String registerLoginException(RegisterException e, Model model){
		e.printStackTrace();
		model.addAttribute("error", e.getMessage());
		return "form/registerForm.tiles";
	}
	
	// 이승준: 공통된 예외처리 페이지를 리턴
	@ExceptionHandler(CustomException.class) 
	public String handleCustomException(CustomException e) {
		e.printStackTrace();
		return "error/customError.tiles";
	}
	
	// 이승준: 데이터베이스 오류 시 해당페이지를 리턴
	@ExceptionHandler(DataAccessException.class)
	public String handleDataAccessException(DataAccessException e) {
		
		return "error/databaseError.tiles";
	}
	
	// 이승준: 서버 오류 시 해당페이지를 리턴
	@ExceptionHandler(Exception.class)
	public String handleException(Exception e) {
		e.printStackTrace();
		return "error/serverError.tiles";
	}
	
	 // 성하민
	 @ExceptionHandler(AdminException.class) 
	 public String handleUpdateException(AdminException e, Model model) { 
		 e.printStackTrace();
		 model.addAttribute("error", e.getMessage()); 
		 return "error/adminError.tiles"; 
	 }
}
