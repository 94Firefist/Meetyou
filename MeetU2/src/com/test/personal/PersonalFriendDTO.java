package com.test.personal;

public class PersonalFriendDTO
{
	// 친구
	// 번호 이름 사진
	private String friendId, friendName, friendPic;
	
	// 블랙
	// 번호 이름 사진 내용
	private String blackId, blackName, blackPic, blackContent;
	
	// 친구 신청
	// 번호 친구번호(친구) 이름(친구) 사진(친구)
	private String friendNo;		// friendId, friendName, friendPic
	private String sendState;
	// 친구 요청
	// 번호(친구신청) 이름(친구) 사진(친구)
	
	// 친구 신청 취소
	// 번호(친구번호)
	
	// 친구 신청 거절
	// 번호(친구번호)
	
	// 친구삭제
	// 번호(친구)
	
	// 블랙리스트 삭제
	// 번호(블랙)
	
	public String getSendState()
	{
		return sendState;
	}

	public void setSendState(String sendState)
	{
		this.sendState = sendState;
	}

	public String getFriendNo()
	{
		return friendNo;
	}

	public void setFriendNo(String friendNo)
	{
		this.friendNo = friendNo;
	}

	public String getBlackContent()
	{
		return blackContent;
	}

	public void setBlackContent(String blackContent)
	{
		this.blackContent = blackContent;
	}

	public String getBlackId()
	{
		return blackId;
	}

	public void setBlackId(String blackId)
	{
		this.blackId = blackId;
	}

	public String getBlackName()
	{
		return blackName;
	}

	public void setBlackName(String blackName)
	{
		this.blackName = blackName;
	}

	public String getBlackPic()
	{
		return blackPic;
	}

	public void setBlackPic(String blackPic)
	{
		this.blackPic = blackPic;
	}

	public String getFriendId()
	{
		return friendId;
	}

	public void setFriendId(String friendId)
	{
		this.friendId = friendId;
	}

	public String getFriendName()
	{
		return friendName;
	}

	public void setFriendName(String friendName)
	{
		this.friendName = friendName;
	}

	public String getFriendPic()
	{
		return friendPic;
	}

	public void setFriendPic(String friendPic)
	{
		this.friendPic = friendPic;
	}


}
