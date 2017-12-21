package com.test.group;

public class Group_DTO
{			//그룹이름  그룹가입일  그룹탈퇴일
	String group_name, grjoin_day, grleave_day;
		
		//그룹키넘  그룹리스트키넘  내권한 회원키넘    공개여부키넘
	int lgroup_id, grlist_id, grpower_id, lmember_id, mbpublicti_id;
	
	public String getGroup_name()
	{
		return group_name;
	}
	public void setGroup_name(String group_name)
	{
		this.group_name = group_name;
	}
	public String getGrjoin_day()
	{
		return grjoin_day;
	}
	public void setGrjoin_day(String grjoin_day)
	{
		this.grjoin_day = grjoin_day;
	}
	public String getGrleave_day()
	{
		return grleave_day;
	}
	public void setGrleave_day(String grleave_day)
	{
		this.grleave_day = grleave_day;
	}
	public int getLgroup_id()
	{
		return lgroup_id;
	}
	public void setLgroup_id(int lgroup_id)
	{
		this.lgroup_id = lgroup_id;
	}
	public int getGrlist_id()
	{
		return grlist_id;
	}
	public void setGrlist_id(int grlist_id)
	{
		this.grlist_id = grlist_id;
	}
	public int getGrpower_id()
	{
		return grpower_id;
	}
	public void setGrpower_id(int grpower_id)
	{
		this.grpower_id = grpower_id;
	}
	public int getLmember_id()
	{
		return lmember_id;
	}
	public void setLmember_id(int lmember_id)
	{
		this.lmember_id = lmember_id;
	}
	public int getMbpublicti_id()
	{
		return mbpublicti_id;
	}
	public void setMbpublicti_id(int mbpublicti_id)
	{
		this.mbpublicti_id = mbpublicti_id;
	}
	
	
	
	
}