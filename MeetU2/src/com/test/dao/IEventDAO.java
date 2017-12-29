package com.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.test.dto.EventDTO;
import com.test.dto.MemberDTO;

public interface IEventDAO
{

	// 특정 이벤트의 모든 태그를 가져오는 메소드
	public String[] getEventTags(String eventId);
	
	// 특정 이벤트 정보를 가져오는 메소드
	public ArrayList<EventDTO> getEventInfo(HashMap<String, Object> hashmap);
	
	// 특정 이벤트의 이벤트 참석여부에 따라 리스트를 가져오는 메소드
	public ArrayList<MemberDTO> getAttendMember(HashMap<String, Object> attendMap);
	
	// 특정 이벤트의 상세 조건을 가져오는 메소드
	public HashMap<String, Object> getSortValues(String eventId);
	
	// 특정 이벤트의 앨범을 추가하는 메소드
	public void addAlbum(HashMap<String, Object> groupAndEventAndMemberMap);

	// 특정 이벤트의 특정 멤버 참석여부 추가 메소드
	public void addEveAttend(HashMap<String, Object> eventAndMemberAndAttendMap);
		
	// 특정 이벤트의 특정 멤버 참석여부 수정 메소드
    public void updateEveAttend(HashMap<String, Object> eventAndMemberAndAttendMap);
    
	// 특정 이벤트의 특정 멤버 참석여부를 가져오는 메소드
    public String getAttendId(HashMap<String, Object> eventUesd);
    
	// 특정 이벤트가 진행됬는지 여부확인 메소드
    public String getEventUsed(String eventId);
    
	// 특정 이벤트의 앨범ID를 가져오는 메소드
	public String getAlbumId(String eventId);
	
	// 특정 이벤트의 특정 멤버 참석코드를 가져오는 메소드
	public String getEveAttendId(HashMap<String, Object> eventUesd);
}


