package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.MemberDto;

public interface MemberService {
	public String member();
	public String useridCheck(String userid);
	public String memberOk(MemberDto mdto);
	public List<MemberDto> getAllMembers();
	
	
}
