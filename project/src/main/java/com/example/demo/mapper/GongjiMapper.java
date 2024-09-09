package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.GongjiDto;

@Mapper
public interface GongjiMapper {
	void writeOk(GongjiDto gdto);
	ArrayList<GongjiDto> list();
	void readnum(String id);
	GongjiDto content(String id);
	void updateOk(GongjiDto gdto);
	void delete(String id);
	GongjiDto gongjiContent(String id);
}
