package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.util.WebUtils;

import com.example.demo.dto.MemberDto;
import com.example.demo.mapper.LoginMapper;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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

		@Override
		public String loginOk(MemberDto mdto, HttpSession session,
		                      HttpServletRequest request,
		                      HttpServletResponse response) {
		    String name = mapper.loginOk(mdto);
		    
		    if (name != null) {
		        // 로그인 성공 시 세션에 사용자 정보 저장
		        session.setAttribute("userid", mdto.getUserid());
		        session.setAttribute("name", name);

		        // 메인 페이지로 리다이렉트
		        return "redirect:/main/index";
		    } else {
		        // 로그인 실패 시 로그인 페이지로 리다이렉트 (에러 메시지 포함)
		        return "redirect:/login/login?err=1";
		    }
		}

		
		@Override
		public String logout(HttpSession session)
		{
			session.invalidate();
			return "redirect:/main/index";
		}
}
