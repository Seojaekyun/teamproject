package com.example.demo.service;

import com.example.demo.dto.InquiryDto;
import com.example.demo.mapper.InquiryMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
@Qualifier("is")
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	private InquiryMapper mapper;
	
	@Override
	public String list(HttpServletRequest request, Model model, Integer page) {
		if (page == null) {
			page = 1;  // 기본 페이지 값 설정
		}
		
		int itemsPerPage = 10;  // 페이지당 항목 수
		int offset = (page - 1) * itemsPerPage;  // 페이지에 따른 시작점 계산
		// 전체 문의 수 가져오기
		int totalItems = mapper.getInquiryCount();
		int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
		// 페이징된 문의 리스트 가져오기
		List<InquiryDto> ilist = mapper.list(offset, itemsPerPage);
		// 모델에 추가
		model.addAttribute("ilist", ilist);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("totalItems", totalItems);
		
		return "/inquiry/list";
	}
	
	@Override
	public String inquiryList(Model model, Integer page) {
		if (page == null) {
			page = 1;  // 기본 페이지 값 설정
		}
		
		int itemsPerPage = 20;  // 페이지당 항목 수
		int offset = (page - 1) * itemsPerPage;  // 페이지에 따른 시작점 계산
		
		// 전체 문의 수 가져오기
		int totalItems = mapper.getInquiryCount();
		int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
		
		// 페이징된 문의 리스트 가져오기
		List<InquiryDto> ilist = mapper.list(offset, itemsPerPage);
		
		// 모델에 추가
		model.addAttribute("ilist", ilist);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("totalItems", totalItems);
		
		return "/admin/inquiryList";
	}
	
	@Override
	public String write() {
		return "/inquiry/write";
	}
	
	@Override
	public String writeOk(InquiryDto idto, HttpSession session) {
		mapper.writeOk(idto);
		return "redirect:/inquiry/list";
	}
	
	@Override
	public String readnum(HttpServletRequest request) {
		String id = request.getParameter("id");
		mapper.readnum(id);
		return "redirect:/inquiry/content?id=" + id;
	}
	
	@Override
	public String content(HttpSession session, HttpServletRequest request, Model model) {
		String userid=(String)session.getAttribute("userid");
		if(userid!=null) {
			model.addAttribute(userid);
		}
		String id = request.getParameter("id");
		InquiryDto idto = mapper.content(id);
		idto.setContent(idto.getContent().replace("\\r\\n", "<br>"));
		model.addAttribute("idto", idto);
		
		return "/inquiry/content";
	}
	
	@Override
	public String update(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		InquiryDto idto = mapper.content(id);
		model.addAttribute("idto", idto);
		return "/inquiry/update";
	}
	
	@Override
	public String updateOk(InquiryDto idto) {
		mapper.updateOk(idto);
		return "redirect:/inquiry/content?id=" + idto.getId();
	}
	
	@Override
	public String delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		mapper.delete(id);
		return "redirect:/inquiry/list";
	}
	
	@Override
	public String inquiryContent(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		InquiryDto idto = mapper.content(id);
		idto.setContent(idto.getContent().replace("\\r\\n", "<br>"));
		model.addAttribute("idto", idto);
		return "/admin/inquiryContent";
	}
	
	@Override
	public String answer(int inquiryId, String answerText) {
		mapper.answer(inquiryId, answerText); // 답변 저장 로직 처리
		return "redirect:/admin/inquiryContent?id=" + inquiryId; // 저장 후 해당 문의 페이지로 리다이렉트
	}
	
	@Override
	public String updateAnswer(int inquiryId, String answerText) {
		mapper.updateAnswer(inquiryId, answerText); // 답변 수정 로직 처리
		return "redirect:/admin/inquiryContent?id=" + inquiryId; // 수정 후 해당 문의 페이지로 리다이렉트
	}
	
	
}