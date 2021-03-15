package edu.group6.capston.configs;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import edu.group6.capston.services.impls.UserServiceImpl;
 
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;
	
	@Autowired
    UserServiceImpl userServiceImpl;

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        // Password encoder, để Spring Security sử dụng mã hóa mật khẩu người dùng
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth)
            throws Exception {
        auth.userDetailsService(userServiceImpl) // Cung cáp userservice cho spring security
            .passwordEncoder(bCryptPasswordEncoder()); // cung cấp password encoder
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.authorizeRequests().
		and().csrf().
		disable().
		formLogin().
		loginPage("/auth/login").
		usernameParameter("username").
		passwordParameter("password").
		defaultSuccessUrl("/admin/index").
		failureUrl("/auth/login?msg=Error").	
		loginProcessingUrl("/auth/login").
		and().logout().
		logoutUrl("/auth/logout").
		logoutSuccessUrl("/auth/login").
		invalidateHttpSession(true).
		deleteCookies("JSESSIONID").
		and().exceptionHandling().accessDeniedPage("/error403");
		http.authorizeRequests().antMatchers("/").permitAll();
		http.authorizeRequests().antMatchers("/admin/locationType/index").access("hasAnyRole('ROLE_ADMIN', 'ROLE_STAFF')");
		http.authorizeRequests().antMatchers("/admin/locationType/add").access("hasAnyRole('ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/admin/**").access("hasAnyRole('ROLE_ADMIN', 'ROLE_STAFF', 'ROLE_POSTER')");
    	
    }
	
}