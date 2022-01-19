package com.hoge.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoge.reservation.mapper.TestUserMapper;
import com.hoge.reservation.vo.User;

@Service
public class TestUserService {
	
	@Autowired
	private TestUserMapper testUserMapper;
	
	public List<User> getAllUsers() {
		return testUserMapper.getAllUsers();
	}
}
