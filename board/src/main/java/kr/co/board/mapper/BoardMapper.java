package kr.co.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.board.dto.BoardDto;
import kr.co.board.dto.DatDto;

@Mapper
public interface BoardMapper {
	public ArrayList<BoardDto> list();
	public int getChong(int rec);
	public ArrayList<BoardDto> list(int index, int rec);
	public void writeOk(BoardDto bdto);
	public void rnum(String id);
	public BoardDto content(String id);
	public BoardDto update(String id);
	public boolean isPwd(int id, String pwd);
	public void updateOk(BoardDto bdto);
	public void delete(int id);
	public ArrayList<DatDto> dat(String id);
	public void datOk(DatDto ddto);
	public DatDto datUp(String id);
	public boolean isdatPwd(int id, String pwd);
	public void datupOk(DatDto ddto);
	public void datDel(DatDto ddto);
}
