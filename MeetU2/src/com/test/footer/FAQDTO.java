package com.test.footer;

public class FAQDTO
{
	// FAQ 리스트
	
	// 번호 제목 작성일 작성자 조회수, 내용
	private String no, title, faqDate, adminId, content;
	private int count;
	
	// 사용자 id
	private String userId;

	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
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
	public String getFaqDate()
	{
		return faqDate;
	}
	public void setFaqDate(String faqDate)
	{
		this.faqDate = faqDate;
	}
	public String getAdminId()
	{
		return adminId;
	}
	public void setAdminId(String adminId)
	{
		this.adminId = adminId;
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
