package com.hoge.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hoge.dto.AdminUserQnADto;
import com.hoge.form.CriteriaAdminQnA;
import com.hoge.form.CriteriaAdminUser;
import com.hoge.vo.other.HostQnA;
import com.hoge.vo.other.User;
import com.hoge.vo.other.UserQnA;


@Mapper
public interface QnAMapper {
	
	// 성하민 호스트번호로 문의글 찾기
	List<HostQnA> getHostQnAListByHostNo(@Param("no") int no, @Param("begin") int begin, @Param("end") int end);

	List<UserQnA> getUserQnAListByUserNo(@Param("no") int no, @Param("begin") int begin, @Param("end") int end);
	
	//성하민
	void insertHostQnA(HostQnA hostQnA);
	
	//성하민
 	void insertUserQnA(UserQnA userQnA); 
	
	//성하민
	int getHostQnACountByHostNo(int no);
	
	//성하민
	int getUserQnACountByUserNo(int no);
	
	
	
	 
			
	
	//여기서부터 adminpage관련
	
	// 성하민
	int getUserQnAsTotalRows(CriteriaAdminQnA criteriaAdminQnA);
		
	// 성하민
	List<AdminUserQnADto> searchQnAs(CriteriaAdminQnA criteriaAdminQnA);
	
	
	

}
