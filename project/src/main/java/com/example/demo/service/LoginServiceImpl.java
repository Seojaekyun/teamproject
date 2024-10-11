package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dto.MemberDto;
import com.example.demo.mapper.LoginMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginMapper mapper;
	
	@Override
	public String login(HttpServletRequest request, Model model) {
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		// 회원 정보 조회
		MemberDto member = mapper.getMemberByUserId(userid);
		
		// 사용자가 존재하는지 확인
		if (member == null) {
			model.addAttribute("err", "존재하지 않는 사용자입니다.");
			return "/login/login";
		}
		
		// level 값이 4인지 확인
		if (member.getLevel() == 4) {
			model.addAttribute("err", "로그인이 제한된 계정입니다.");
			return "/login/login";
		}
		
		// 비밀번호 일치 여부 확인
		if (!member.getPwd().equals(pwd)) {
			model.addAttribute("err", "비밀번호가 틀렸습니다.");
			return "/login/login";
		}
		
		// 로그인 성공
		request.getSession().setAttribute("user", member);
		return "redirect:/main";  // 로그인 후 메인 페이지로 이동
	}
	
	@Override
	public String loginAd(HttpServletRequest request, Model model) {
		String err=request.getParameter("err");
		model.addAttribute("err",err);
		return "/login/loginAd";
	}
	
	@Override
	public String loginOk(
			MemberDto mdto, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		// 회원 정보 조회 (userid로 회원 정보 가져옴)
		MemberDto member = mapper.getMemberByUserId(mdto.getUserid());
		if (member != null && member.getPwd().equals(mdto.getPwd())) {
			// level이 4인 경우 로그인 차단
			if (member.getLevel() == 4) {
				// 로그인 차단 메시지를 전달하고 로그인 페이지로 리다이렉트
				return "redirect:/login/login?err=levelRestricted";
			}
			// 로그인 성공 시 세션에 사용자 정보 저장
			session.setAttribute("userid", member.getUserid());
			session.setAttribute("name", member.getName());
			session.setAttribute("loggedInUser", member.getUserid());
			
			// 메인 페이지로 리다이렉트
			return "redirect:/main/index";
		}
		else {
			// 로그인 실패 시 로그인 페이지로 리다이렉트 (에러 메시지 포함)
			return "redirect:/login/login?err=invalid";
		}
	}
	
	@Override
	public String loginAdmin(
			MemberDto mdto, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		String name = mapper.loginAdmin(mdto);
		
		if (name != null) {
			// 로그인 성공 시 세션에 사용자 정보 저장
			session.setAttribute("userid", mdto.getUserid());
			session.setAttribute("name", name);
			
			// 메인 페이지로 리다이렉트
			return "redirect:/admin/index";
		}
		else {
			// 로그인 실패 시 로그인 페이지로 리다이렉트 (에러 메시지 포함)
			return "redirect:/login/loginAd?err=1";
		}
	}
	
	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/index";
	}
	
	
}