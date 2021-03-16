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
//    	auth.jdbcAuthentication().dataSource(dataSource)
//		.usersByUsernameQuery("select username, password from users where username=?")
//		.authoritiesByUsernameQuery(
//				"select username, concat('ROLE_',u.roleId) role from users where username=?")
//		.passwordEncoder(bCryptPasswordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/public/**").permitAll() // Cho phép tất cả mọi người truy cập vào 2 địa chỉ này
                .anyRequest().authenticated() // Tất cả các request khác đều cần phải xác thực mới được truy cập
                .and().csrf()
        		.disable()
        		.formLogin()
        		.loginPage("/auth/login")
                //.formLogin() // Cho phép người dùng xác thực bằng form login
                .defaultSuccessUrl("/admin/index")
                .failureUrl("/auth/login?msg=Error")
                .permitAll() // Tất cả đều được truy cập vào địa chỉ này
                .and()
                .logout()
                .logoutUrl("/auth/logout")
        		.logoutSuccessUrl("/auth/login") // Cho phép logout
                .permitAll()
                .and().exceptionHandling().accessDeniedPage("/error403");
        		
        http.authorizeRequests().antMatchers("/").permitAll();
		http.authorizeRequests().antMatchers("/admin/locationType/index").access("hasAnyRole('ROLE_ADMIN', 'ROLE_STAFF')");
		http.authorizeRequests().antMatchers("/admin/locationType/add").access("hasAnyRole('ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/admin/**").access("hasAnyRole('ROLE_ADMIN', 'ROLE_STAFF', 'ROLE_POSTER')");
    }
	
	/*
	@Autowired
	private DataSource dataSource;
	
	/*
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("select username, password from users where username=?")
				.authoritiesByUsernameQuery(
						"select username, concat('ROLE_',u.roleId) role from users where username=?")
				.passwordEncoder(bCryptPasswordEncoder());
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("admin").password("123456").roles("ADMIN");
		auth.inMemoryAuthentication().withUser("user").password("123").roles("USER");
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
		http.authorizeRequests().antMatchers("/admin/cat/index").access("hasAnyRole('ROLE_ADMIN', 'ROLE_STAFF')");
		http.authorizeRequests().antMatchers("/admin/cat/add").access("hasAnyRole('ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/admin/user/add").access("hasAnyRole('ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/admin/**").access("hasAnyRole('ROLE_ADMIN', 'ROLE_STAFF', 'ROLE_POSTER')");
	}
	*/
//	@Bean
//	public BCryptPasswordEncoder bCryptPasswordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
	
}