package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.LoginMapper;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService{
	
	 @Autowired
	    private LoginMapper mapper;

		@Override
		public String login(HttpServletRequest request,Model model) 
		{
			String err=request.getParameter("err");
			model.addAttribute("err",err);
			return "/login/login";
		}

}
