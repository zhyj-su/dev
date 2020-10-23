package com.zero.ureport2.config;

import com.bstek.ureport.console.UReportServlet;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ImportResource("classpath:ureport-console-context.xml")
public class UReport2Config {

    @Bean
    public ServletRegistrationBean initUReport() {
        return new ServletRegistrationBean<>(new UReportServlet(), "/ureport/*");
    }
}
