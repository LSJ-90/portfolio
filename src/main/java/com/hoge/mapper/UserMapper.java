package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.vo.other.User;

@Mapper
public interface UserMapper {
	
	List<User> getAllUsers();
}
