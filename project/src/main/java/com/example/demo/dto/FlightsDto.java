package com.example.demo.dto;

import lombok.Data;

@Data
public class FlightsDto {
    private int flight_id;
    private String flight_number;
    private String departure_airport;
    private String arrival_airport;
    private String departure_time;
    private String arrival_time;
}