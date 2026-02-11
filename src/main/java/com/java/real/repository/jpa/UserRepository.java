package com.java.real.repository.jpa;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.java.real.entity.User;


public interface UserRepository extends JpaRepository<User, Long> {
	
    Optional<User> findByEmail(String email);
//    User loginWithGoogle(String email, String name);
    
    Optional<User> findByAuthProviderAndProviderUserId(
            String authProvider,
            String providerUserId
    );
}
 