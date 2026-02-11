package com.java.real;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SolveXApplication {

	public static void main(String[] args) {
		System.out.println("This is Projects ");
		SpringApplication.run(SolveXApplication.class, args);
	}
	
//	Adding one end point for Our Projects 
	@GetMapping("/hello")
	public String helloEndPoint() {
		return "The project is started called as SolveX";
	}

}
