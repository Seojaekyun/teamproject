package com.example.demo.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.GongjiDto;
import com.example.demo.mapper.GongjiMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("gs")
public class GongjiServiceImpl implements GongjiService {
	@Autowired
	private GongjiMapper mapper;
	private SqlSession sqlSession;
	
	@Override
	public String list(HttpServletRequest request, Model model) {
		ArrayList<GongjiDto> glist=mapper.list();
		//System.out.println(glist);
		
		model.addAttribute("glist", glist);
		
		return "/gongji/list";
	}
	
	@Override
	public String write() {
		return "/gongji/write";
	}
	
	@Override
	public String writeOk(GongjiDto gdto, HttpSession session) {
		mapper.writeOk(gdto);
		
		return "redirect:/gongji/list";
	}

	@Override
	public String readnum(HttpServletRequest request) {
		String id=request.getParameter("id");
		//System.out.println(id);
		mapper.readnum(id);
		
		return "redirect:/gongji/content?id="+id;
	}

	@Override
	public String content(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		GongjiDto gdto=mapper.content(id);
		
		gdto.setContent(gdto.getContent().replace("\r\n", "<br>"));
		
		model.addAttribute("gdto", gdto);		
		
		return "/gongji/content";
	}

	@Override
	public String update(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		GongjiDto gdto=mapper.content(id);
		
		model.addAttribute("gdto", gdto);
		
		return "/gongji/update";
	}

	@Override
	public String updateOk(GongjiDto gdto) {
		mapper.updateOk(gdto);
		return "redirect:/gongji/content?id="+gdto.getId();
	}

	@Override
	public String delete(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.delete(id);
		
		return "redirect:/gongji/list";
	}
	

}