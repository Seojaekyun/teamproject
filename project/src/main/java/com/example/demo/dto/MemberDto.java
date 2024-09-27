package com.example.demo.dto;

import java.util.List;

import lombok.Data;

@Data
public class MemberDto {
	private int id, level;
	private String userid,pwd,name,email;
	private String phone,writeday;
	private List<ReservationDto> reservations;
	
	private String sung,lname;
	
	private int leverl;
	
	
}