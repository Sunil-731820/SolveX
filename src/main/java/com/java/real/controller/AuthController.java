package com.java.real.controller;

import java.security.PrivateKey;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.java.real.entity.User;
import com.java.real.entity.VerificationToken;
import com.java.real.exceptions.InvalidCredentialsException;
import com.java.real.repository.jpa.UserRepository;
import com.java.real.repository.jpa.VerificationTokenRepository;
import com.java.real.service.EmailService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
public class AuthController {

	@Autowired
	UserRepository userRepository;
	
	@Autowired
	VerificationTokenRepository verificationTokenRepository;
	
	@Autowired
	EmailService emailService;
	
    private static final Logger log = Logger.getLogger(AuthController.class);

	@PostMapping("/signup")
	public String signup(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		//log.debug("I am calling Signup page Methods :=");
		log.warn("Checking warn ");
		log.info("Checking info");
		log.fatal("Checkig fatal");

	    
		 if (result.hasErrors()) {
	            // Get the first validation error
//	            model.addAttribute("errorMessage", result.getAllErrors().get(0).getDefaultMessage());
			// Collect all requireds fields error messages
		        List<String> errorMessages = result.getAllErrors()
		                                           .stream()
		                                           .map(e -> e.getDefaultMessage())
		                                           .toList();
		        model.addAttribute("errorMessages", errorMessages);
		        log.info("this is for Testing");
	            return "signup";
	        }
		user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
		user.setEnabled(false); // ❗ disable until email verified
	    userRepository.save(user);
	    
	 // create verification token
	    String token = UUID.randomUUID().toString();
	    VerificationToken verificationToken = new VerificationToken();
	    verificationToken.setToken(token);
	    verificationToken.setUser(user);
	    verificationToken.setExpiryTime(LocalDateTime.now().plusHours(24));
	    verificationTokenRepository.save(verificationToken);

	    // send email
	    String link = "http://localhost:8080/verify-email?token=" + token;
	    emailService.sendVerificationEmail(user.getEmail(), link);

	    model.addAttribute("successMessage",
	            "Verification email sent. Please check your inbox.");
	    
	    return "login";
	}

	@PostMapping("/login")
	public String login(String email, String password,Model model, HttpSession session) {
		System.out.println("Calling the Login Methods:=");
	    User user = userRepository.findByEmail(email).orElseThrow(() -> new InvalidCredentialsException("Invalid Email & passowrd Please check once"));
	    String userEmail = user.getEmail();
	    System.out.println("the User Email id is :"+userEmail);
	    session.setAttribute("userEmail", userEmail);
	    if (user == null) {
	        model.addAttribute("errorMessage", "Invalid email or password");
	        return "login";
	    }
	    
	    
	    
	    // Email NOT verified
	    if (!user.isEnabled()) {
	        model.addAttribute("errorMessage",
	                "Please verify your email before login.");
	        model.addAttribute("email", user.getEmail()); // send email to JSP for Resend Link
	        return "login";
	    }
	    if (user != null &&
	        new BCryptPasswordEncoder().matches(password, user.getPassword())) {
	        return "home";
	    }
	    return "login";
	}



}