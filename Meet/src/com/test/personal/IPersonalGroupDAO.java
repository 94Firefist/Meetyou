package com.test.personal;

import java.util.ArrayList;
import java.util.HashMap;

public interface IPersonalGroupDAO
{
	//개인페이지의 일반회원, 운영진인 그룹리스트 뿌리기 
	public ArrayList<PersonalGroupDTO> groupList(String userNumber);
	
	//개인페이지의 일반회원, 운영진인 그룹리스트 뿌리기 (비밀그룹)
	public ArrayList<PersonalGroupDTO> groupList_secret(String userNumber);
	
	//개인페이지의 그룹장인 그룹리스트 뿌리기 
	public ArrayList<PersonalGroupDTO> groupList_owner(String userNumber);
	
	//개인페이지의 그룹장인 그룹리스트 뿌리기 (비밀그룹)
	public ArrayList<PersonalGroupDTO> groupList_owner_secret(String userNumber);
	
	//그룹 탈퇴 기능
	public void groupOut(HashMap<String, Object> hashMap);
	
	//그룹 비공개 기능
	public void groupNoopen(HashMap<String, Object> hashMap);
	
	//그룹 공개기능
	public void groupOpen(HashMap<String, Object> hashMap);
}
