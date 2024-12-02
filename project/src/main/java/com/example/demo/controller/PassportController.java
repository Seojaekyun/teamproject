package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.example.demo.dto.PassportDto;
import com.example.demo.service.PassportService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PassportController {
	
	@Autowired
	private PassportService service;
	
	@GetMapping("/passport/passport")
    public String getNationalityOptions(Model model, @RequestParam String pnr) {
		List<PassportDto> nationalities = service.getAllNationalities();
		System.out.println("Received pnr: " + pnr);
		Integer reservationId = service.getReservationIdByPnr(pnr);
        model.addAttribute("nationalities", nationalities);
        model.addAttribute("reservationId", reservationId);
        model.addAttribute("pnr", pnr);
        System.out.println("예약번호:"+ reservationId);
        return "passport/passport"; // JSP 파일 이름
    }

	 @PostMapping("/select/selection")
	 public String submitInfos(@RequestParam Integer reservationId,
			 					@RequestParam String pnr,
			 					@RequestParam String nationality, 
			 					@RequestParam String gender,
			 					@RequestParam String birth, 
			 					@RequestParam String issuingCountry, 
			 					@RequestParam String passportnum, 
			 					@RequestParam String exdate, 
			 					@RequestParam int countryNumber, 
			 					@RequestParam String phoneNumber,
			 					@RequestParam(required = false) String email, HttpSession session) {

		 PassportDto passportDto =  new PassportDto();
		 	passportDto.setReservationId(reservationId);
	        passportDto.setNationality(nationality);
	        passportDto.setGender(gender);
	        passportDto.setBirth(birth);
	        passportDto.setIssuingCountry(issuingCountry);
	        passportDto.setPassportNum(passportnum);
	        passportDto.setExDate(exdate);
	        passportDto.setCountryNumber(countryNumber);
	        passportDto.setPhoneNumber(phoneNumber);
	        passportDto.setEmail(email);
	        System.out.println("Received Passport DTO: " + passportDto);
	        System.out.println("Nationality: " + passportDto.getNationality());
	        System.out.println("Gender: " + passportDto.getGender());
	        System.out.println("Birth: " + passportDto.getBirth());	        
	        service.submitInfos(passportDto);
	        
	        session.setAttribute("passportDto", passportDto);

	        
	       return "/select/selection?pnr=" + pnr;
	 }
	 

}
