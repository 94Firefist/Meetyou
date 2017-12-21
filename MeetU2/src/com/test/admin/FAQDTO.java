package com.test.admin;

public class FAQDTO
{
	// FAQ
	
	// 번호 제목 내용 작성자
	private String faqId, title, content, admin; 
	
	// 조회수
	private int hitcount;
		
	
		
	public String getFaqId()
	{
		return faqId;
	}

	public void setFaqId(String faqId)
	{
		this.faqId = faqId;
	}

	public String getAdmin()
	{
		return admin;
	}

	public void setAdmin(String admin)
	{
		this.admin = admin;
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

	public int getHitcount()
	{
		return hitcount;
	}

	public void setHitcount(int hitcount)
	{
		this.hitcount = hitcount;
	}
	
	
	
}
