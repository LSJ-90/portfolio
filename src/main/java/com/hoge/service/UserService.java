package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.form.CriteriaAdminUser;
import com.hoge.mapper.UserMapper;
import com.hoge.vo.other.User;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public List<User> getAllUsers() {
		return userMapper.getAllUsers();
	}
	
	/**
	 * 성하민 관리자페이지
	 * @param CAU
	 * @return 
	 */
	public int getUsersTotalRows(CriteriaAdminUser CAU) {
		return userMapper.getUsersTotalRows(CAU);
	}
	
	/**
	 * 성하민 관리자페이지
	 * @param CAU
	 * @return
	 */
	public List<User> searchUsers(CriteriaAdminUser CAU) {
		return userMapper.searchUsers(CAU);
	}
	

}
