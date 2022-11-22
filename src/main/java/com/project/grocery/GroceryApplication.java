package com.project.grocery;

import com.project.grocery.controller.ProductsController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.File;

@SpringBootApplication
public class GroceryApplication {

	public static void main(String[] args) {

		new File(ProductsController.uploadDirectory).mkdir();
		SpringApplication.run(GroceryApplication.class, args);
	}

}
