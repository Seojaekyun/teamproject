package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.PassportDto;
import com.example.demo.mapper.PassportMapper;
import com.example.demo.mapper.SelectMapper;


@Service
public class PassportServiceImpl implements PassportService {
	@Autowired
	private PassportMapper passportMapper;

	@Autowired
	private SelectMapper selectMapper;
	
	@Override
    public List<PassportDto> getAllNationalities() {
        List<PassportDto> nationalities = passportMapper.getAllNationalities();
        System.out.println("Retrieved Nationalities: " + nationalities);
        return nationalities;
    }
	
	@Override
	public Integer getReservationIdByPnr(String pnr) {
		return passportMapper.getReservationIdByPnr(pnr);
	}
	
	@Override
	public void submitInfos(PassportDto passportDto) {
		passportMapper.saveInfos(passportDto);
	}
	

}
