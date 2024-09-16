package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.InquiryDto;

@Mapper
public interface MainMapper {
	ArrayList<InquiryDto> ilist();
	
	
}
