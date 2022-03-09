package com.hoge.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoge.dto.HogeUserDto;
import com.hoge.dto.KakaoUserDto;
import com.hoge.dto.MailDto;
import com.hoge.service.SendEmailService;
import com.hoge.service.UserService;
import com.hoge.util.SessionUtils;
import com.hoge.vo.other.User;

import lombok.extern.slf4j.Slf4j;

/**
 * 사용자를 위한 컨트롤러
 * @author 이승준
 *
 */
@Controller
@Slf4j
public class UserAuthController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SendEmailService sendEmailService;
	
	// 이승준: 로그인폼 페이지 리턴
	@GetMapping("/login")
	public String loginInit() throws Exception {
		
		return "form/loginForm.tiles";
	}
	
	// 이승준: 로그인 시도 >> 성공 시 홈 페이지로 리다이렉트(관리자일 경우 관리자페이지 메인으로 리다이렉트)
	@PostMapping("/login")
	public String login(String id, String pwd) {
		
		User savedUser = userService.login(id, pwd);
		SessionUtils.addAttribute("LOGIN_USER", savedUser);
		
		// 관리자 계정은 admin01, admin02로 사용한다.
		if ("admin01".equals(savedUser.getId()) || "admin02".equals(savedUser.getId())) {
			return "redirect:admin/main";
		}
		
		return "redirect:home";
	}
	
	// 이승준: 카카오톡 로그인
	@PostMapping("/loginKakao")
	public String loginKakao(KakaoUserDto kakaoUser) {
		
		log.info("카카오 로그인 인증정보 : " + kakaoUser );
	
		User savedUser = userService.loginKakao(kakaoUser);
		
		SessionUtils.addAttribute("LOGIN_USER", savedUser);
		
		
		return "redirect:home";
	}
	
	// 이승준: 회원가입 페이지로 리턴
	@GetMapping("/register")
	public String registerInit(Model model) {
		model.addAttribute("registerForm", new HogeUserDto());
		return "form/registerForm.tiles";
	}
	
	// 이승준: 회원가입 
	@PostMapping("/register")
	public String register(@ModelAttribute("registerForm") @Valid HogeUserDto newUser, BindingResult errors, Model model) {
		
		if (errors.hasErrors()) {
			return "form/registerForm.tiles";
		}
		
		userService.register(newUser);
		
		SessionUtils.addAttribute("LOGIN_USER", newUser);
		
		return "form/completeRegister.tiles";
	}
	
	// 이승준: 아이디 찾기 페이지 리턴
	@GetMapping("/findid")
	public String findIdInit() {
		
		return "form/findIdForm.tiles";
	}
	
	// 이승준: 이메일로 아이디 찾기
	@PostMapping("/findid")
	public String findId(@RequestParam("userEmail") String email, Model model) {
		
		User savedUser = userService.getUserByEmail(email);
		
		model.addAttribute("userId", savedUser.getId());
		
		return "form/findIdForm.tiles";
	}
	
	// 이승준: 패스워드 찾기 페이지 리턴
	@GetMapping("/findpwd")
	public String findPwdInit() {
		
		return "form/findPwdForm.tiles";
	}
	
	// 이승준: 이메일로 패스워드 찾기
	@PostMapping("/findpwd")
	public String findPwd(@RequestParam("userId") String id, @RequestParam("userEmail") String email, Model model) {
		MailDto mailDto = sendEmailService.createMailAndChangePassword(id, email);
	
		sendEmailService.mailSend(mailDto);
		
		return  "form/loginForm.tiles";
	}
	
	// 이승준: 로그아웃 시 홈 페이지로 리다이렉트
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.sessionInvlidate();
		return "redirect:home";
	}
}