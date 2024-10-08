package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.MemberDto;

@Mapper
public interface LoginMapper {
	public String loginOk(MemberDto mdto);
	public String loginAdmin(MemberDto mdto);
	public MemberDto getMemberByUserId(String userid);
	
	
}