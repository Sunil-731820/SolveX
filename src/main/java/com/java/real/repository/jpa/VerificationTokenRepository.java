package com.java.real.repository.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import com.java.real.entity.User;
import com.java.real.entity.VerificationToken;


public interface VerificationTokenRepository extends JpaRepository<VerificationToken, Long> {

	VerificationToken findByToken(String token);
	 VerificationToken findByUser(User user);

	 @Modifying
	 @Transactional
	    void deleteByUser(User user);
}
