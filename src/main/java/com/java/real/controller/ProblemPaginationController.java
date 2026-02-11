package com.java.real.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.real.entity.Problem;
import com.java.real.repository.mongodb.ProblemRepository;
import com.java.real.service.ProblemService;


@Controller
public class ProblemPaginationController {

    @Autowired
    private ProblemRepository problemRepository;
    
    @Autowired
    private ProblemService problemService;
    
    @GetMapping("/listOfproblems")
    public String listProblems(@RequestParam(defaultValue = "0") int page, Model model) {
    	System.out.println("Calling the listof the Problems method from controller class :="+page);
        int pageSize = 10;
        Page<Problem> problemPage = problemRepository.findAll(PageRequest.of(page, pageSize));

        model.addAttribute("problems", problemPage.getContent());
        model.addAttribute("currentPage", problemPage.getNumber());
        model.addAttribute("totalPages", problemPage.getTotalPages());
        System.out.println("The value of the current page is :="+problemPage.getNumber());
        System.out.println("The Value of the total page is :="+problemPage.getTotalPages());
        System.out.println("problem size is :="+problemPage.getSize());
        return "problems"; // forwards to problems.jsp
    }


	/*
	 * @GetMapping("/listOfproblems") public String
	 * listProblems(@RequestParam(defaultValue = "0") int page, Model model) { int
	 * pageSize = 20; // 20 per page Pageable pageable = PageRequest.of(page,
	 * pageSize); Page<Problem> problemPage = problemRepository.findAll(pageable);
	 * 
	 * model.addAttribute("problems", problemPage.getContent());
	 * model.addAttribute("currentPage", problemPage.getNumber());
	 * model.addAttribute("totalPages", problemPage.getTotalPages());
	 * model.addAttribute("totalElements", problemPage.getTotalElements());
	 * System.out.println("Total elements: " + problemPage.getTotalElements());
	 * System.out.println("Total pages: " + problemPage.getTotalPages());
	 * System.out.println("Current page: " + problemPage.getNumber());
	 * 
	 * 
	 * return "problems"; }
	 */

}
