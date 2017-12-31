/*
 	이벤트 테이블 접근
 	→ 메인화면에서 선택한 정렬에 따라서 리스트 뿌려주는 클래스
 */

package com.test.dao;

import java.util.ArrayList;

import com.test.dto.CategoryDTO;
import com.test.dto.CityDTO;
import com.test.dto.MEventDTO;
import com.test.dto.MGroupDTO;
import com.test.dto.SearchDetailDTO;

public interface IMainListDAO
{
	// 파워링크
	public ArrayList<MEventDTO> powerList();
	
	// 이벤트 리스트 출력
	public ArrayList<MEventDTO> eventList(SearchDetailDTO dto);
	
	// 검색바 관심사 출력
	public ArrayList<CategoryDTO> interestList();
	
	// 그룹 리스트 출력
	public ArrayList<MGroupDTO> groupList(SearchDetailDTO dto);
	
	// 지역 리스트 출력
	public ArrayList<CityDTO> cityList();
	
	// 이벤트 주인 찾기
	public MEventDTO whoEvent(String levent_id);
}
