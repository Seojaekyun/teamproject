package com.example.demo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.MemberDto;
import com.example.demo.mapper.MemberMapper;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private MemberMapper mapper;

	@Override
	public String adReserve() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String memberList(HttpServletRequest request, Model model) {
		ArrayList<MemberDto> mlist=mapper.list();
		//System.out.println(mlist);
		
		model.addAttribute("mlist", mlist);
		return "/admin/memberList";
	}
	

	

}
