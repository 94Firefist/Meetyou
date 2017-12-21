package com.test.group;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.test.main.CategoryDTO;
import com.test.main.CityDTO;

public interface IGroupDAO
{
	public GroupDTO getGroupInfo(String groupId);
	public ArrayList<CategoryDTO> getGroupCategorys(String groupId);
	public ArrayList<TagDTO> getGroupTags(String groupId);
	public String[] getEventTags(String eventId);
	public ArrayList<EventDTO> getPreEventLists(HashMap<String, Object> groupAndCountMap);
	public ArrayList<EventDTO> getPosEventLists(HashMap<String, Object> groupAndCountMap);
	public ArrayList<EventDTO> getEventLists(String groupId);
	public String getGroupPower (HashMap<String, Object> grlistMap);
	public ArrayList<MemberDTO> getGroupMember(HashMap<String, Object> grlistMap);
	public ArrayList<EventDTO> getEventInfo(HashMap<String, Object> hashmap);
	public ArrayList<MemberDTO> getAttendMember(HashMap<String, Object> attendMap);
	public HashMap<String, Object> getSortValues(String eventId);
	public int InsertGroupMember(HashMap<String, Object> groupAndTargetMap);
	public int changeGroupMemberPower(HashMap<String, Object> groupAndTargetMap);
	public int singupchangeGroup(HashMap<String, Object> singupchange);
	public ArrayList<Public_DTO> getGroupPublicList();
	public int changeGroupOption(HashMap<String, Object> groupOptionMap);
	public ArrayList<MemberDTO> getGroupBlackList(String group);
	public int removeGroupBlackList(HashMap<String, Object> groupTargetMap);
	public int removeGroupMember(HashMap<String, Object> groupTargetMap);
	public int changeGroupMaster(HashMap<String, Object> groupTargetMap);
	public MemberDTO getMemberOfRealid(String name);
	public int insertGroupBlack(HashMap<String, Object> groupAndTargetMap);
	public ArrayList<AlbumDTO> getGroupEventAlbums(String groupId);
	public ArrayList<PictureDTO> getGroupAlbumPictures(String albumId);
	public ArrayList<CategoryDTO> getGroupUsableCategorys(String groupId);
	public void removeGroupCategory(String target);
	public void removeGroupTag(String target);
	public void addGroupCategory(HashMap<String, Object> groupAndTargetMap);
	public void addGroupTag(HashMap<String, Object> groupAndTargetMap);
	public void updateGroupInfo(HashMap<String, Object> groupAndTargetMap);
	public void updateGroupSubject(HashMap<String, Object> groupAndTargetMap);
	public String getGroupAcceptAlbum(String eventId);
	
	
	public int groupProfile(HashMap<String, String> groupproMap);
	public ArrayList<CategoryDTO> categoryList();
	public ArrayList<CityDTO> citytypelist();
	public String addGroup(HashMap<String, Object> groupMap);
	public int addTag(List<HashMap<String, Object>> list);
	public int groupSEQ();
	public int addCategory(List<HashMap<String, Object>> list);
	public int categorySEQ();
	public String categoryupdate(String eventId);
	public String getEveAttendId(HashMap<String, Object> eventUesd);
	public AlbumDTO getAlbumInfo(String albumId);
	public String getAlbumId(String eventId);
	public String getBlackGroupConfirm(HashMap<String, Object> groupAndTargetMap);
	
	public void addEveAttend(HashMap<String, Object> eventAndMemberAndAttendMap);
   public void updateEveAttend(HashMap<String, Object> eventAndMemberAndAttendMap);
   public String getAttendId(HashMap<String, Object> eventUesd);
   public String getEventUsed(String eventId);
// 추가
	public void eventUpdate(HashMap<String, Object> eventMap);
	public void addAlbum(HashMap<String, Object> groupAndEventAndMemberMap);
	public String getGrlist(HashMap<String, Object> groupAndTargetMap);
	
	// 늘림
	public String getGroupEventOk(HashMap<String, Object> groupAndTargetMap);
	public void addEventPicture(HashMap<String, Object> eventPictureMap);
}


