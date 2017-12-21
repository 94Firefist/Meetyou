package com.test.personal;

public class PersonalCheckDTO
{
	// 페이지 주인, 손님
	//private String host, guest;
	
	// 공개여부 (친구, 그룹, 이메일, 전화번호, 생년월일)	
	private int friendpublic, grouppublic, emailpublic, telpublic, birpublic;

	// 친구여부 (주인, 손님)
	private int friendcheck;
	
	// 같은 그룹번호
	private String sameGroup;
	
	// 개인주최 이벤트 공개여부
	//private String myeventcheck;
	
	
	
	public int getFriendcheck()
	{
		return friendcheck;
	}

	public String getSameGroup()
	{
		return sameGroup;
	}

	public void setSameGroup(String sameGroup)
	{
		this.sameGroup = sameGroup;
	}

	public void setFriendcheck(int friendcheck)
	{
		this.friendcheck = friendcheck;
	}

	public int getFriendpublic()
	{
		return friendpublic;
	}

	public void setFriendpublic(int friendpublic)
	{
		this.friendpublic = friendpublic;
	}

	public int getGrouppublic()
	{
		return grouppublic;
	}

	public void setGrouppublic(int grouppublic)
	{
		this.grouppublic = grouppublic;
	}

	public int getEmailpublic()
	{
		return emailpublic;
	}

	public void setEmailpublic(int emailpublic)
	{
		this.emailpublic = emailpublic;
	}

	public int getTelpublic()
	{
		return telpublic;
	}

	public void setTelpublic(int telpublic)
	{
		this.telpublic = telpublic;
	}

	public int getBirpublic()
	{
		return birpublic;
	}

	public void setBirpublic(int birpublic)
	{
		this.birpublic = birpublic;
	}
	
	
	
}
