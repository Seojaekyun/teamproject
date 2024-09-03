package kr.co.board.dto;

import lombok.Data;

@Data
public class BoardDto {
	private int id, rnum;
    private String title, name, content, pwd, writeday;
}
