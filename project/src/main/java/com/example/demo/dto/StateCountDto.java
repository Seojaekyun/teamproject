package com.example.demo.dto;

import lombok.Data;

@Data
public class StateCountDto {
    private int state;
    private int count;
    
    @Override
    public String toString() {
        return "StateCountDto(state=" + state + ", count=" + count + ")";
    }
}