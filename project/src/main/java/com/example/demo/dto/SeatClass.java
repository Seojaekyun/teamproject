package com.example.demo.dto;

public enum SeatClass {
    ECONOMY("일반석"),
    PREMIUM_ECONOMY("프레스티지석"),
    BUSINESS("비즈니스석"),
    FIRST_CLASS("일등석");

    private final String description;

    SeatClass(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
