package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.vo.User;

@Mapper
public interface TestUserMapper {
	
	List<User> getAllUsers();
}
