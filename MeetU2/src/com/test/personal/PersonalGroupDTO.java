package com.test.personal;

public class PersonalGroupDTO
{
	  //그룹아이디   홈피주인     공개여부       그룹이름     그룹 프로필사진 그룹권한
	String lgroup_id, lmember_id, mbpublicti_id, group_name, grprofile_url, grpower_id;

	public String getGrpower_id()
	{
		return grpower_id;
	}

	public void setGrpower_id(String grpower_id)
	{
		this.grpower_id = grpower_id;
	}

	public String getGrprofile_url()
	{
		return grprofile_url;
	}

	public void setGrprofile_url(String grprofile_url)
	{
		this.grprofile_url = grprofile_url;
	}

	public String getLgroup_id()
	{
		return lgroup_id;
	}

	public void setLgroup_id(String lgroup_id)
	{
		this.lgroup_id = lgroup_id;
	}

	public String getLmember_id()
	{
		return lmember_id;
	}

	public void setLmember_id(String lmember_id)
	{
		this.lmember_id = lmember_id;
	}

	public String getMbpublicti_id()
	{
		return mbpublicti_id;
	}

	public void setMbpublicti_id(String mbpublicti_id)
	{
		this.mbpublicti_id = mbpublicti_id;
	}

	public String getGroup_name()
	{
		return group_name;
	}

	public void setGroup_name(String group_name)
	{
		this.group_name = group_name;
	}
	
	
	
	
}
