package com.mall.petshop.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@Slf4j
public class WebConfig implements WebMvcConfigurer {

    private String connectPath = "/img/**";

    @Value("${spring.servlet.multipart.location}")
    private String uploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        log.debug("업로드 컨피그 작동 확인 연결경로 : {}", connectPath);
        log.debug("업로드 컨피그 작동 확인 파일경로 : {}", uploadPath);
        registry.addResourceHandler(connectPath)
                .addResourceLocations("file:///" + uploadPath);
    }

}