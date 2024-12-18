package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dto.MemberDto;
import com.example.demo.mapper.MemberMapper;
import com.example.demo.service.MemberService;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	
	
	@Autowired
	@Qualifier("ms2")
	private MemberService service;
	@Autowired
	private MemberMapper mapper;
	
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


	@RequestMapping("/member/myInq")
	public String myInq(HttpSession session, HttpServletRequest request, Model model) {
		return service.myInq(session, request, model);
	}
	
	@RequestMapping("/member/myRev")
	public String myRev(HttpSession session, HttpServletRequest request, Model model) {
		return service.myRev(session, request, model);
	}
	
	@RequestMapping("/review/delete")
	public String reviewDelete(HttpServletRequest request) {
		return service.reviewDelete(request);
	}
	
	@RequestMapping("/member/memberView")
	public String memberView(HttpServletRequest request, HttpSession session, Model model) {
		if (session.getAttribute("userid") == null) {
			return "redirect:/member/login";
		}
		else {
			String err = request.getParameter("err");
			String userid = session.getAttribute("userid").toString();
			// Service 계층을 통해 회원 정보 가져오기
			
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
		}
		else {
			model.addAttribute("userid", userid);
			return "/member/useridSearch";
		}
	}
	
	@RequestMapping("/member/usForm")
	public String usForm(Model model) {
		return "/member/usForm";
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
	
	@GetMapping("/member/id_verification")
	public String idVerification(HttpSession session, Model model) {
		return service.id_verification(session, model);
	}
	
	@RequestMapping("/member/id_delete")
	public String idDelete(@RequestParam String userid,
			@RequestParam String password, Model model) {
		// 비밀번호 확인 로직 수행
		boolean isPasswordCorrect = service.id_delete(userid, password);
		
		if (isPasswordCorrect) {
			// 현재 회원의 level을 가져옴
			int currentLevel = service.getCurrentLevel(userid);
			System.out.println("Updating previous_level for user: " + userid + " with level: " + currentLevel);
			service.updatePreviousLevel(userid, currentLevel);  // previous_level 업데이트
			service.updateMemberLevel(userid, 3);  // level을 3으로 업데이트 (탈퇴 신청)
			// 팝업과 함께 페이지 리다이렉트
			model.addAttribute("popupMessage", "탈퇴 신청이 완료되었습니다.");
			return "redirect:/member/memberView";  // 탈퇴 후 memberView로 리다이렉트
		}
		else {
			// 비밀번호 오류 시 처리 로직
			model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
			return "/member/recovery_request";  // 다시 비밀번호 확인 페이지로 돌아감
		}
	}
	
	@GetMapping("/member/recovery_request")
	public String showRecoveryRequestPage(HttpSession session, Model model) {
		return service.showRecoveryRequestPage(session, model);
	}
	
	@PostMapping("/member/pwdCheck")
	public String pwdCheck(@RequestParam String userid,
			@RequestParam String password, Model model) {
		// 비밀번호 확인 로직 수행
		boolean isPasswordCorrect = service.checkPassword(userid, password);
		if (isPasswordCorrect) {
			service.updateMemberLevel(userid, 5);
			// 팝업과 함께 페이지 리다이렉트
			model.addAttribute("popupMessage", "복구 신청이 완료되었습니다.");
			return "redirect:/member/memberView";  // 확인 후 memberView로 리다이렉트
		}
		else {
			// 비밀번호 오류 시 처리 로직
			model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
			return "/member/recovery_request";  // 다시 비밀번호 확인 페이지로 돌아감
		}
	}
	
	@PostMapping("/member/pwdChg")
	public String changePassword(HttpSession session, @RequestParam String oldPwd, @RequestParam String pwd, Model model, RedirectAttributes redirectAttributes) {
		String userid = (String) session.getAttribute("userid");
		boolean isChanged = service.changePassword(userid, oldPwd, pwd);
		if (!isChanged) {
			redirectAttributes.addFlashAttribute("message", "기존 비밀번호가 일치하지 않습니다.");
		}
		else {
			redirectAttributes.addFlashAttribute("message", "새 비밀번호로 변경이 완료되었습니다.");
		}
		// 리다이렉트 후 쿼리 파라미터로 메시지 전달
		return "redirect:/member/memberView";
	}
	
	@PostMapping("/member/emailEdit")
	public String editEmail(HttpSession session, @RequestParam String email) {
		String userid = (String) session.getAttribute("userid");
		service.editEmail(userid, email);
		return "redirect:/member/memberView";
	}
	
	@PostMapping("/member/phoneEdit")
	public String editPhone(HttpSession session, @RequestParam String phone) {
		String userid = (String) session.getAttribute("userid");
		service.editPhone(userid, phone);
		return "redirect:/member/memberView";
	}
	
	@RequestMapping("/member/reForm")
	public String reForm() {
		return "/member/reForm";
	}
	
	@RequestMapping("/member/reMember")
	public String reMember(MemberDto mdto, Model model) {
		mapper.reMember(mdto);  // 예시: updateMember는 Mapper에 정의된 메서드
		// 데이터 처리 후 다시 뷰로 이동
		return "/member/reMember";  // 작업 완료 후 리다이렉트 처리
	}
	
	
}