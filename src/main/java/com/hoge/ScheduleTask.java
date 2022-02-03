package com.hoge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hoge.service.HostService;

@Component
public class ScheduleTask {

	// 서비스나 디에이오 매퍼 오토와이어드 해서 실행한다.
	@Autowired 
	HostService hostService;
			
	@Scheduled(cron = "	0 0 0 * * ?")
	public void sendHostPaidMoney() {
		//관리자 앞으로 입금된 금액을 호스트에게 보낸다
		//체크인 익일 12시에 보냄
		//체험도 익일 12시에 보냄
	}
	
	@Scheduled(cron = "	0 0 0 * * ?")
	public void expirePromotion() {
		//프로모션 기간 만료되게 만드는 메소드
	}
}
