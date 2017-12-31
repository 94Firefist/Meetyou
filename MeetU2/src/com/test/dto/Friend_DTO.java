package com.test.dto;

public class Friend_DTO
{			
		//  프사사진     친구이름     친구아이디
	String mbprofile_url, member_name, member_realid;
	
	   //친구신청받은 사람, 친구신청한사람키 
	int lumember_id, limember_id;

	public String getMbprofile_url()
	{
		return mbprofile_url;
	}

	public void setMbprofile_url(String mbprofile_url)
	{
		this.mbprofile_url = mbprofile_url;
	}

	public String getMember_name()
	{
		return member_name;
	}

	public void setMember_name(String member_name)
	{
		this.member_name = member_name;
	}

	public String getMember_realid()
	{
		return member_realid;
	}

	public void setMember_realid(String member_realid)
	{
		this.member_realid = member_realid;
	}

	public int getLumember_id()
	{
		return lumember_id;
	}

	public void setLumember_id(int lumember_id)
	{
		this.lumember_id = lumember_id;
	}

	public int getLimember_id()
	{
		return limember_id;
	}

	public void setLimember_id(int limember_id)
	{
		this.limember_id = limember_id;
	}
	
	
}
