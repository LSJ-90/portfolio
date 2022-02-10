package com.hoge.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hoge.service.ActivityService;

@RestController
@RequestMapping("/rest/activity")
public class ActivityRestController {
	
	@Autowired
	private ActivityService activityService;
	

}
