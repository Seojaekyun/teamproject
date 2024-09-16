package com.example.demo.dto;

import lombok.Data;

@Data
public class AirportsDto {
	private int id;                
    private String airport_code;      
    private String airport_name;      
    private String city;            
    private String country;         
    private String timezone;
    private String detailed_city;
}
