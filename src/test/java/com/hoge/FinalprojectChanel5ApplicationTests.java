/*
 * package com.hoge;
 * 
 * import org.junit.jupiter.api.Test; import
 * org.springframework.boot.test.context.SpringBootTest;
 * 
 * @SpringBootTest class FinalprojectChanel5ApplicationTests {
 * 
 * @Test void contextLoads() { }
 * 
 * }
 */

package com.hoge;

import static org.assertj.core.api.Assertions.assertThat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class FinalprojectChanel5ApplicationTests {

	
		
	@Autowired
	DataSource dataSource;
	
	@Test
	void testDataSourceAndConnection() throws Exception {
		assertThat(dataSource).isNotNull();
		assertThat(dataSource.getConnection()).isNotNull();
		
	}
	
	@Test
	void testSelect() throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement("select count(*) from tb_final_users");
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		rs.close();
		pstmt.close();
		con.close();
		
		assertThat(count).isEqualTo(18);
		
	}
}
