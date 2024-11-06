package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.SelectDto;
import com.example.demo.service.SelectService;


@Controller
public class SelectController {
	
	@Autowired
	private SelectService selectService;
	
	@GetMapping("/select/selection")
	public String getReservationDetails(
			@RequestParam("pnr") String pnr,
			@RequestParam("sung") String sung,
			@RequestParam("name") String name, 
			@RequestParam("date") String date,
			Model model) {
		// 서비스에서 예약 상세 정보 가져오기
		List<SelectDto> reservationList = selectService.getReservationDetails(pnr, sung, name, date);
		
		// JSP로 전달할 데이터 설정
		model.addAttribute("reservationList", reservationList);
		
		return "select/selection"; // selection.jsp로 이동
	}
	
	
}