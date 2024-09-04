package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.GongjiDto;

@Mapper
public interface GongjiMapper {
	void writeOk(GongjiDto gdto);
	
}
