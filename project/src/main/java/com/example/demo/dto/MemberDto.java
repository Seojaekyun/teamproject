package com.example.demo.dto;

import java.util.List;

import lombok.Data;

@Data
public class MemberDto {
	private int id, level, previousLevel;
	private String userid, pwd, name, sung, lname, email, phone, writeday;
	private List<ReservationDto> reservations;
	
	
}