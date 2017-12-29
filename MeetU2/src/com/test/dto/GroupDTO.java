package com.test.dto;

public class GroupDTO
{
	//			그룹ID	   그룹장ID	 관심지역ID 그룹공개ID 그룹원공개ID 그룹앨범공개ID 그룹멤버수         그룹이벤트수      그룹가입신청ID
	private int lGroup_id, lMember_id, citype_id, public_gr, public_grl,  public_gra,    group_memberCount, group_eventCount, grauto_accept;
	//			   그룹명      그룹장이름   그룹소개말  그룹생성일     관심지역이름      그룹대표사진    그룹장realId   그룹장대표사진
	private String group_name, member_name, group_info, group_credate, group_citypeName, group_imageUrl, member_realId, member_imageUrl;
	
	//             그룹가입일  그룹탈퇴일
	private String grjoin_day, grleave_day;
	
	//      그룹리스트키넘  내권한 회원키넘 공개여부키넘
	private int grlist_id, 	grpower_id, 	mbpublicti_id;
	
	public int getlGroup_id()
	{
		return lGroup_id;
	}
	public void setlGroup_id(int lGroup_id)
	{
		this.lGroup_id = lGroup_id;
	}
	public int getlMember_id()
	{
		return lMember_id;
	}
	public void setlMember_id(int lMember_id)
	{
		this.lMember_id = lMember_id;
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
	public int getMbpublicti_id()
	{
		return mbpublicti_id;
	}
	public void setMbpublicti_id(int mbpublicti_id)
	{
		this.mbpublicti_id = mbpublicti_id;
	}
	public int getGrauto_accept()
	{
		return grauto_accept;
	}
	public void setGrauto_accept(int grauto_accept)
	{
		this.grauto_accept = grauto_accept;
	}
	public String getMember_imageUrl()
	{
		return member_imageUrl;
	}
	public void setMember_imageUrl(String member_imageUrl)
	{
		this.member_imageUrl = member_imageUrl;
	}
	public String getMember_realId()
	{
		return member_realId;
	}
	public void setMember_realId(String member_realId)
	{
		this.member_realId = member_realId;
	}
	public String getGroup_imageUrl()
	{
		return group_imageUrl;
	}
	public void setGroup_imageUrl(String group_imageUrl)
	{
		this.group_imageUrl = group_imageUrl;
	}
	public int getGroup_eventCount()
	{
		return group_eventCount;
	}
	public void setGroup_eventCount(int group_eventCount)
	{
		this.group_eventCount = group_eventCount;
	}
	public int getGroup_memberCount()
	{
		return group_memberCount;
	}
	public void setGroup_memberCount(int group_memberCount)
	{
		this.group_memberCount = group_memberCount;
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
	public String getGroup_credate()
	{
		return group_credate;
	}
	public void setGroup_credate(String group_credate)
	{
		this.group_credate = group_credate;
	}
	public int getCitype_id()
	{
		return citype_id;
	}
	public void setCitype_id(int citype_id)
	{
		this.citype_id = citype_id;
	}
	public int getPublic_gr()
	{
		return public_gr;
	}
	public void setPublic_gr(int public_gr)
	{
		this.public_gr = public_gr;
	}
	public int getPublic_grl()
	{
		return public_grl;
	}
	public void setPublic_grl(int public_grl)
	{
		this.public_grl = public_grl;
	}
	public int getPublic_gra()
	{
		return public_gra;
	}
	public void setPublic_gra(int public_gra)
	{
		this.public_gra = public_gra;
	}
	public String getGroup_name()
	{
		return group_name;
	}
	public void setGroup_name(String group_name)
	{
		this.group_name = group_name;
	}
	public String getGroup_info()
	{
		return group_info;
	}
	public void setGroup_info(String group_info)
	{
		this.group_info = group_info;
	}
}
