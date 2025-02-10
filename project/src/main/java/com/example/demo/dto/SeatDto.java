package com.example.demo.dto;

import lombok.Data;

@Data
public class SeatDto {
    private int seatId;
    private String seatNumber;
    private SeatClass seatClass;
    private double surcharge;
    private boolean available; // 필드 이름 변경
}
