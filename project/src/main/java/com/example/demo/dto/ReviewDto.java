package com.example.demo.dto;

import lombok.Data;

@Data
public class ReviewDto {
	private int id, readnum;
	private String title, content, writeday, name;
	
	
}