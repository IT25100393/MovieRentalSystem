package com.movierentalsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class MovieRentalSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(MovieRentalSystemApplication.class, args);
	}

}