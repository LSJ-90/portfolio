package com.hoge.reservation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.reservation.vo.User;

@Mapper
public interface TestUserMapper {
	
	List<User> getAllUsers();
}
