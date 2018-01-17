package com.test.dto;

import java.util.ArrayList;


public class NewGroupDTO
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
	
	// 그룹장
	private NewMemberDTO master;
	
	private ArrayList<NewMemberDTO> staffs;
	
	private ArrayList<NewMemberDTO> members;

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

	public NewMemberDTO getMaster()
	{
		return master;
	}

	public void setMaster(NewMemberDTO master)
	{
		this.master = master;
	}

	public ArrayList<NewMemberDTO> getStaffs()
	{
		return staffs;
	}

	public void setStaffs(ArrayList<NewMemberDTO> staffs)
	{
		this.staffs = staffs;
	}

	public ArrayList<NewMemberDTO> getMembers()
	{
		return members;
	}

	public void setMembers(ArrayList<NewMemberDTO> members)
	{
		this.members = members;
	}

	
}