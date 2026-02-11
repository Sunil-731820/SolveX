package com.java.real.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Entity
@Data
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank(message = "Name is Required ")
    private String name;
    
    @Email(message = "Invalid email format")
    @NotBlank(message = "Email is required")
//    @Column(nullable = false, unique = true)
    private String email;
    
    @NotBlank(message = "Password is required")
    @Size(min = 6, message = "Password must be at least 6 characters")
    private String password;
    
    private boolean enabled;
    
    private String authProvider;
    
    
    
    
	public String getAuthProvider() {
		return authProvider;
	}
	public void setAuthProvider(String authProvider) {
		this.authProvider = authProvider;
	}
	private String providerUserId;    // Google "sub"

    private boolean emailVerified;
    
    
    
//    private int failedAttempts = 0;
//
//    private boolean accountLocked = false;
//
//    private LocalDateTime lockTime;
//    
    
    
	public String getProviderUserId() {
		return providerUserId;
	}
	public void setProviderUserId(String providerUserId) {
		this.providerUserId = providerUserId;
	}
	public boolean isEmailVerified() {
		return emailVerified;
	}
	public void setEmailVerified(boolean emailVerified) {
		this.emailVerified = emailVerified;
	}

	/*
	 * public String getAuthProvider() { return authProvider; } public void
	 * setAuthProvider(String authProvider) { this.authProvider = authProvider; }
	 */
	 /*
	 * public int getFailedAttempts() { return failedAttempts; } public void
	 * setFailedAttempts(int failedAttempts) { this.failedAttempts = failedAttempts;
	 * } public boolean isAccountLocked() { return accountLocked; } public void
	 * setAccountLocked(boolean accountLocked) { this.accountLocked = accountLocked;
	 * } public LocalDateTime getLockTime() { return lockTime; } public void
	 * setLockTime(LocalDateTime lockTime) { this.lockTime = lockTime; }
	 */	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


}
