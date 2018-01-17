package com.test.dto;

public class GroupDTO
{
	
	// TBL_GROUP
	private String lGroup_id;

	private String group_name;

	private String group_creDate;

	private String public_gr;

	private String public_grL;

	private String public_grA;

	private String group_info;

	private String grauto_accept;

	private String cityPe_id;
	// 그룹 이벤트 수
	private String event_count;

	// 그룹 멤버수
	private String memberCount;
	
	// CITY_TYPE
	private String city_name;
	
	// GRPROFILE
	private String grProfile_id, grProfile_url;
	
	// GRLIST
	private String grJoin_day, grLeave_day, grList_id, grPower_id, 	mbPublicTi_id;
	
	//			회원ID	그룹멤버수         그룹이벤트수
	private int lMember_id, group_memberCount, group_eventCount;
	//			   회원이름      관심지역이름      그룹대표사진    회원realId   회원대표사진
	private String member_name, group_citypeName, group_imageUrl, member_realId, member_imageUrl;
	
	
	private String category_content, tag, lockCheck, count;
	
	private String past_event, future_event, current_create, current_hold, grStatus_stop, group_category;

	private String groupScore, groupActivity, category_code;
	// 그룹 아이디, 이름, 생성일, 관심지역, 추천점수, 멤버수, 활동수 
	// 태그, 관심사_내용, 관심사번호
	
	// 그룹 공개 여부
	private int groupPublic_id;

	public String getlGroup_id()
	{
		return lGroup_id;
	}

	public void setlGroup_id(String lGroup_id)
	{
		this.lGroup_id = lGroup_id;
	}

	public String getGroup_name()
	{
		return group_name;
	}

	public void setGroup_name(String group_name)
	{
		this.group_name = group_name;
	}

	public String getGroup_creDate()
	{
		return group_creDate;
	}

	public void setGroup_creDate(String group_creDate)
	{
		this.group_creDate = group_creDate;
	}

	public String getPublic_gr()
	{
		return public_gr;
	}

	public void setPublic_gr(String public_gr)
	{
		this.public_gr = public_gr;
	}

	public String getPublic_grL()
	{
		return public_grL;
	}

	public void setPublic_grL(String public_grL)
	{
		this.public_grL = public_grL;
	}

	public String getPublic_grA()
	{
		return public_grA;
	}

	public void setPublic_grA(String public_grA)
	{
		this.public_grA = public_grA;
	}

	public String getGroup_info()
	{
		return group_info;
	}

	public void setGroup_info(String group_info)
	{
		this.group_info = group_info;
	}

	public String getGrauto_accept()
	{
		return grauto_accept;
	}

	public void setGrauto_accept(String grauto_accept)
	{
		this.grauto_accept = grauto_accept;
	}

	public String getCityPe_id()
	{
		return cityPe_id;
	}

	public void setCityPe_id(String cityPe_id)
	{
		this.cityPe_id = cityPe_id;
	}

	public String getEvent_count()
	{
		return event_count;
	}

	public void setEvent_count(String event_count)
	{
		this.event_count = event_count;
	}

	public String getMemberCount()
	{
		return memberCount;
	}

	public void setMemberCount(String memberCount)
	{
		this.memberCount = memberCount;
	}

	public String getCity_name()
	{
		return city_name;
	}

	public void setCity_name(String city_name)
	{
		this.city_name = city_name;
	}

	public String getGrProfile_id()
	{
		return grProfile_id;
	}

	public void setGrProfile_id(String grProfile_id)
	{
		this.grProfile_id = grProfile_id;
	}

	public String getGrProfile_url()
	{
		return grProfile_url;
	}

	public void setGrProfile_url(String grProfile_url)
	{
		this.grProfile_url = grProfile_url;
	}

	public String getGrJoin_day()
	{
		return grJoin_day;
	}

	public void setGrJoin_day(String grJoin_day)
	{
		this.grJoin_day = grJoin_day;
	}

	public String getGrLeave_day()
	{
		return grLeave_day;
	}

	public void setGrLeave_day(String grLeave_day)
	{
		this.grLeave_day = grLeave_day;
	}

	public String getGrList_id()
	{
		return grList_id;
	}

	public void setGrList_id(String grList_id)
	{
		this.grList_id = grList_id;
	}

	public String getGrPower_id()
	{
		return grPower_id;
	}

	public void setGrPower_id(String grPower_id)
	{
		this.grPower_id = grPower_id;
	}

	public String getMbPublicTi_id()
	{
		return mbPublicTi_id;
	}

	public void setMbPublicTi_id(String mbPublicTi_id)
	{
		this.mbPublicTi_id = mbPublicTi_id;
	}

	public int getlMember_id()
	{
		return lMember_id;
	}

	public void setlMember_id(int lMember_id)
	{
		this.lMember_id = lMember_id;
	}

	public int getGroup_memberCount()
	{
		return group_memberCount;
	}

	public void setGroup_memberCount(int group_memberCount)
	{
		this.group_memberCount = group_memberCount;
	}

	public int getGroup_eventCount()
	{
		return group_eventCount;
	}

	public void setGroup_eventCount(int group_eventCount)
	{
		this.group_eventCount = group_eventCount;
	}

	public String getMember_name()
	{
		return member_name;
	}

	public void setMember_name(String member_name)
	{
		this.member_name = member_name;
	}

	public String getGroup_citypeName()
	{
		return group_citypeName;
	}

	public void setGroup_citypeName(String group_citypeName)
	{
		this.group_citypeName = group_citypeName;
	}

	public String getGroup_imageUrl()
	{
		return group_imageUrl;
	}

	public void setGroup_imageUrl(String group_imageUrl)
	{
		this.group_imageUrl = group_imageUrl;
	}

	public String getMember_realId()
	{
		return member_realId;
	}

	public void setMember_realId(String member_realId)
	{
		this.member_realId = member_realId;
	}

	public String getMember_imageUrl()
	{
		return member_imageUrl;
	}

	public void setMember_imageUrl(String member_imageUrl)
	{
		this.member_imageUrl = member_imageUrl;
	}

	public String getCategory_content()
	{
		return category_content;
	}

	public void setCategory_content(String category_content)
	{
		this.category_content = category_content;
	}

	public String getTag()
	{
		return tag;
	}

	public void setTag(String tag)
	{
		this.tag = tag;
	}

	public String getLockCheck()
	{
		return lockCheck;
	}

	public void setLockCheck(String lockCheck)
	{
		this.lockCheck = lockCheck;
	}

	public String getCount()
	{
		return count;
	}

	public void setCount(String count)
	{
		this.count = count;
	}

	public String getPast_event()
	{
		return past_event;
	}

	public void setPast_event(String past_event)
	{
		this.past_event = past_event;
	}

	public String getFuture_event()
	{
		return future_event;
	}

	public void setFuture_event(String future_event)
	{
		this.future_event = future_event;
	}

	public String getCurrent_create()
	{
		return current_create;
	}

	public void setCurrent_create(String current_create)
	{
		this.current_create = current_create;
	}

	public String getCurrent_hold()
	{
		return current_hold;
	}

	public void setCurrent_hold(String current_hold)
	{
		this.current_hold = current_hold;
	}

	public String getGrStatus_stop()
	{
		return grStatus_stop;
	}

	public void setGrStatus_stop(String grStatus_stop)
	{
		this.grStatus_stop = grStatus_stop;
	}

	public String getGroup_category()
	{
		return group_category;
	}

	public void setGroup_category(String group_category)
	{
		this.group_category = group_category;
	}

	public String getGroupScore()
	{
		return groupScore;
	}

	public void setGroupScore(String groupScore)
	{
		this.groupScore = groupScore;
	}

	public String getGroupActivity()
	{
		return groupActivity;
	}

	public void setGroupActivity(String groupActivity)
	{
		this.groupActivity = groupActivity;
	}

	public String getCategory_code()
	{
		return category_code;
	}

	public void setCategory_code(String category_code)
	{
		this.category_code = category_code;
	}

	public int getGroupPublic_id()
	{
		return groupPublic_id;
	}

	public void setGroupPublic_id(int groupPublic_id)
	{
		this.groupPublic_id = groupPublic_id;
	}
	
	
}
