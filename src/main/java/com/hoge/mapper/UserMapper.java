package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.vo.other.User;

/**
 * 유저 기능에 관한 메서드명을 정의하였다.
 * @author 이승준
 *
 */
@Mapper
public interface UserMapper {
	
	List<User> getAllUsers();
	User getUser();
	User getUserByNo(int no);
	User getUserById(String id);
	User getUserBypwd(String pwd);
}
