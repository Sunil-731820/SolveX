package com.java.real.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.real.service.UserProblemStatusService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/problem")
public class UserProblemStatusController {

    @Autowired
    private UserProblemStatusService service;

    @PostMapping("/solve")
    @ResponseBody
    public String markSolved(@RequestParam String problemId,
                             HttpSession session) {
    	System.out.println("Solve clicked for " + problemId);

        String email = (String) session.getAttribute("loggedInUserEmail");
        service.markSolved(email, problemId);
        return "OK";
    }

    @PostMapping("/favorite")
    @ResponseBody
    public String toggleFavorite(@RequestParam String problemId,
                                 HttpSession session) {
    	System.out.println("Solve clicked for " + problemId);

        String email = (String) session.getAttribute("loggedInUserEmail");
        service.toggleFavorite(email, problemId);
        return "OK";
    }
}
