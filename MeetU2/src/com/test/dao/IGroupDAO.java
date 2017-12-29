package com.test.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.test.dto.AlbumDTO;
import com.test.dto.EventDTO;
import com.test.dto.GroupDTO;
import com.test.dto.MemberDTO;
import com.test.dto.PictureDTO;
import com.test.dto.Public_DTO;
import com.test.dto.TagDTO;
import com.test.main.CategoryDTO;
import com.test.main.CityDTO;

public interface IGroupDAO
{
	// 해당 그룹의 모든 정보를 담는 메소드
	public GroupDTO getGroupInfo(String groupId);
	
	// 해당 그룹의 모든 카테고리를 가져오는 메소드
	public ArrayList<CategoryDTO> getGroupCategorys(String groupId);
	
	// 해당 그룹의 모든 태그를 가져오는 메소드
	public ArrayList<TagDTO> getGroupTags(String groupId);
	
	// 해당 이벤트의 모든 태그를 가져오는 메소드
	public String[] getEventTags(String eventId);
	
	// 해당 그룹의 미래 이벤트 정보 가져오는 메소드
	public ArrayList<EventDTO> getPreEventLists(HashMap<String, Object> groupAndCountMap);
	
	// 해당 그룹의 과거 이벤트 정보 가져오는 메소드
	public ArrayList<EventDTO> getPosEventLists(HashMap<String, Object> groupAndCountMap);
	
	// 해당 그룹의 모든 이벤트 정보를 가져오는 메소드
	public ArrayList<EventDTO> getEventLists(String groupId);
	
	// 해당 그룹의 해당 멤버의 그룹 권한을 가져오는 메소드
	public String getGroupPower (HashMap<String, Object> grlistMap);
	
	// 해당 그룹의 멤버정보를 가져오는 메소드
	public ArrayList<MemberDTO> getGroupMember(HashMap<String, Object> grlistMap);
	
	// 해당 이벤트 정보를 가져오는 메소드
	public ArrayList<EventDTO> getEventInfo(HashMap<String, Object> hashmap);
	
	// 해당 이벤트의 이벤트 참석여부에 따라 리스트를 가져오는 메소드
	public ArrayList<MemberDTO> getAttendMember(HashMap<String, Object> attendMap);
	
	// 해당 이벤트의 상세 조건을 가져오는 메소드
	public HashMap<String, Object> getSortValues(String eventId);
	
	// 해당 그룹의 멤버 가입처리 메소드
	public int InsertGroupMember(HashMap<String, Object> groupAndTargetMap);
	
	// 해당 그룹의 멤버권한을 변경하는 메소드
	public int changeGroupMemberPower(HashMap<String, Object> groupAndTargetMap);
	
	// 해당 그룹의 가입승인 변경 메소드
	public int singupchangeGroup(HashMap<String, Object> singupchange);
	
	// 해당 그룹의 모든 공개범위를 가져오는 메소드
	public ArrayList<Public_DTO> getGroupPublicList();
	
	// 해당 그룹의 모든 공개범위를 수정하는 메소드
	public int changeGroupOption(HashMap<String, Object> groupOptionMap);
	
	// 해당 그룹의 모든 블랙리스트를 가져오는 메소드
	public ArrayList<MemberDTO> getGroupBlackList(String group);
	
	// 해당 그룹의 블랙리스트를 삭제하는 메소드
	public int removeGroupBlackList(HashMap<String, Object> groupTargetMap);
	
	// 해당 그룹의 그룹원을 삭제하는 메소드
	public int removeGroupMember(HashMap<String, Object> groupTargetMap);
	
	// 해당 그룹의 그룹장을 변경하는 메소드
	public int changeGroupMaster(HashMap<String, Object> groupTargetMap);
	
	// 해당 멤버의 Realid를 가져오는 메소드
	public MemberDTO getMemberOfRealid(String name);
	
	// 해당 그룹의 블랙리스트를 추가하는 메소드
	public int insertGroupBlack(HashMap<String, Object> groupAndTargetMap);
	
	// 해당 그룹의 이벤트에 대한 모든 앨범을 가져오는 메소드
	public ArrayList<AlbumDTO> getGroupEventAlbums(String groupId);
	
	// 해당 앨범의 모든 사진을 가져오는 메소드
	public ArrayList<PictureDTO> getGroupAlbumPictures(String albumId);
	
	// 해당 그룹이 사용하는 카테고리를 제외한 카테고리 목록을 가져오는 메소드
	public ArrayList<CategoryDTO> getGroupUsableCategorys(String groupId);
	
	// 해당 그룹의 카테고리를 삭제하는 메소드
	public void removeGroupCategory(String target);
	
	// 해당 그룹의 태그를 삭제하는 메소드
	public void removeGroupTag(String target);
	
	// 해당 그룹의 카테고리를 추가하는 메소드
	public void addGroupCategory(HashMap<String, Object> groupAndTargetMap);
	
	// 해당 그룹의 태그를 추가하는 메소드
	public void addGroupTag(HashMap<String, Object> groupAndTargetMap);
	
	// 해당 그룹의 그룹 소개를 수정하는 메소드
	public void updateGroupInfo(HashMap<String, Object> groupAndTargetMap);
	
	// 해당 그룹의 그룹 명을 수정하는 메소드
	public void updateGroupSubject(HashMap<String, Object> groupAndTargetMap);
	
	// 해당 그룹의 이벤트중에서 앨범 생성 권한 정보를 가져오는 메소드
	public String getGroupAcceptAlbum(String eventId);public int groupProfile(HashMap<String, String> groupproMap);
	
	//
	public ArrayList<CategoryDTO> categoryList();
	//
	public ArrayList<CityDTO> citytypelist();
	//
	public String addGroup(HashMap<String, Object> groupMap);
	//
	public int addTag(List<HashMap<String, Object>> list);
	//
	public int groupSEQ();
	//
	public int addCategory(List<HashMap<String, Object>> list);
	//
	public int categorySEQ();
	//
	public String categoryupdate(String eventId);
	//
	public String getEveAttendId(HashMap<String, Object> eventUesd);
	//
	public AlbumDTO getAlbumInfo(String albumId);
	//
	public String getAlbumId(String eventId);
	//
	public String getBlackGroupConfirm(HashMap<String, Object> groupAndTargetMap);
	//
	public void addEveAttend(HashMap<String, Object> eventAndMemberAndAttendMap);
	//
    public void updateEveAttend(HashMap<String, Object> eventAndMemberAndAttendMap);
	//
    public String getAttendId(HashMap<String, Object> eventUesd);
	//
    public String getEventUsed(String eventId);
	//
	public void eventUpdate(HashMap<String, Object> eventMap);
	//
	public void addAlbum(HashMap<String, Object> groupAndEventAndMemberMap);
	//
	public String getGrlist(HashMap<String, Object> groupAndTargetMap);
	//
	public String getGroupEventOk(HashMap<String, Object> groupAndTargetMap);
	//
	public void addEventPicture(HashMap<String, Object> eventPictureMap);
}


