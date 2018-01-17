package com.test.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.test.dto.CategoryDTO;
import com.test.dto.GroupDTO;
import com.test.dto.AlbumDTO;
import com.test.dto.CityDTO;
import com.test.dto.EventDTO;
import com.test.dto.MemberDTO;
import com.test.dto.NewGroupDTO;
import com.test.dto.Public_DTO;
import com.test.dto.TagDTO;

public interface IGroupDAO
{
	//1.그룹리스트 출력
	public ArrayList<GroupDTO> group_List2(HashMap<String, String> stMap) throws SQLException, ClassNotFoundException;
	
	//2.그룹전체 리스트 페이지 처리
	public int groupCount2(String groupName) throws SQLException, ClassNotFoundException;
	
	//3.그룹 삭제 
	//public int groupDel(String groupid) throws SQLException, ClassNotFoundException;
	
	// 특정 그룹의 모든 정보를 담는 메소드
	public GroupDTO getGroupInfo(String groupId);
	
	// 특정 그룹의 모든 카테고리를 가져오는 메소드
	public ArrayList<CategoryDTO> getGroupCategorys(String groupId);
	
	// 특정 그룹의 모든 태그를 가져오는 메소드
	public ArrayList<TagDTO> getGroupTags(String groupId);
	
	// 특정 그룹의 미래 이벤트 정보 가져오는 메소드
	public ArrayList<EventDTO> getPreEventLists(HashMap<String, Object> groupAndCountMap);
	
	// 특정 그룹의 과거 이벤트 정보 가져오는 메소드
	public ArrayList<EventDTO> getPosEventLists(HashMap<String, Object> groupAndCountMap);
	
	// 특정 그룹의 모든 이벤트 정보를 가져오는 메소드
	public ArrayList<EventDTO> getEventLists(String groupId);
	
	// 특정 그룹의 특정 멤버의 그룹 권한을 가져오는 메소드
	public String getGroupPower (HashMap<String, Object> grlistMap);
	
	// 특정 그룹의 멤버정보를 가져오는 메소드
	public ArrayList<MemberDTO> getGroupMember(HashMap<String, Object> grlistMap);

	// 특정 그룹의 멤버 가입처리 메소드
	public int InsertGroupMember(HashMap<String, Object> groupAndTargetMap);
	
	// 특정 그룹의 멤버권한을 변경하는 메소드
	public int setGroupMemberPower(HashMap<String, Object> groupAndTargetMap);
	
	// 특정 그룹의 가입승인 변경 메소드
	public int singupsetGroup(HashMap<String, Object> singupset);
	
	// 특정 그룹의 모든 공개범위를 가져오는 메소드
	public ArrayList<Public_DTO> getGroupPublicList();
	
	// 특정 그룹의 모든 공개범위를 수정하는 메소드
	public int setGroupOption(HashMap<String, Object> groupOptionMap);
	
	// 특정 그룹의 모든 블랙리스트를 가져오는 메소드
	public ArrayList<MemberDTO> getGroupBlackList(String group);
	
	// 특정 그룹의 블랙리스트를 삭제하는 메소드
	public int removeGroupBlackList(HashMap<String, Object> groupTargetMap);
	
	// 특정 그룹의 그룹원을 삭제하는 메소드
	public int removeGroupMember(HashMap<String, Object> groupTargetMap);
	
	// 특정 그룹의 그룹장을 변경하는 메소드
	public int setGroupMaster(HashMap<String, Object> groupTargetMap);
	
	// 특정 그룹의 블랙리스트를 추가하는 메소드
	public int insertGroupBlack(HashMap<String, Object> groupAndTargetMap);
	
	// 특정 그룹의 이벤트에 대한 모든 앨범을 가져오는 메소드
	public ArrayList<AlbumDTO> getGroupEventAlbums(String groupId);

	// 특정 그룹이 사용하는 카테고리를 제외한 카테고리 목록을 가져오는 메소드
	public ArrayList<CategoryDTO> getGroupUsableCategorys(String groupId);
	
	// 특정 그룹의 카테고리를 삭제하는 메소드
	public void removeGroupCategory(String target);
	
	// 특정 그룹의 태그를 삭제하는 메소드
	public void removeGroupTag(String target);
	
	// 특정 그룹의 카테고리를 추가하는 메소드
	public void addGroupCategory(HashMap<String, Object> groupAndTargetMap);
	
	// 특정 그룹의 태그를 추가하는 메소드
	public void addGroupTag(HashMap<String, Object> groupAndTargetMap);
	
	// 특정 그룹의 그룹 소개를 수정하는 메소드
	public void updateGroupInfo(HashMap<String, Object> groupAndTargetMap);
	
	// 특정 그룹의 그룹 명을 수정하는 메소드
	public void updateGroupSubject(HashMap<String, Object> groupAndTargetMap);
	
	// 특정 그룹의 이벤트중에서 앨범 생성 권한 정보를 가져오는 메소드
	public String getGroupAcceptAlbum(String eventId);
	
	public int groupProfile(HashMap<String, String> groupproMap);
	
	// 특정 그룹의 특정 멤버 GRLIST_ID 가져오는 메소드
	public String getGrlist(HashMap<String, Object> groupAndTargetMap);
		
	// 특정 그룹에 소속된 특정 이벤트가 맞는지 확인 메소드
	public String getGroupEventOk(HashMap<String, Object> groupAndTargetMap);
	
	// 특정 그룹의 특정 멤버가 블랙리스트 여부 확인 메소드
	public String getBlackGroupConfirm(HashMap<String, Object> groupAndTargetMap);
	
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
	public void eventupdate(HashMap<String, Object> eventMap);
		
		// 
	public String categoryupdate(String eventId);

	public void groupDel(int group_id) throws SQLException, ClassNotFoundException;
	
	public ArrayList<NewGroupDTO> getGroupList();
	
}
