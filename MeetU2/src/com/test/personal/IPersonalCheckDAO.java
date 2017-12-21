package com.test.personal;

import java.util.HashMap;

public interface IPersonalCheckDAO
{
	// 페이지 주인 공개여부
	public PersonalCheckDTO hostCheckList(String hostId);
	
	// 페이지 주인, 들어간 사람 (친구여부) 
	public int friendCheck(HashMap<String, Object> hashmap);
	
	// 주인, 손님 같은 그룹 수
	public int sameGroupCount(HashMap<String, Object> sameGroupCount);
	
	// 주인, 손님 같은 그룹리스트(그룹번호)
	//public ArrayList<PersonalCheckDTO> sameGroupCheck(HashMap<String, Object> sameGroup);
	
	// 개인주최 이벤트 공개여부
	//public ArrayList<PersonalCheckDTO> hostEventCheck(String hostId);
		
	
}
