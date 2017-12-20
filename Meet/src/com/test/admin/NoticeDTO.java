package com.test.admin;

public class NoticeDTO
{
	// 공지사항
	
	// 글번호, 제목, 작성일자, 작성자, 내용, 조회수
	private String noticeId, title, noticedate, adminid, content;
	private int hitcount;
	
	
	public String getAdminid()
	{
		return adminid;
	}
	public void setAdminid(String adminid)
	{
		this.adminid = adminid;
	}
	public String getNoticedate()
	{
		return noticedate;
	}
	public void setNoticedate(String noticedate)
	{
		this.noticedate = noticedate;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}

	public String getNoticeId()
	{
		return noticeId;
	}
	public void setNoticeId(String noticeId)
	{
		this.noticeId = noticeId;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public int getHitcount()
	{
		return hitcount;
	}
	public void setHitcount(int hitcount)
	{
		this.hitcount = hitcount;
	}
	
	
}
