package com.example.demo.service;

import java.util.List;

import org.springframework.ui.Model;

import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface MemberService {
	public String id_verification();
	public String member();
	public String useridCheck(String userid);
	public String memberOk(MemberDto mdto);
	public List<MemberDto> getAllMembers();
	public String rlist(HttpSession session, HttpServletRequest request, Model model);
	public MemberDto getMemberDetails(String userid);
	public String searchUserId(MemberDto mdto);
	void pwdSearch(MemberDto mdto, Model model) throws Exception; // 변경된 메서드 시그니처
	String id_verification(HttpSession session, Model model);

 // 비밀번호 검색 메서드 정의

	public boolean id_delete(String userid, String password);
	String showRecoveryRequestPage(HttpSession session, Model model);
	public void updateMemberLevel(String userid, int i);
	public boolean checkPassword(String userid, String password);

	int getCurrentLevel(String userid);
	void updatePreviousLevel(String userid, int currentLevel);
	 boolean changePassword(String userid, String oldPwd, String newPwd);
	    void editEmail(String userid, String email);
	    void editPhone(String userid, String phone);
    
	

	public String myInq(HttpSession session, HttpServletRequest request, Model model);
	
}


