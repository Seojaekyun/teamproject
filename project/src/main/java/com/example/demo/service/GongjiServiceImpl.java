package com.example.demo.service;

import java.util.List;

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
	@Override
	public String list(HttpServletRequest request, Model model) {
		String pageParam = request.getParameter("page");
	    int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;

	    int itemsPerPage = 10;  // 페이지당 항목 수
	    int offset = (currentPage - 1) * itemsPerPage;  // 시작 인덱스 계산

	    // 전체 공지사항 수 가져오기
	    int totalItems = mapper.getTotalCount();

	    // 페이징 적용하여 리스트 가져오기
	    List<GongjiDto> glist = mapper.list(offset, itemsPerPage);

	    // 전체 페이지 수 계산
	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

	    // 모델에 필요한 데이터 추가
	    model.addAttribute("glist", glist);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("totalPages", totalPages);
		
		return "/gongji/list";
	}
	
	@Override
	public String gongjiWrite() {
		return "/admin/gongjiWrite";
	}
	
	@Override
	public String gongjiWriteOk(GongjiDto gdto, HttpSession session) {
		mapper.writeOk(gdto);
		
		return "redirect:/admin/gongjiList";
	}

	@Override
	public String readnum(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.readnum(id);
		
		return "redirect:/event/content?id="+id;
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
		return "redirect:/admin/gongjiContent?id="+gdto.getId();
	}

	@Override
	public String delete(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.delete(id);
		
		return "redirect:/admin/gongjiList";
	}

	@Override
	public String gongjiContent(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		GongjiDto gdto=mapper.gongjiContent(id);
		
		gdto.setContent(gdto.getContent().replace("\r\n", "<br>"));
		
		model.addAttribute("gdto", gdto);		
		
		return "/admin/gongjiContent";
	}
	
	
}