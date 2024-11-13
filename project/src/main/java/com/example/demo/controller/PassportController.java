package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.PassportDto;
import com.example.demo.service.PassportService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PassportController {
	
	@Autowired
	private PassportService service;
	
	
	@GetMapping("/passport/passport")
    public String getNationalityOptions(Model model, @RequestParam("pnr") String pnr) {
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
	 public String submitInfos(@RequestParam("reservationId") Integer reservationId,
			 					@RequestParam("pnr") String pnr,
			 					@RequestParam("nationality") String nationality, 
			 					@RequestParam("gender") String gender,
			 					@RequestParam("birth") String birth, 
			 					@RequestParam("issuingCountry") String issuingCountry, 
			 					@RequestParam("passportnum") String passportnum, 
			 					@RequestParam("exdate")String exdate, 
			 					@RequestParam("countryNumber")int countryNumber, 
			 					@RequestParam("phoneNumber")String phoneNumber,
			 					@RequestParam(value = "email", required = false) String email, HttpSession session) {

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
