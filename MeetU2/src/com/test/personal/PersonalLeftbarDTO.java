package com.test.personal;

public class PersonalLeftbarDTO
{
	// 개인 왼쪽 바
	
	// 이름, 친구수, 과거 MeetU, 관심사, 관심지역
	private String userNumber, name, friendCount, pastMeetCount, userTag, userCity;

	// 사진 주소
	private String profilePhoto;
	
	// 달력 추가...
	
	
	//
	public String getUserNumber()
	{
		return userNumber;
	}

	public String getProfilePhoto()
	{
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto)
	{
		this.profilePhoto = profilePhoto;
	}

	public void setUserNumber(String userNumber)
	{
		this.userNumber = userNumber;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getFriendCount()
	{
		return friendCount;
	}

	public void setFriendCount(String friendCount)
	{
		this.friendCount = friendCount;
	}

	public String getPastMeetCount()
	{
		return pastMeetCount;
	}

	public void setPastMeetCount(String pastMeetCount)
	{
		this.pastMeetCount = pastMeetCount;
	}

	public String getUserTag()
	{
		return userTag;
	}

	public void setUserTag(String userTag)
	{
		this.userTag = userTag;
	}

	public String getUserCity()
	{
		return userCity;
	}

	public void setUserCity(String userCity)
	{
		this.userCity = userCity;
	}
	

}
