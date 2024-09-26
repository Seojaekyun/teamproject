package com.example.demo.dto;

import lombok.Data;

@Data
public class SeatDto {
    private int seatId;
    private String seatNumber;
    private SeatClass seatClass;
    private boolean isAvailable;
}
