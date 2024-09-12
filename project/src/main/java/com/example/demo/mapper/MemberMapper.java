package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.MemberDto;

@Mapper
public interface MemberMapper {
	
	public String useridCheck(String userid);
	public void memberOk(MemberDto mdto);
	ArrayList<MemberDto> list();

}
