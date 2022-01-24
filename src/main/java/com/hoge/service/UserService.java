package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.exception.LoginException;
import com.hoge.exception.RegisterException;
import com.hoge.form.CriteriaAdminUser;
import com.hoge.mapper.UserMapper;
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
	
	// 이승준 로그인페이지
	public User login(String id, String pwd) {
		
		User savedUser = userMapper.getUserById(id);		
		
		if (savedUser == null) {
			throw new LoginException("회원정보가 존재하지 않습니다.");
		}
		
		if ("Y".equals(savedUser.getDeleted())) {
			throw new LoginException("탈퇴처리된 아이디입니다. 재가입해주세요.");
		}
		
		if (!pwd.equals(savedUser.getPwd())) {
			throw new LoginException("비밀번호가 일치하지 않습니다.");
		}
		
		return savedUser;
	}
	
	// 이승준: 회원가입 중복체크
	public int userCheckById(String id) {
		
		return userMapper.userCheckByid(id);
	}
	
	// 이승준 회원가입
	public User register(User newUser) {
		
		userMapper.insertUser(newUser);
		
		return newUser;
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