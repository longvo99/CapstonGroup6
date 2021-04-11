package edu.group6.capston.configs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import edu.group6.capston.controller.admins.CustomLoginFailureHandler;
import edu.group6.capston.controller.admins.CustomLoginSuccessHandler;
import edu.group6.capston.services.impls.UserServiceImpl;
 
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@Autowired
    private CustomLoginFailureHandler loginFailureHandler;
     
    @Autowired
    private CustomLoginSuccessHandler loginSuccessHandler;

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        // Password encoder, Ä‘á»ƒ Spring Security sá»­ dá»¥ng mÃ£ hÃ³a máº­t kháº©u ngÆ°á»�i dÃ¹ng
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth)
            throws Exception {
        auth.userDetailsService(userServiceImpl) // Cung cÃ¡p userservice cho spring security
            .passwordEncoder(bCryptPasswordEncoder()); // cung cáº¥p password encoder
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
		failureHandler(loginFailureHandler).
		successHandler(loginSuccessHandler).
		loginProcessingUrl("/auth/login").
		and().logout().
		logoutUrl("/auth/logout").
		logoutSuccessUrl("/auth/login").
		invalidateHttpSession(true).
		deleteCookies("JSESSIONID").
		and().exceptionHandling().accessDeniedPage("/error403");
		http.authorizeRequests().antMatchers("/").permitAll();
		http.authorizeRequests().antMatchers("/admin/location/add").access("hasAnyRole('ROLE_ADMIN', 'ROLE_POSTER', 'ROLE_STAFF', 'ROLE_CUSTOMER')");
		http.authorizeRequests().antMatchers("/admin/locationType/index").access("hasAnyRole('ROLE_ADMIN', 'ROLE_STAFF')");
		http.authorizeRequests().antMatchers("/admin/locationType/add").access("hasAnyRole('ROLE_ADMIN', 'ROLE_POSTER')");
		http.authorizeRequests().antMatchers("/admin/**").access("hasAnyRole('ROLE_ADMIN', 'ROLE_STAFF', 'ROLE_POSTER')");
		
		 
		
    }
    
}