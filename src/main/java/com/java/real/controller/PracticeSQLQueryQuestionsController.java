package com.java.real.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PracticeSQLQueryQuestionsController {
	
	@GetMapping("/practiceSQLQuery")
	public String getDailyChallengers() {
		return "sqlData/week1SQLChallenges/Days1SQLChallenges/day1-11to30-sqlQuestions"; // It will navigate to day1-11to30-sqlQuestions.jsp page when you hit url
	}


}
