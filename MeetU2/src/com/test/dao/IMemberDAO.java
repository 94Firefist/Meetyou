package com.test.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.test.dto.GroupDTO;
import com.test.dto.MemberDTO;

public interface IMemberDAO
{

	// 해당 멤버의 Realid를 가져오는 메소드
	public MemberDTO getMemberOfRealid(String name);
	
	// 특정 멤버가 소속된 그룹리스트 가져오는 메소드
	public ArrayList<GroupDTO> getMemberGroupList(String keynumber) throws SQLException, ClassNotFoundException;
	
	
}
