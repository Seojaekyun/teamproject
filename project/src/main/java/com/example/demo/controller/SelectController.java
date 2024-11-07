package com.example.demo.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        List<SelectDto> reservationList = selectService.getReservationDetails(pnr, sung, name, date);
        model.addAttribute("reservationList", reservationList);
        return "select/selection"; // selection.jsp로 이동
    }


    @ResponseBody
    @GetMapping("/api/check-reservation")
    public Map<String, Boolean> checkReservation(
            @RequestParam("pnr") String pnr,
            @RequestParam("sung") String sung,
            @RequestParam("name") String name,
            @RequestParam("date") String date) {
        
        System.out.println("Received parameters - PNR: " + pnr + ", 성: " + sung + ", 이름: " + name + ", 날짜: " + date);

        List<SelectDto> reservationList = selectService.getReservationDetails(pnr, sung, name, date);
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", reservationList != null && !reservationList.isEmpty());
        return response;
    }
}
