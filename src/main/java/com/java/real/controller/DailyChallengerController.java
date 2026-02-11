package com.java.real.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DailyChallengerController {
	
	
	@GetMapping("/daily")
	public String getDailyChallengers() {
		return "daily"; // It will navigate to daily.jsp page when you hit url
	}

}
