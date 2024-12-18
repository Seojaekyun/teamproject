package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.ReviewDto;
import com.example.demo.mapper.ReviewMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("res")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper mapper;
	@Override
	public String list(HttpServletRequest request, Model model) {
		String pageParam = request.getParameter("page");
	    int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;

	    int itemsPerPage = 10;  // 페이지당 항목 수
	    int offset = (currentPage - 1) * itemsPerPage;  // 시작 인덱스 계산

	    // 전체 공지사항 수 가져오기
	    int totalItems = mapper.getTotalCount();

	    // 페이징 적용하여 리스트 가져오기
	    List<ReviewDto> relist = mapper.list(offset, itemsPerPage);

	    // 전체 페이지 수 계산
	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

	    // 모델에 필요한 데이터 추가
	    model.addAttribute("relist", relist);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("totalPages", totalPages);
		
		return "/review/list";
	}
	
	@Override
	public String write() {
		return "/review/write";
	}
	
	@Override
	public String writeOk(ReviewDto redto, HttpSession session) {
		String userId=(String) session.getAttribute("userid");
		if (userId==null) {
			return "redirect:/login/login";
		}
		else {
			mapper.writeOk(redto);
			return "redirect:/review/list";
		}
	}

	@Override
	public String reviewReadnum(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.reviewReadnum(id);
		
		return "redirect:/review/content?id="+id;
	}

	@Override
	public String content(HttpServletRequest request, HttpSession session, Model model) {
		String id=request.getParameter("id");
		ReviewDto redto=mapper.content(id);
		
		redto.setContent(redto.getContent().replace("\r\n", "<br>"));
		
		model.addAttribute("redto", redto);
		
		return "/review/content";
	}

	@Override
	public String update(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		ReviewDto redto=mapper.content(id);
		
		model.addAttribute("redto", redto);
		
		return "/review/update";
	}

	@Override
	public String updateOk(ReviewDto redto) {
		mapper.updateOk(redto);
		return "redirect:/review/content?id="+redto.getId();
	}

	@Override
	public String reviewList(HttpServletRequest request, Model model) {
		String pageParam = request.getParameter("page");
	    int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;

	    int itemsPerPage = 10;  // 페이지당 항목 수
	    int offset = (currentPage - 1) * itemsPerPage;  // 시작 인덱스 계산

	    // 전체 공지사항 수 가져오기
	    int totalItems = mapper.getTotalCount();

	    // 페이징 적용하여 리스트 가져오기
	    List<ReviewDto> relist = mapper.list(offset, itemsPerPage);

	    // 전체 페이지 수 계산
	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

	    // 모델에 필요한 데이터 추가
	    model.addAttribute("relist", relist);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("totalPages", totalPages);
		
		return "/admin/reviewList";
	}

	@Override
	public String reviewContent(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		ReviewDto redto=mapper.reviewContent(id);
		
		redto.setContent(redto.getContent().replace("\r\n", "<br>"));
		
		model.addAttribute("redto", redto);		
		
		return "/admin/reviewContent";
	}
	
}