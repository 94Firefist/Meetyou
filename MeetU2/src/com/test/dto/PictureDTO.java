package com.test.dto;

public class PictureDTO
{
	private int lpic_id, lmember_id;
	private String pic_credate, member_name, pic_url;
	public int getLpic_id()
	{
		return lpic_id;
	}
	public void setLpic_id(int lpic_id)
	{
		this.lpic_id = lpic_id;
	}
	public String getPic_url()
	{
		return pic_url;
	}
	public void setPic_url(String pic_url)
	{
		this.pic_url = pic_url;
	}
	public int getLmember_id()
	{
		return lmember_id;
	}
	public void setLmember_id(int lmember_id)
	{
		this.lmember_id = lmember_id;
	}
	public String getPic_credate()
	{
		return pic_credate;
	}
	public void setPic_credate(String pic_credate)
	{
		this.pic_credate = pic_credate;
	}
	public String getMember_name()
	{
		return member_name;
	}
	public void setMember_name(String member_name)
	{
		this.member_name = member_name;
	}
	
	
}
