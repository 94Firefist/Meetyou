/*
 	이벤트 테이블 접근
 	→ 메인화면에서 선택한 정렬에 따라서 리스트 뿌려주는 클래스
 */

package com.test.dao;

import java.util.ArrayList;

import com.test.dto.CategoryDTO;
import com.test.dto.CityDTO;
import com.test.dto.GroupDTO;
import com.test.dto.EventDTO;
import com.test.dto.SearchDetailDTO;

public interface IMainListDAO
{
	// 파워링크
	public ArrayList<EventDTO> powerList();
	
	// 이벤트 리스트 출력
	public ArrayList<EventDTO> eventList(SearchDetailDTO dto);
	
	// 검색바 관심사 출력
	public ArrayList<CategoryDTO> interestList();
	
	// 그룹 리스트 출력
	public ArrayList<GroupDTO> groupList(SearchDetailDTO dto);
	
	// 지역 리스트 출력
	public ArrayList<CityDTO> cityList();
	
	// 이벤트 주인 찾기
	public EventDTO whoEvent(String levent_id);
}
