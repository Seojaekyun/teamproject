package com.example.demo.dto;

import lombok.Data;

@Data
public class InquiryDto {
	private int id, readnum, state, answer;
	private String userid, title, content, writeday, pwd, answertext;
	
}
