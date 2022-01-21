package com.hoge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hoge.service.HostService;
import com.hoge.util.SessionUtils;
import com.hoge.vo.other.Host;

@Controller
public class HostController {
	
	@Autowired
	private HostService hostService;
	
	@GetMapping("/host/applyForm")
	public String ApplyForm() {
		//SessionUtils.addAttribute("세션아이디", "세션값");
		return "hostpage/applyForm.tiles";
	}
	
	@GetMapping("/host/main")
	public String Main() {
		//SessionUtils.addAttribute("세션아이디", "세션값");
		return "hostpage/main.tiles";
	}
	
	@RequestMapping(value = "/host/req", method = RequestMethod.POST)
	public ModelAndView ApplyReq(ModelAndView mv, Host host) {
		hostService.apply(host);
		System.out.print(host);
		return null;	
	}
	public ModelAndView MainReq() {
		return null;	
	}
}
