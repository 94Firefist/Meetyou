package com.test.personal;

import java.util.ArrayList;
import java.util.HashMap;

public interface IPersonalControlDAO
{
	//나의 정보리스트
	public PersonalControlDTO controlList(String keyNumber);
	
	//나의 관심사리스트 
	public ArrayList<PersonalControlDTO> controlInterestList(String keyNumber);
	
	//관심사의 모든 정보 가져오기 
	public ArrayList<PersonalControlDTO> interestList();
	
	//지역의 모든 정보 가져오기 
	public ArrayList<PersonalControlDTO> cityList();
	
	//나의 정보 수정하기 
	public void controlMyinfo(HashMap<String, Object> hashmap);
	
	//나의 특정 관심사 삭제하기 
	public void controlMyinterestRemove(HashMap<String, Object> hashmap);
	
	//나의 특정 관심사 수정하기 
	public void controlMyinterestModify(HashMap<String, Object> hashmap);
	
	//나의 특정 관심사 추가하기 
	public void controlMyinterestInsert(HashMap<String, Object> hashmap);
}
