package com.hoge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.mapper.UserMapper;
import com.hoge.vo.other.User;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public List<User> getAllUsers() {
		return userMapper.getAllUsers();
	}
}
