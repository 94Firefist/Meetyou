package com.test.event;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface EventIDAO
{
	public String addEvent(HashMap<String, Object> eventMap);	// 이벤트 생성 프로시저
	public String getCityCode(String loadName);					// 시티코드 가져오기
	public String getTag(String keynumber);						// 태그 갯수 가져오기
	public String getPower(String keynumber);					// 파워링크 일수 가져오기
	public ArrayList<EventDTO> groupList(String keynumber);		// 현재 그룹장이거나, 운영진 인 그룹 리스트
	public ArrayList<EventDTO> evepublicList();					// 이벤트 공개범위 리스트
	public ArrayList<EventDTO> categoryList();					// 카테고리 리스트
	public int addEvecondi(HashMap<String, String> insertHash);	// 이벤트 상세옵션 인설트
	public int addTag(List<HashMap<String, Object>> list);		// 이벤트 태그 인설트
	public void addPower(HashMap<String, Object> powerMap);		// 파워링크 설정
	public int tagSEQ();										// 태그 시퀀스 가져오기
	public void pay(HashMap<String, String> payMap);			// 파워링크 태그 구매시
}
