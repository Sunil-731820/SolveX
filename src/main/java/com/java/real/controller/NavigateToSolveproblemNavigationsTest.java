package com.java.real.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class NavigateToSolveproblemNavigationsTest {

    @GetMapping("/NavigateToSolveproblem")
    public String solveProblemPage() {
    	System.out.println("Calling the Solve problem page :=");
        return "solveProblem"; // loads the solveProblem called  solveProblem.jsp
    }
}
