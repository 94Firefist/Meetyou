package com.test.personal;

public class PersonalTimelineDTO
{
	// 타임라인
	
	// 개인 이벤트 주최
	// 번호 이름 주소 장소 날짜(월,일) 날짜(시,분) 참여자수 최대인원
	private String eventId, eventName, eventAddr, eventPlace, eventDate1, eventDate2, guestCount, maxGuestCount;
	// 공개 여부, 개최자
	private String eventOpen, eventHostId;
	
	
	
	
	//
	public String getEventHostId()
	{
		return eventHostId;
	}

	public void setEventHostId(String eventHostId)
	{
		this.eventHostId = eventHostId;
	}

	public String getEventOpen()
	{
		return eventOpen;
	}

	public void setEventOpen(String eventOpen)
	{
		this.eventOpen = eventOpen;
	}

	public String getEventId()
	{
		return eventId;
	}

	public void setEventId(String eventId)
	{
		this.eventId = eventId;
	}

	public String getEventName()
	{
		return eventName;
	}

	public void setEventName(String eventName)
	{
		this.eventName = eventName;
	}

	public String getEventAddr()
	{
		return eventAddr;
	}

	public void setEventAddr(String eventAddr)
	{
		this.eventAddr = eventAddr;
	}

	public String getEventPlace()
	{
		return eventPlace;
	}

	public void setEventPlace(String eventPlace)
	{
		this.eventPlace = eventPlace;
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

	public String getGuestCount()
	{
		return guestCount;
	}

	public void setGuestCount(String guestCount)
	{
		this.guestCount = guestCount;
	}

	public String getMaxGuestCount()
	{
		return maxGuestCount;
	}

	public void setMaxGuestCount(String maxGuestCount)
	{
		this.maxGuestCount = maxGuestCount;
	}
	

}
