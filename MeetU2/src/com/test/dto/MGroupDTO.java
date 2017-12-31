/*
 	메인에서 그룹리스트 뿌려줄 때 필요한 정보
*/

package com.test.dto;

public class MGroupDTO
{
	// 그룹 정보
	private String lgroup_id, group_name, group_credate, city_code, group_score, group_member_count, group_activity
	, tag, category_content, category_code, grprofile_url, lockcheck;
	// 그룹 아이디, 이름, 생성일, 관심지역, 추천점수, 멤버수, 활동수 
	// 태그, 관심사_내용, 관심사번호
	
	// 그룹 공개 여부
	private int grouppublic_id;

	
	public String getLockcheck()
	{
		return lockcheck;
	}

	public void setLockcheck(String lockcheck)
	{
		this.lockcheck = lockcheck;
	}

	public String getGrprofile_url()
	{
		return grprofile_url;
	}

	public void setGrprofile_url(String grprofile_url)
	{
		this.grprofile_url = grprofile_url;
	}

	public String getTag()
	{
		return tag;
	}

	public void setTag(String tag)
	{
		this.tag = tag;
	}

	public String getCategory_content()
	{
		return category_content;
	}

	public void setCategory_content(String category_content)
	{
		this.category_content = category_content;
	}

	public String getCategory_code()
	{
		return category_code;
	}

	public void setCategory_code(String category_code)
	{
		this.category_code = category_code;
	}

	public String getLgroup_id()
	{
		return lgroup_id;
	}

	public void setLgroup_id(String lgroup_id)
	{
		this.lgroup_id = lgroup_id;
	}

	public String getGroup_name()
	{
		return group_name;
	}

	public void setGroup_name(String group_name)
	{
		this.group_name = group_name;
	}

	public String getGroup_credate()
	{
		return group_credate;
	}

	public void setGroup_credate(String group_credate)
	{
		this.group_credate = group_credate;
	}

	public String getCity_code()
	{
		return city_code;
	}

	public void setCity_code(String city_code)
	{
		this.city_code = city_code;
	}

	public String getGroup_score()
	{
		return group_score;
	}

	public void setGroup_score(String group_score)
	{
		this.group_score = group_score;
	}

	public String getGroup_member_count()
	{
		return group_member_count;
	}

	public void setGroup_member_count(String group_member_count)
	{
		this.group_member_count = group_member_count;
	}

	public String getGroup_activity()
	{
		return group_activity;
	}

	public void setGroup_activity(String group_activity)
	{
		this.group_activity = group_activity;
	}

	public int getGrouppublic_id()
	{
		return grouppublic_id;
	}

	public void setGrouppublic_id(int grouppublic_id)
	{
		this.grouppublic_id = grouppublic_id;
	}
	
	
	

}
