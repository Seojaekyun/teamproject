package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.ReviewDto;

@Mapper
public interface ReviewMapper {
	void writeOk(ReviewDto redto);
	void reviewReadnum(String id);
	void updateOk(ReviewDto redto);
	void delete(String id);
	ReviewDto reviewContent(String id);
	int getTotalCount();
	List<ReviewDto> reviewList(@Param("offset") int offset, @Param("limit") int limit);
	List<ReviewDto> getMyRev(String userid);
	List<ReviewDto> relist();
	
	
}