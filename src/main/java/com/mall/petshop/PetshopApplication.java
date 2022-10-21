package com.mall.petshop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@MapperScan(value={"com.mall.petshop.mapper"})
@SpringBootApplication
public class PetshopApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(PetshopApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder applicationBuilder) {
		return applicationBuilder.sources(ServletInitializer.class);
	}

}
