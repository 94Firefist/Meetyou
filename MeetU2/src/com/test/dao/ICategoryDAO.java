package com.test.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.test.dto.ACategoryDTO;

/*
 	categoryLists() 카테고리 컨텐츠 리스트 출력하는 메소드
 	catSearch() 	카테고리 컨텐츠 검색하는 메소드
 	catAdd() 		카테고리 컨텐츠 삽입하는 메소드
 	catRemove() 	카테고리 컨텐츠 삭제하는 메소드
 	catModify() 	카테고리 컨텐츠 수정하는 메소드
 */

public interface ICategoryDAO
{
	public ArrayList<ACategoryDTO> catLists() throws SQLException, ClassNotFoundException;
	public ArrayList<ACategoryDTO> mbcatLists() throws SQLException, ClassNotFoundException;
	public ArrayList<ACategoryDTO> grcatLists() throws SQLException, ClassNotFoundException;
	public ArrayList<ACategoryDTO> evecatLists() throws SQLException, ClassNotFoundException;
	
	public int catAdd(ACategoryDTO employee) throws SQLException, ClassNotFoundException;
  	public int catRemove(String employeeId) throws SQLException, ClassNotFoundException;
  	public int catModify(ACategoryDTO employee) throws SQLException, ClassNotFoundException;
  	public ACategoryDTO catSearch(String employeeId) throws SQLException, ClassNotFoundException;
}
