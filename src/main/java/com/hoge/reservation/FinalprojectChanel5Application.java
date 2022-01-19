package com.hoge.reservation;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.hoge.reservation.mapper")
public class FinalprojectChanel5Application {

	public static void main(String[] args) {
		SpringApplication.run(FinalprojectChanel5Application.class, args);
	}

}
