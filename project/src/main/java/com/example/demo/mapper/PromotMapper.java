package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.example.demo.dto.PromotDto;

@Mapper
public interface PromotMapper {

	void addPromot(PromotDto pdto);
	List<PromotDto> promotList();
	PromotDto promotContent(String id);
	
	
	
}