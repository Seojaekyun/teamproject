package com.example.demo.dto;

import lombok.Data;

@Data
public class SeatDto {
    private int seat_id, flight_id;
    private String seat_number;
    private int is_available;

    // Getters and setters
}
