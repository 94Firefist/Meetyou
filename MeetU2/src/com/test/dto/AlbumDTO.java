package com.test.dto;

public class AlbumDTO
{
	private int lalbum_id, levent_id, lmember_id;
	
	private String album_credate, member_name, event_name, eveprofile_url;

	public int getLalbum_id()
	{
		return lalbum_id;
	}

	public void setLalbum_id(int lalbum_id)
	{
		this.lalbum_id = lalbum_id;
	}

	public int getLevent_id()
	{
		return levent_id;
	}

	public void setLevent_id(int levent_id)
	{
		this.levent_id = levent_id;
	}

	public int getLmember_id()
	{
		return lmember_id;
	}

	public void setLmember_id(int lmember_id)
	{
		this.lmember_id = lmember_id;
	}

	public String getAlbum_credate()
	{
		return album_credate;
	}

	public void setAlbum_credate(String album_credate)
	{
		this.album_credate = album_credate;
	}

	public String getMember_name()
	{
		return member_name;
	}

	public void setMember_name(String member_name)
	{
		this.member_name = member_name;
	}

	public String getEvent_name()
	{
		return event_name;
	}

	public void setEvent_name(String event_name)
	{
		this.event_name = event_name;
	}

	public String getEveprofile_url()
	{
		return eveprofile_url;
	}

	public void setEveprofile_url(String eveprofile_url)
	{
		this.eveprofile_url = eveprofile_url;
	}
	
	
	
}
