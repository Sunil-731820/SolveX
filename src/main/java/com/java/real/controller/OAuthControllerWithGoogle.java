package com.java.real.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.java.real.repository.jpa.UserRepository;
import com.java.real.service.LoginWithGoogleService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OAuthControllerWithGoogle {

	private final UserRepository userRepository;

	public OAuthControllerWithGoogle(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Autowired
	private LoginWithGoogleService authService;

	/*
	 * @GetMapping("/google-login") public String googleLogin(
	 * 
	 * @AuthenticationPrincipal OAuth2User oauthUser, HttpSession session, Model
	 * model) { System.out.println("Calling the google Login Methods Okay :=");
	 * 
	 * if (oauthUser == null) {
	 * System.out.println("The User is null Checking here Okay:="); return
	 * "redirect:/login?error"; }
	 * 
	 * try { // String email = oauthUser.getAttribute("email"); // String name =
	 * oauthUser.getAttribute("name");
	 * 
	 * User user = authService.loginWithGoogle(email, name);
	 * 
	 * session.setAttribute("user", user); return "redirect:/home";// // Google
	 * attributes String googleId = oauthUser.getAttribute("sub"); // UNIQUE String
	 * email = oauthUser.getAttribute("email"); String name =
	 * oauthUser.getAttribute("name"); Boolean verified =
	 * oauthUser.getAttribute("email_verified"); // Check user exists Optional<User>
	 * existingUser = userRepository.findByAuthProviderAndProviderUserId( "GOOGLE",
	 * googleId);
	 * 
	 * if (existingUser.isEmpty()) {
	 * 
	 * // Create new user User user = new User(); user.setEmail(email);
	 * user.setName(name); user.setAuthProvider("GOOGLE");;
	 * user.setProviderUserId(googleId);
	 * user.setEmailVerified(Boolean.TRUE.equals(verified)); user.setEnabled(true);
	 * 
	 * userRepository.save(user); }
	 * 
	 * return "redirect:/home";
	 * 
	 * } catch (InvalidCredentialsException ex) { model.addAttribute("errorMessage",
	 * ex.getMessage()); return "login"; } }
	 */
}
