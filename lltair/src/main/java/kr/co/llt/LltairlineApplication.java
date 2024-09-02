package kr.co.llt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class LltairlineApplication {

	public static void main(String[] args) {
		SpringApplication.run(LltairlineApplication.class, args);
	}
	
	@Bean
	public FilterRegistrationBean<SitemeshConfig> sitemeshbean() {
		FilterRegistrationBean<SitemeshConfig> bean=new FilterRegistrationBean<SitemeshConfig>();
		bean.setFilter(new SitemeshConfig());
		bean.addUrlPatterns("/*");
		return bean;
	}

}
