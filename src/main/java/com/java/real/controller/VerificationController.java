package com.java.real.controller;


import java.time.LocalDateTime;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.real.entity.User;
import com.java.real.entity.VerificationToken;
import com.java.real.repository.jpa.UserRepository;
import com.java.real.repository.jpa.VerificationTokenRepository;
import com.java.real.service.EmailService;



@Controller
public class VerificationController {

//    private final controller.AuthController authController;

    @Autowired
    private VerificationTokenRepository tokenRepository;

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private EmailService emailService;

//    VerificationController(controller.AuthController authController) {
//        this.authController = authController;
//    }

    /**
     * Email verification endpoint
     * Example URL:
     * http://localhost:8080/verify-email?token=abc123
     */
    @GetMapping("/verify-email1")
    public String verifyEmail(@RequestParam("token") String token,
                              Model model) {

        // 1. Find token
        VerificationToken verificationToken =
                tokenRepository.findByToken(token);

        if (verificationToken == null) {
            model.addAttribute("errorMessage",
                    "Invalid verification link.");
            return "login";
        }

        // 2. Check expiry
        if (verificationToken.getExpiryTime()
                .isBefore(LocalDateTime.now())) {

            model.addAttribute("errorMessage",
                    "Verification link has expired.");
            return "login";
        }

        // 3. Enable user
        User user = verificationToken.getUser();
        user.setEnabled(true);
        userRepository.save(user);

        // 4. Delete token (one-time use)
        tokenRepository.delete(verificationToken);

        // 5. Success message
        model.addAttribute("successMessage",
                "Email verified successfully. You can now login.");

        return "login";
    }
    
//    Resend Link Email Verfications for User if First Time Did not verify their email after sign up
    
    @GetMapping("/resend-verification")
    public String resendVerification(@RequestParam("email") String email,
                                     Model model) {
    	System.out.println("Calling the Resend Verifications methods to Send Link");
        User user = userRepository.findByEmail(email).orElse(null);

        if (user == null) {
            model.addAttribute("errorMessage", "Email not found.");
            return "login";
        }

        if (user.isEnabled()) {
            model.addAttribute("successMessage",
                    "Your email is already verified.");
            return "login";
        }
 
        // Delete old token (if exists)
        tokenRepository.deleteByUser(user);

        // Create new token
        String token = UUID.randomUUID().toString();
        VerificationToken verificationToken = new VerificationToken();
        verificationToken.setToken(token);
        verificationToken.setUser(user);
        verificationToken.setExpiryTime(LocalDateTime.now().plusHours(24));
        tokenRepository.save(verificationToken);

        // Send email
        String link = "http://localhost:8080/verify-email?token=" + token;
        emailService.sendVerificationEmail(user.getEmail(), link);

        model.addAttribute("successMessage",
                "Verification email resent successfully.");

        return "login";
    }
    
    
    @GetMapping("/resend-verification-page")
    public String showResendVerificationPage() {
        return "resendVerification"; // JSP name (NO .jsp)
    }
    
}
