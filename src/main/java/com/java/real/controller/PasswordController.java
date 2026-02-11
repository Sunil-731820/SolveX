package com.java.real.controller;

import java.time.LocalDateTime;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.java.real.entity.PasswordResetOtp;
import com.java.real.entity.User;
import com.java.real.exceptions.OtpExpiredException;
import com.java.real.exceptions.OtpInvalidException;
import com.java.real.repository.jpa.OtpRepository;
import com.java.real.repository.jpa.UserRepository;
import com.java.real.service.EmailService;


@Controller
public class PasswordController {

	@Autowired
	OtpRepository otpRepository;
	@Autowired
	EmailService emailService;

	@Autowired
	UserRepository userRepository ;
	
	// SHOW forgot password page
    @GetMapping("/forgot-password")
    public String showForgotPasswordPage() {
        return "forgot-password";
    }

	@PostMapping("/forgot-password")
	public String forgotPassword(String email) {
		System.out.println("Calling the forgot Password methods :=");
	    String otp = String.valueOf(new Random().nextInt(900000) + 100000);

	    PasswordResetOtp resetOtp = new PasswordResetOtp();
	    resetOtp.setEmail(email);
	    resetOtp.setOtp(otp);
	    resetOtp.setExpiryTime(LocalDateTime.now().plusMinutes(5));

	    otpRepository.save(resetOtp);
	    emailService.sendOtpEmail(email, otp);
	    
	    return "verify-otp";
	}


	@PostMapping("/verify-otp")
	public String verifyOtp(String email, String otp) {
		System.out.println("Calling the verfy OTP methods :=");
	    PasswordResetOtp resetOtp =
	            otpRepository.findByEmailAndOtp(email, otp);
	    if(resetOtp==null) {
	    	throw new OtpInvalidException("Invalid OTP,Please Check once");
	    }
	    
	    if(resetOtp.getExpiryTime().isBefore(LocalDateTime.now())) {
	    	throw new OtpExpiredException("OTP has expired. Please request a new one.");
	    }
	    if (resetOtp != null &&
	        resetOtp.getExpiryTime().isAfter(LocalDateTime.now())) {
	        return "reset-password";
	    }
	    return "verify-otp";
	}


	@PostMapping("/reset-password")
	public String resetPassword(String email, String password) {
		System.out.println("Calling the reset password methods :=");
	    User user = userRepository.findByEmail(email).orElse(null);
	    if (user != null) {
	        user.setPassword(new BCryptPasswordEncoder().encode(password));
	        userRepository.save(user);
	    } 
	    return "login";
	}



}
