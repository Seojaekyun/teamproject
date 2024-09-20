package com.example.demo.dto;

import lombok.Data;

@Data
public class AirportsDto {
    private int id;                
    private String iataCode;      
    private String airportName;      
    private String city;            
    private String country;         
    private String timezone;
    private String detailedCity;
}
