package com.hoge.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hoge.service.UserService;
import com.hoge.vo.other.User;

@RestController
@RequestMapping("/api/user")
public class UserController {
	@Autowired
	private UserService testUserService;

	@GetMapping
	public List<User> users() {
		return testUserService.getAllUsers();
	}
}
