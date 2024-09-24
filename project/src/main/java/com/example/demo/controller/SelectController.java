package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.FlightDto;
import com.example.demo.service.AdminService;
import com.example.demo.service.SelectService;


  @Controller public class SelectController {
  
  @Autowired
  
  @Qualifier("sc") private SelectService service;
  
  
  @GetMapping("/select/selection") 
  public String selection(@RequestParam String sung, @RequestParam String name, @RequestParam String date, @RequestParam String pnr, Model model) 
  {     // 예약 정보를 조회하는 서비스 메서드 호출
	    Reservation reservation = SelectService.findReservation(sung, name, date, pnr);
	    
	    // 조회한 결과를 모델에 추가
	    model.addAttribute("reservation", reservation);
	    
	   
	    return "/select/selection";} }

