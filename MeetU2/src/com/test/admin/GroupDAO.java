package com.test.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.sql.DataSource;

public class GroupDAO implements IGroupDAO
{
	// 인터페이스 자료형을 속성으로 구성
	private DataSource dataSource;

	// setter 구성
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public ArrayList<GroupDTO> group_List(HashMap<String, Integer> stMap) throws SQLException, ClassNotFoundException
	{
		/* 기본그룹 리스트 출력 */
		
		ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
		Connection conn = dataSource.getConnection();
		String sql = "SELECT ROWNUMBER, GROUP_ID, GROUP_NAME, GRLEADER_ID, GRCOUNT, CREDATE, CITY, CATEGORY, SEARCH" + 
					" FROM(SELECT ROWNUM AS ROWNUMBER, G.* FROM" + 
					" (SELECT LGROUP_ID AS GROUP_ID, GROUP_NAME" + 
					" , (SELECT LMEMBER_ID FROM GRLIST WHERE GRPOWER_ID='1' AND LGROUP_ID=T.LGROUP_ID) AS GRLEADER_ID" + 
					" , (SELECT COUNT(*) FROM GRLIST WHERE LGROUP_ID=T.LGROUP_ID) AS GRCOUNT" + 
					" , TO_CHAR(GROUP_CREDATE, 'YYYY-MM-DD') AS CREDATE" + 
					" , (SELECT CITY_NAME FROM CITY_TYPE WHERE CITYPE_ID = T.CITYPE_ID) AS CITY" + 
					" , (SELECT LISTAGG(CATEGORY_CONTENT, '/') WITHIN GROUP(ORDER BY LGROUP_ID)" + 
					"    FROM VGRCAT WHERE LGROUP_ID=T.LGROUP_ID GROUP BY LGROUP_ID) AS CATEGORY" + 
					" , (SELECT GRPUBLIC_NAME FROM GRPUBLIC WHERE T.PUBLIC_GR = GRPUBLIC_ID) AS SEARCH" + 
					" FROM TBL_GROUP T" + 
					" ORDER BY LGROUP_ID" +
					" )G)" + 
					" WHERE ROWNUMBER BETWEEN ? AND ? " + 
					" ORDER BY ROWNUMBER";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, stMap.get("startPage"));
		pstmt.setInt(2, stMap.get("countPage"));
		
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			GroupDTO dto = new GroupDTO();

			dto.setGroup_id(rs.getString("GROUP_ID"));
			dto.setMember_id(rs.getString("GRLEADER_ID"));
			dto.setGroup_name(rs.getString("GROUP_NAME"));
			dto.setGroup_memberCount(rs.getString("GRCOUNT"));
			dto.setGroup_credate(rs.getString("CREDATE"));
			dto.setGroup_citypeName(rs.getString("CITY"));
			dto.setGroup_category(rs.getString("CATEGORY"));
			dto.setPublic_gr(rs.getString("SEARCH"));
			
			result.add(dto);
		}
		
		return result;
	}

	@Override
	public int groupCount() throws SQLException, ClassNotFoundException
	{
		
		int result = 0;
		Connection conn = dataSource.getConnection();
		String sql = "SELECT COUNT(*) FROM TBL_GROUP";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		//값 받아오기
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result = rs.getInt(1);
		}
		
		return result;
		
		
	}

	@Override
	public int groupDel(String groupid) throws SQLException, ClassNotFoundException
	{
		// TODO Auto-generated method stub
		return 0;
	}
	

}
