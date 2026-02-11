package com.java.real.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class LogoutController {

    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	System.out.println("Calling the logOut methods :=");
        session.invalidate();   // destroy session
        return "redirect:/login";
    }
}
