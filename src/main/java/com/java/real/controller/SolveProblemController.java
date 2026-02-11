package com.java.real.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.java.real.entity.Problem;
import com.java.real.repository.mongodb.ProblemRepository;


@Controller
public class SolveProblemController {

    @Autowired
    private ProblemRepository problemRepository;

    @GetMapping("/solve/{id}")
    public String solveProblem(@PathVariable String id, Model model) {
    	System.out.println("Calling the Solve problems methods Okay :=");
        Problem problem = problemRepository.findById(id).orElse(null);
        System.out.println("The Title of the problem is :"+problem.getTitle());
        System.out.println("The Value of the Description of the problems :"+problem.getDescription());
        model.addAttribute("problem", problem);
        return "solveProblem"; // maps to SolveProblem.jsp
    }
    
	/*
	 * @GetMapping("/solve/{id}") public String solveProblem(@PathVariable String
	 * id, Model model) { Problem problem = problemRepository.findById(id)
	 * .orElseThrow(() -> new RuntimeException("Problem not found"));
	 * model.addAttribute("problem", problem); return "solved"; // solved.jsp }
	 */

}
