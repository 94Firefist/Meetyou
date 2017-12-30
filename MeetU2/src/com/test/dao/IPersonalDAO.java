package com.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.test.dto.PersonalDTO;

public interface IPersonalDAO
{
	// 페이지 주인 공개여부
	public PersonalDTO hostCheckList(String hostId);
	
	// 페이지 주인, 들어간 사람 (친구여부) 
	public int friendCheck(HashMap<String, Object> hashmap);
	
	// 주인, 손님 같은 그룹 수
	public int sameGroupCount(HashMap<String, Object> sameGroupCount);
	
	// 주인, 손님 같은 그룹리스트(그룹번호)
	//public ArrayList<PersonalCheckDTO> sameGroupCheck(HashMap<String, Object> sameGroup);
	
	// 개인주최 이벤트 공개여부
	//public ArrayList<PersonalCheckDTO> hostEventCheck(String hostId);
	
	//나의 정보리스트
	public PersonalDTO controlList(String keyNumber);
	
	//나의 관심사리스트  
	public ArrayList<PersonalDTO> controlInterestList(String keyNumber);
	
	//관심사의 모든 정보 가져오기 
	public ArrayList<PersonalDTO> interestList();
	
	//지역의 모든 정보 가져오기 
	public ArrayList<PersonalDTO> cityList();
	
	//나의 정보 수정하기 
	public void controlMyinfo(HashMap<String, Object> hashmap);
	
	//나의 특정 관심사 삭제하기 
	public void controlMyinterestRemove(HashMap<String, Object> hashmap);
	
	//나의 특정 관심사 수정하기 
	public void controlMyinterestModify(HashMap<String, Object> hashmap);
	
	//나의 특정 관심사 추가하기 
	public void controlMyinterestInsert(HashMap<String, Object> hashmap);
	
	// 친구 리스트
	public ArrayList<PersonalDTO> friendList(String hostId);
	
	// 블랙 리스트
	public ArrayList<PersonalDTO> blackList(String hostId);
	
	// 친구신청중
	public ArrayList<PersonalDTO> friendSend(String hostId);

	// 친구신청받음
	public ArrayList<PersonalDTO> friendReceive(String hostId);
	
	// 친구신청취소(본인)
	public int friendnoSend(String friendNum);
	
	// 친구신청거절(본인)
	public int friendnoReceive(String friendNum);
	
	// 친구 추가(승낙)
	public int friendAdd(String friendNum);
	
	// 친구 삭제(절교)
	public int friendRemove(String friendNum);
	
	// 블랙리스트추가
	public int blackAdd(HashMap<String, String> blackMap);
	
	// 블랙리스트삭제
	public int blackRemove(String blackNum);
	
	//개인페이지의 일반회원, 운영진인 그룹리스트 뿌리기 
	public ArrayList<PersonalDTO> groupList(String userNumber);
	
	//개인페이지의 일반회원, 운영진인 그룹리스트 뿌리기 (비밀그룹)
	public ArrayList<PersonalDTO> groupList_secret(String userNumber);
	
	//개인페이지의 그룹장인 그룹리스트 뿌리기 
	public ArrayList<PersonalDTO> groupList_owner(String userNumber);
	
	//개인페이지의 그룹장인 그룹리스트 뿌리기 (비밀그룹)
	public ArrayList<PersonalDTO> groupList_owner_secret(String userNumber);
	
	//그룹 탈퇴 기능
	public void groupOut(HashMap<String, Object> hashMap);
	
	//그룹 비공개 기능
	public void groupNoopen(HashMap<String, Object> hashMap);
	
	//그룹 공개기능
	public void groupOpen(HashMap<String, Object> hashMap);
	
	// 개인 소개
	public String userContent(String userNumber);
	
	// 내가 주최한 이벤트
	public ArrayList<PersonalDTO> userEvent(String userNumber);
	
	// 참가 예정 이벤트								<< 그룹번호 알아와야행~
	public ArrayList<PersonalDTO> goEvent(String userNumber);
	
	// 이름
	public String memberName(String userNumber);
	
	// 친구 수
	public int friendCount(String userNumber);
	
	// 과거 meet U 수
	public int pastMeetU(String userNumber);
	
	// 관심 지역
	public ArrayList<PersonalDTO> userCityList(String userNumber);
	
	// 관심사
	public ArrayList<PersonalDTO> userTagList(String userNumber);
	
	// 개인 프로필 사진
	public String profilePhoto(String userNumber);
	
	// 프로필 사진 수정
	public void profilePhotoModify(HashMap<String, String> hashmap);
	
	// 개인 정보
	public PersonalDTO userInfo(String userNumber);
	
	// 타임라인
	// 개인 주최 이벤트
	public ArrayList<PersonalDTO> hostEventList(String hostId);
	
	// 개인 참여 예정 이벤트
	public ArrayList<PersonalDTO> hostInEventList(String hostId);
}
