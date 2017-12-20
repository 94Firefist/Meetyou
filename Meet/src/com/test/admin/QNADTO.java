package com.test.admin;

public class QNADTO
{
	// QNA
	
	// 글번호, 제목, 작성일자, 작성자명(사용자), 처리여부, 내용, 작성자(관리자)
	private String qnaId, title, qnaDate, userName, handling, content, admin, rownumber;

	public String getRownumber()
	{
		return rownumber;
	}

	public void setRownumber(String rownumber)
	{
		this.rownumber = rownumber;
	}

	public String getQnaId()
	{
		return qnaId;
	}

	public void setQnaId(String qnaId)
	{
		this.qnaId = qnaId;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getQnaDate()
	{
		return qnaDate;
	}

	public void setQnaDate(String qnaDate)
	{
		this.qnaDate = qnaDate;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getHandling()
	{
		return handling;
	}

	public void setHandling(String handling)
	{
		this.handling = handling;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getAdmin()
	{
		return admin;
	}

	public void setAdmin(String admin)
	{
		this.admin = admin;
	}
	
	
}
