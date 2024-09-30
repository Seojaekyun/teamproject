package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.MemberDto;

@Mapper
public interface MemberMapper {
	public String useridCheck(String userid);
	public void memberOk(MemberDto mdto);
	ArrayList<MemberDto> list();
	public static List<MemberDto> selectAllMembers() {
		return null;
	}
	public int getTotalMemberCount();
	public ArrayList<MemberDto> getMemberList(int offset, int itemsPerPage);
	public MemberDto getMemberById(String userId);
    public String useridSearch(MemberDto mdto);
    public MemberDto pwdSearch(MemberDto mdto);
    public void updatePassword(MemberDto mdto);
    public void updateMemberLevelByUserid(String userid);
	public String getPasswordByUserid(String userid);
	List<MemberDto> selectMembers();
	int getCurrentLevel(String userid); 
    void updatePreviousLevel(@Param("userid") String userid, @Param("previousLevel") int previousLevel);
    void updateMemberLevel(@Param("userid") String userid, @Param("level") int level);

	
}