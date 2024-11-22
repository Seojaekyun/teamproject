package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.PassportDto;

@Mapper
public interface PassportMapper {
	List<PassportDto> getAllNationalities();
	void saveInfos(PassportDto passportDto);

	Integer getReservationIdByPnr(String pnr);
}
