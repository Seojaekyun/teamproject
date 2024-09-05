package com.example.demo.dto;

import lombok.Data;

@Data
public class MemberDto {
	
	private int id,sung;
	private String userid,pwd,name,email;
	private String phone,age;

}
