package com.hoge.vo.other;

import java.sql.Date;

import com.hoge.form.ReservationInsertForm;

import lombok.Data;

@Data
public class KakaoPayReadyVO {
	
	private String tid, next_redirect_pc_url;
	private Date created_at;

}
