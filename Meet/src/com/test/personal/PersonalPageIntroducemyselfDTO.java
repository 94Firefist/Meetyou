package com.test.personal;

public class PersonalPageIntroducemyselfDTO
{
	// 개인 정보
	
	// 개인번호, 개인그룹번호
	private String userNumber;
	
	// 이름, 생년월일, 연락처, 소개
	private String userName, userBir, userTel, userContent, userEmail;

	
	public String getUserEmail()
	{
		return userEmail;
	}

	public void setUserEmail(String userEmail)
	{
		this.userEmail = userEmail;
	}

	//
	public String getUserNumber()
	{
		return userNumber;
	}

	public void setUserNumber(String userNumber)
	{
		this.userNumber = userNumber;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getUserBir()
	{
		return userBir;
	}

	public void setUserBir(String userBir)
	{
		this.userBir = userBir;
	}

	public String getUserTel()
	{
		return userTel;
	}

	public void setUserTel(String userTel)
	{
		this.userTel = userTel;
	}

	public String getUserContent()
	{
		return userContent;
	}

	public void setUserContent(String userContent)
	{
		this.userContent = userContent;
	}

	
}
