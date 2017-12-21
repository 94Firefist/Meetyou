package com.test.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class CategoryDAO implements ICategoryDAO
{

	// 인터페이스 자료형을 속성으로 구성
	private DataSource dataSource;

	// setter 구성
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public ArrayList<CategoryDTO> catLists() throws SQLException, ClassNotFoundException
	{
		ArrayList<CategoryDTO> result = new ArrayList<CategoryDTO>();

		Connection conn = dataSource.getConnection();
		String sql = "SELECT CATEGORY_CONTENT FROM TBL_CATEGORY";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			CategoryDTO dto = new CategoryDTO();
			dto.setCategoryContent(rs.getString("CATEGORY_CONTENT"));

			result.add(dto);
		}

		return result;
	}

	@Override
	public ArrayList<CategoryDTO> mbcatLists() throws SQLException, ClassNotFoundException
	{
		ArrayList<CategoryDTO> result = new ArrayList<CategoryDTO>();

		Connection conn = dataSource.getConnection();
		String sql = "";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			CategoryDTO dto = new CategoryDTO();
			dto.setCategoryContent(rs.getString("CATEGORY_CONTENT"));

			result.add(dto);
		}

		return result;
	}

	@Override
	public ArrayList<CategoryDTO> grcatLists() throws SQLException, ClassNotFoundException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<CategoryDTO> evecatLists() throws SQLException, ClassNotFoundException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int catAdd(CategoryDTO employee) throws SQLException, ClassNotFoundException
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int catRemove(String employeeId) throws SQLException, ClassNotFoundException
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int catModify(CategoryDTO employee) throws SQLException, ClassNotFoundException
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CategoryDTO catSearch(String employeeId) throws SQLException, ClassNotFoundException
	{
		// TODO Auto-generated method stub
		return null;
	}

	

	
	
	
}
