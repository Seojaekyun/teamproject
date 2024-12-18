package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.PromotDto;
import com.example.demo.dto.ReviewDto;
import com.example.demo.dto.StateCountDto;

@Mapper
public interface MainMapper {
	ArrayList<InquiryDto> ilist();
	List<StateCountDto> listCountsPerState();
	String loginOk(MemberDto mdto);
	List<PromotDto> promotList();
	List<PromotDto> plist();
	void readnum(String id);
	List<ReviewDto> relist();
	
	
}