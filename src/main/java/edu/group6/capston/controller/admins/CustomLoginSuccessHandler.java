package edu.group6.capston.controller.admins;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import edu.group6.capston.models.CustomUserDetails;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.impls.UserServiceImpl;
 
@Component
public class CustomLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
 
    @Autowired
    private UserServiceImpl userService;
    
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
    	CustomUserDetails userDetails =  (CustomUserDetails) authentication.getPrincipal();
        Users user = userDetails.getUser();
        if (user.getFailedAttempt() > 0) {
            userService.resetFailedAttempts(user.getUsername());
        }
        if(user.getRole().getRoleId().equals("CUSTOMER")) {
        	user = userService.findByUsername(user.getUsername());
			request.getSession().setAttribute("userSession", user);
        	response.sendRedirect(request.getContextPath() + "/public/index");
        }else {
        	response.sendRedirect(request.getContextPath() + "/admin/index");
            super.onAuthenticationSuccess(request, response, authentication);
        }
    }
     
}
