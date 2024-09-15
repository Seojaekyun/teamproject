package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dto.MemberDto;
import com.example.demo.mapper.MemberMapper;

@Service
@Qualifier("ms2")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public String member() {
		return "/member/member";
	}
	
	@Override
	public String useridCheck(String userid) {
		return mapper.useridCheck(userid);
	}
	
	@Override
	public String memberOk(MemberDto mdto) {
		mapper.memberOk(mdto);
		return "/login/login";
	}
	
	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return null;
	}

	
}