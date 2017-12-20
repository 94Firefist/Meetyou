package com.test.personal;

import java.util.ArrayList;
import java.util.HashMap;

public interface IPersonalLeftbarDAO
{	
	// 이름
	public String memberName(String userNumber);
	
	// 친구 수
	public int friendCount(String userNumber);
	
	// 과거 meet U 수
	public int pastMeetU(String userNumber);
	
	// 관심 지역
	public ArrayList<PersonalLeftbarDTO> userCityList(String userNumber);
	
	// 관심사
	public ArrayList<PersonalLeftbarDTO> userTagList(String userNumber);
	
	// 개인 프로필 사진
	public String profilePhoto(String userNumber);
	
	// 프로필 사진 수정
	public void profilePhotoModify(HashMap<String, String> hashmap);
}
