package com.hoge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hoge.form.CriteriaAdminUser;
import com.hoge.vo.other.User;


/**
 * 유저 기능에 관한 메서드명을 정의하였다.
 * @author 이승준
 *
 */
@Mapper
public interface UserMapper {
	
	List<User> getAllUsers();
	int getUsersTotalRows(CriteriaAdminUser CAU);
	List<User> searchUsers(CriteriaAdminUser CAU);

}
