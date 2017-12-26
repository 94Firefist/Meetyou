package com.test.admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.admin.GroupDTO;

public interface IGroupDAO
{
	//1.그룹리스트 출력
	public ArrayList<GroupDTO> group_List(HashMap<String, String> stMap) throws SQLException, ClassNotFoundException;
	
	//2.그룹전체 리스트 페이지 처리
	public int groupCount() throws SQLException, ClassNotFoundException;
	
	//3.그룹 삭제 
	//public int groupDel(String groupid) throws SQLException, ClassNotFoundException;
	
	
	
}
