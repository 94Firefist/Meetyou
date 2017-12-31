package com.test.dto;

public class NoticeDTO
{
	// 공지사항 리스트 & 상세 내용
	
	// 번호 제목 작성일 조회수
	// (제목) 글쓴이 (작성일) 내용
	private String no, title, noticeDate, adminId, content;
	private int count;
	
	
	//
	public String getAdminId()
	{
		return adminId;
	}
	public void setAdminId(String adminId)
	{
		this.adminId = adminId;
	}
	public String getNoticeDate()
	{
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate)
	{
		this.noticeDate = noticeDate;
	}
	public String getNo()
	{
		return no;
	}
	public void setNo(String no)
	{
		this.no = no;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public int getCount()
	{
		return count;
	}
	public void setCount(int count)
	{
		this.count = count;
	}
	
	
	
}
