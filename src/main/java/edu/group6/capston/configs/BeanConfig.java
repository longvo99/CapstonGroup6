package edu.group6.capston.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.ResourceBundleViewResolver;

@Configuration
public class BeanConfig {

	@Bean
	public ResourceBundleMessageSource messageSource() {
		ResourceBundleMessageSource source = new ResourceBundleMessageSource();
		source.setBasename("messages");
		source.setUseCodeAsDefaultMessage(true);
		source.setDefaultEncoding("UTF-8");
		return source;
	}

	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		return resolver;
	}

	@Bean
	public ResourceBundleViewResolver resourceBundleViewResolver() {
		ResourceBundleViewResolver resolver = new ResourceBundleViewResolver();
		resolver.setBasename("views");
		return resolver;
	}

}
