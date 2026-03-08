package com.movierentalsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.server.servlet.context.ServletComponentScan; // Spring Boot 4.0 අලුත් package එක

@SpringBootApplication
@ServletComponentScan
public class MovieRentalSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(MovieRentalSystemApplication.class, args);
	}

}