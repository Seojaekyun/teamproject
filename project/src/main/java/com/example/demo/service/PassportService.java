package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.PassportDto;

public interface PassportService {

	List<PassportDto> getAllNationalities();
	void submitInfos(PassportDto passportDto);

	Integer getReservationIdByPnr(String pnr);

}
