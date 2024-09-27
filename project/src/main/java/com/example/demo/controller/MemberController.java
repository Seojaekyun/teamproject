package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.MemberDto;
import com.example.demo.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	
	
	@Autowired
	@Qualifier("ms2")
	private MemberService service;
	
	@RequestMapping("/member/member")
	public String member() {
		return service.member();
	}
	
	@RequestMapping("/member/useridCheck")
	public @ResponseBody String useridCheck(HttpServletRequest request) {
		String userid=request.getParameter("userid");
		return service.useridCheck(userid);
	}
	
	@RequestMapping("/member/memberOk")
	public String memberOk(MemberDto mdto) {
		return service.memberOk(mdto);
	}
	
	@RequestMapping("/reserve/list")
	public String rlist(HttpSession session, HttpServletRequest request, Model model) {
		return service.rlist(session, request, model);
	}
	

    @RequestMapping("/member/memberView")
    public String memberView(HttpServletRequest request,
                             HttpSession session,
                             Model model) {
        if (session.getAttribute("userid") == null) {
            return "redirect:/member/login";
        } else {
            String err = request.getParameter("err");
            String userid = session.getAttribute("userid").toString();

            // Service 계층을 통해 회원 정보 가져오기
            MemberDto mdto = service.getMemberDetails(userid);

            model.addAttribute("mdto", mdto);
            model.addAttribute("err", err);
            return "/member/memberView";
        }
    }
	
	
}