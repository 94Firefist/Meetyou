package com.test.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.test.dto.CategoryDTO;
import com.test.dto.CityTypeDTO;
import com.test.dto.GroupDTO;
import com.test.dto.MemberDTO;

public interface IMemberDAO
{
	public MemberDTO login(HashMap<String, String> loginMap);
	public String memberid(String id);
	public String idsearch(String userId);
	public ArrayList<CityTypeDTO> citytypelist();
	public String memberInsert(HashMap<String, Object> memberMap);
	public ArrayList<CategoryDTO> categoryList();
	public int addTAG(List<HashMap<String,Object>> list);
	public int tagSEQ();
	//1.회원 삭제 int memberDel(String member_id);
	public int memberDel(String member_id) throws SQLException, ClassNotFoundException;
	//2.회원출력 adminmemberList
	public ArrayList<MemberDTO> adminMemberList(String pageNum) throws SQLException, ClassNotFoundException;
	// 페이징처리 갯수
	public int memberPageCount();
	
	public String myprofile(String keynumber);
	
	// 해당 멤버의 Realid를 가져오는 메소드
	public MemberDTO getMemberOfRealid(String name);
	
	// 특정 멤버가 소속된 그룹리스트 가져오는 메소드
	public ArrayList<GroupDTO> getMemberGroupList(String keynumber) throws SQLException, ClassNotFoundException;
}
