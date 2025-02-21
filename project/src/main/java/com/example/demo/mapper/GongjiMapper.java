package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.GongjiDto;

@Mapper
public interface GongjiMapper {
	void writeOk(GongjiDto gdto);
	List<GongjiDto> list(@Param("offset") int offset, @Param("limit") int limit);
	void readnum(String id);
	void updateOk(GongjiDto gdto);
	void delete(String id);
	GongjiDto gongjiContent(String id);
	int getTotalCount();
	List<GongjiDto> gongjiList(@Param("offset") int offset, @Param("limit") int limit);
	
	
}