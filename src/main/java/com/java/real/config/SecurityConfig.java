package com.java.real.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration 
public class SecurityConfig {

    /*@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
                .requestMatchers(
                        "/",
                        "/index",
                        "/home",
                        "/css/**",
                        "/js/**",
                        "/images/**"
                ).permitAll()
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")
                .permitAll()
            );

        return http.build();
    }
    
    */
	
	
	/*
	 * @Bean public SecurityFilterChain filterChain(HttpSecurity http) throws
	 * Exception { System.out.
	 * println("for Now i have just DIable the Spring Security Features okay :");
	 * http .csrf(csrf -> csrf.disable()) .authorizeHttpRequests(auth ->
	 * auth.anyRequest().permitAll()); return http.build(); }
	 */

}
