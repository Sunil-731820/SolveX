package com.java.real.repository.jpa;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.real.entity.PasswordResetOtp;


public interface OtpRepository extends JpaRepository<PasswordResetOtp, Long> {
    PasswordResetOtp findByEmailAndOtp(String email, String otp);
}
