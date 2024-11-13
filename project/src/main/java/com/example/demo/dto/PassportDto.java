package com.example.demo.dto;

import lombok.Data;

@Data
public class PassportDto {
    private String countryNameEn;
    private String countryNameKr;
	private String nationality, gender, birth, issuingCountry, passportNum, exDate;
	private int reservationId, countryNumber;
	private String phoneNumber;
	private String email;
		
	}

