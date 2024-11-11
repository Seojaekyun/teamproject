package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dto.PassportDto;
import com.example.demo.service.PassportService;

@Controller
public class PassportController {
	
	@Autowired
	private PassportService service;
	
	@RequestMapping("/passport/passport")
	public String passport()
	{
		return "/passport/passport";
	}
	
	@GetMapping("/passport/passport")
    public String getNationalityOptions(Model model) {
        List<PassportDto> nationalities = service.getAllNationalities();
        model.addAttribute("nationalities", nationalities);
        return "passport/passport"; // JSP 파일 이름
    }

}
