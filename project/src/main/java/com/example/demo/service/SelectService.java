package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.SelectDto;

public interface SelectService {
	List<SelectDto> getRsvDetails(String pnr, String sung, String name, String date);
	
	
}