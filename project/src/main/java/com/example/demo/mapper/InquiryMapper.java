package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.InquiryDto;

@Mapper
public interface InquiryMapper {
	ArrayList<InquiryDto> list();
	void writeOk(InquiryDto idto);
	void readnum(String id);
	InquiryDto content(String id);
	void updateOk(InquiryDto idto);
	void delete(String id);
	
}
