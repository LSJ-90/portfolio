package com.hoge.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.hoge.dto.HogeUserUpdateDto;
import com.hoge.dto.KakaoUserDto;
import com.hoge.dto.UpdatePwdDto;
import com.hoge.exception.FindException;
import com.hoge.exception.LoginException;
import com.hoge.form.CriteriaAdminUser;
import com.hoge.mapper.UserMapper;
import com.hoge.util.SessionUtils;
import com.hoge.vo.other.User;

/**
 * User에 관한 서비스 로직
 * @author 이승준
 *
 */
@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	// 이승준 공용
	public List<User> getAllUsers() {
		return userMapper.getAllUsers();
	}
	
	// 이승준: 이메일 정보를 조회하여 유저정보를 리턴
	public User getUserByEmail(String email) {
		
		User savedUser = userMapper.getUserByEmail(email);
		
		if (savedUser == null) {
			throw new FindException("회원정보가 존재하지 않습니다.");
		}
		
		return savedUser;
	}
	
	// 이승준: 유저넘버 정보를 조회하여 유저정보를 리턴
	public User getUserByNo(int no) {
		
		User savedUser = userMapper.getUserByNo(no);
		
		if (savedUser == null) {
			throw new FindException("회원정보가 존재하지 않습니다.");
		}
		
		return savedUser;
	}
	
	// 이승준: 유저 아이디 정보를 조회하여 유저정보를 리턴
	public User getUserById(String id) {
		
		User savedUser = userMapper.getUserById(id);
		
		if (savedUser == null) {
			throw new FindException("회원정보가 존재하지 않습니다.");
		}
		
		return savedUser;
	}
	
	// 이승준: 유저 기본정보 업데이트 트랜젝션
	public void updateUser(HogeUserUpdateDto user) {
		
		/* TODO: 비번조회 승인으로 최종 저장
		 * User savedUser = (User) SessionUtils.getAttribute("LOGIN_USER");
		 * String authPwd = DigestUtils.sha512Hex(user.getPwd()); if
		 * (!authPwd.equals(savedUser.getPwd())) { throw new
		 * UpdateException("비밀번호가 일치하지 않습니다."); }
		 */
		
		userMapper.updateUser(user);
	}
	
	// 이승준: 유저 비밀번호 업데이트 트랜젝션
	public void updatePwd(UpdatePwdDto pwd) {
		
		// 수정된 비밀번호 암호화
		String authPwd = DigestUtils.sha512Hex(pwd.getChangePwd());
		pwd.setChangePwd(authPwd);
	
		userMapper.updatePwd(pwd);
	}
	
	// 이승준 로그인페이지
	public User login(String id, String pwd) {
		
		if (!StringUtils.hasText(id) || !StringUtils.hasText(pwd)) {
			throw new LoginException("<strong>아이디</strong> 또는 <strong>비밀번호</strong>를 입력하지 않았습니다.");
		}
		
		User savedUser = userMapper.getUserById(id);		
		
		if (savedUser == null) {
			throw new LoginException("회원정보가 존재하지 않습니다.");
		}
		
		if ("Y".equals(savedUser.getDeleted())) {
			throw new LoginException("탈퇴처리된 아이디입니다. 재가입해주세요.");
		}
		
		String authPwd = DigestUtils.sha512Hex(pwd);
		if (!authPwd.equals(savedUser.getPwd())) {
			throw new LoginException("비밀번호가 일치하지 않습니다.");
		}
		
		return savedUser;
	}
	
	// 이승준: 카카오톡 로그인페이지
	public User loginKakao(KakaoUserDto kakaoUser) {
		
		User savedUser = userMapper.getUserById(kakaoUser.getId());
		
		if (savedUser == null) {
			userMapper.insertUserKaKao(kakaoUser);
			savedUser = userMapper.getUserById(kakaoUser.getId());
		}
		
		return savedUser;
	}
	
	// 이승준: 회원가입 페이지
	public int userCheckById(String id) {
		return userMapper.userCheckByid(id);
	}
	
	// 이승준: 회원가입 페이지
	public User register(User newUser) {
		
		userMapper.insertUser(newUser);
		
		return newUser;
	}
	
	// 이승준: 회원탈퇴
	public void deleteUser(String pwd) {
		
		User savedUser = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		String authPwd = DigestUtils.sha512Hex(pwd);
		if (!authPwd.equals(savedUser.getPwd())) {
			throw new LoginException("비밀번호가 일치하지 않습니다.");
		}
		
		userMapper.deleteUser(savedUser.getNo());
	}
	
	// 성하민 관리자페이지
	public int getUsersTotalRows(CriteriaAdminUser CAU) {
		return userMapper.getUsersTotalRows(CAU);
	}
	
	// 성하민 관리자페이지
	public List<User> searchUsers(CriteriaAdminUser CAU) {
		return userMapper.searchUsers(CAU);
	}
}