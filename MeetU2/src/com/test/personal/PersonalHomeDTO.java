package com.test.personal;

public class PersonalHomeDTO
{
	// 개인번호, 개인그룹번호
	private String userNumber, groupNumber;
	
	// 이름, 주소, 상세주소, 이벤트일자, 소개내용
	private String eventName, address, mainAddr, eventDate1, eventDate2, userContent;
	
	// 참여인원, 최대인원
	private int guestCount, maxCount;

	//
	public String getUserContent()
	{
		return userContent;
	}
	public void setUserContent(String userContent)
	{
		this.userContent = userContent;
	}
	public String getUserNumber()
	{
		return userNumber;
	}
	public void setUserNumber(String userNumber)
	{
		this.userNumber = userNumber;
	}
	public String getGroupNumber()
	{
		return groupNumber;
	}
	public void setGroupNumber(String groupNumber)
	{
		this.groupNumber = groupNumber;
	}
	public String getEventName()
	{
		return eventName;
	}
	public void setEventName(String eventName)
	{
		this.eventName = eventName;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public String getMainAddr()
	{
		return mainAddr;
	}
	public void setMainAddr(String mainAddr)
	{
		this.mainAddr = mainAddr;
	}
	public String getEventDate1()
	{
		return eventDate1;
	}
	public void setEventDate1(String eventDate1)
	{
		this.eventDate1 = eventDate1;
	}
	public String getEventDate2()
	{
		return eventDate2;
	}
	public void setEventDate2(String eventDate2)
	{
		this.eventDate2 = eventDate2;
	}
	public int getGuestCount()
	{
		return guestCount;
	}
	public void setGuestCount(int guestCount)
	{
		this.guestCount = guestCount;
	}
	public int getMaxCount()
	{
		return maxCount;
	}
	public void setMaxCount(int maxCount)
	{
		this.maxCount = maxCount;
	}
	
	
	
}
