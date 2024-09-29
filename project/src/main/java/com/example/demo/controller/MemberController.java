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

            MemberDto mdto = service.getMemberDetails(userid);

            model.addAttribute("mdto", mdto);
            model.addAttribute("err", err);
            return "/member/memberView";
        }
    }

    @RequestMapping("/member/useridSearch")
    public String useridSearch(MemberDto mdto, Model model) {
        String userid = service.searchUserId(mdto);

        if (userid == null) {
            return "redirect:/member/usForm?err=1";
        } else {
            model.addAttribute("userid", userid);
            return "/member/useridSearch";
        }
    }
    
    @RequestMapping("/member/usForm")
    public String usForm(Model model) {
        return "/member/usForm"; // 반환할 JSP 뷰 이름
    }

    @RequestMapping("/member/psForm")
    public String psForm(HttpServletRequest request, Model model) {
        String err = request.getParameter("err");
        model.addAttribute("err", err);
        return "/member/psForm";
    }

    @RequestMapping("/member/pwdSearch")
    public String pwdSearch(MemberDto mdto, Model model) throws Exception {
        service.pwdSearch(mdto, model); // 모델을 서비스에서 처리
        return "/member/pwdSearch"; 
    }
    
    
}