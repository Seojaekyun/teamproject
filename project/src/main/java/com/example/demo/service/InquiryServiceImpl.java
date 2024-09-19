package com.example.demo.service;

import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.StateCountDto;
import com.example.demo.mapper.InquiryMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Qualifier("is")
public class InquiryServiceImpl implements InquiryService {

    @Autowired
    private InquiryMapper mapper;
    
    @Override
    public String list(HttpServletRequest request, Model model) {
        ArrayList<InquiryDto> ilist = mapper.list();
        model.addAttribute("ilist", ilist);
        return "/inquiry/list";
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
    public String content(HttpServletRequest request, Model model) {
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
    public String inquiryList(HttpServletRequest request, Model model) {
        // 모든 문의 리스트 조회
        ArrayList<InquiryDto> ilist = mapper.list();
        model.addAttribute("ilist", ilist);
        
        // State별 문의 수 조회
        List<StateCountDto> countsList = mapper.listCountsPerState();
        
        // 디버깅: countsList 내용 출력
        System.out.println("countsList size: " + countsList.size());
        for (StateCountDto entry : countsList) {
            System.out.println("State: " + entry.getState() + ", Count: " + entry.getCount());
        }
        
        // JSP에 countsList 전달
        model.addAttribute("countsList", countsList);
        
        return "/admin/inquiryList";
    }



	@Override
	public String inquiryContent(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
        InquiryDto idto = mapper.content(id);
        idto.setContent(idto.getContent().replace("\\r\\n", "<br>"));
        model.addAttribute("idto", idto);
        return "/admin/inquiryContent";
	}
    
}