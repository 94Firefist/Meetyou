package com.test.dto;

public class PersonalDTO
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
	
	//요청아이디   진짜아이디  메일          실제 이름    전화번호   친구리스트  그룹리스트   이메일        전화번호    생일       지역번호    지역이름  
	private String lmember_id, member_realid, member_email, member_name, member_tel, public_fri, public_grl, public_email, public_tel, public_br
			, citype_id, city_name, category_content, mbcategory_id, category_code, member_info , member_birth;
//관심사이름         내관심사아이디    관심사코드      자기소개  자기 생일

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
	//그룹아이디   홈피주인     공개여부       그룹이름     그룹 프로필사진 그룹권한
	String lgroup_id, mbpublicti_id, group_name, grprofile_url, grpower_id;

	// 개인번호, 개인그룹번호
	private String userNumber, groupNumber;
	
	// 이름, 주소, 상세주소, 이벤트일자, 소개내용
	private String eventName, address, mainAddr, eventDate1, eventDate2, userContent;
	
	// 참여인원, 최대인원
	private int guestCount, maxCount;

	// 개인 왼쪽 바
	
	// 이름, 친구수, 과거 MeetU, 관심사, 관심지역
	private String name, friendCount, pastMeetCount, userTag, userCity;

	// 사진 주소
	private String profilePhoto;
	
	// 달력 추가...
	
	// 개인 정보
	
	
	// 이름, 생년월일, 연락처, 소개
	private String userName, userBir, userTel, userEmail;
	// 타임라인
						
	// 개인 이벤트 주최
	// 번호 이름 주소 장소 날짜(월,일) 날짜(시,분) 참여자수 최대인원
	private String eventId, eventAddr, eventPlace, maxGuestCount;
	// 공개 여부, 개최자
	private String eventOpen, eventHostId;
	
	
	
	
	public String getLmember_id()
	{
		return lmember_id;
	}

	public void setLmember_id(String lmember_id)
	{
		this.lmember_id = lmember_id;
	}

	public String getMember_realid()
	{
		return member_realid;
	}

	public void setMember_realid(String member_realid)
	{
		this.member_realid = member_realid;
	}

	public String getMember_email()
	{
		return member_email;
	}

	public void setMember_email(String member_email)
	{
		this.member_email = member_email;
	}

	public String getMember_name()
	{
		return member_name;
	}

	public void setMember_name(String member_name)
	{
		this.member_name = member_name;
	}

	public String getMember_tel()
	{
		return member_tel;
	}

	public void setMember_tel(String member_tel)
	{
		this.member_tel = member_tel;
	}

	public String getPublic_fri()
	{
		return public_fri;
	}

	public void setPublic_fri(String public_fri)
	{
		this.public_fri = public_fri;
	}

	public String getPublic_grl()
	{
		return public_grl;
	}

	public void setPublic_grl(String public_grl)
	{
		this.public_grl = public_grl;
	}

	public String getPublic_email()
	{
		return public_email;
	}

	public void setPublic_email(String public_email)
	{
		this.public_email = public_email;
	}

	public String getPublic_tel()
	{
		return public_tel;
	}

	public void setPublic_tel(String public_tel)
	{
		this.public_tel = public_tel;
	}

	public String getPublic_br()
	{
		return public_br;
	}

	public void setPublic_br(String public_br)
	{
		this.public_br = public_br;
	}

	public String getCitype_id()
	{
		return citype_id;
	}

	public void setCitype_id(String citype_id)
	{
		this.citype_id = citype_id;
	}

	public String getCity_name()
	{
		return city_name;
	}

	public void setCity_name(String city_name)
	{
		this.city_name = city_name;
	}

	public String getCategory_content()
	{
		return category_content;
	}

	public void setCategory_content(String category_content)
	{
		this.category_content = category_content;
	}

	public String getMbcategory_id()
	{
		return mbcategory_id;
	}

	public void setMbcategory_id(String mbcategory_id)
	{
		this.mbcategory_id = mbcategory_id;
	}

	public String getCategory_code()
	{
		return category_code;
	}

	public void setCategory_code(String category_code)
	{
		this.category_code = category_code;
	}

	public String getMember_info()
	{
		return member_info;
	}

	public void setMember_info(String member_info)
	{
		this.member_info = member_info;
	}

	public String getMember_birth()
	{
		return member_birth;
	}

	public void setMember_birth(String member_birth)
	{
		this.member_birth = member_birth;
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

	public String getBlackContent()
	{
		return blackContent;
	}

	public void setBlackContent(String blackContent)
	{
		this.blackContent = blackContent;
	}

	public String getFriendNo()
	{
		return friendNo;
	}

	public void setFriendNo(String friendNo)
	{
		this.friendNo = friendNo;
	}

	public String getSendState()
	{
		return sendState;
	}

	public void setSendState(String sendState)
	{
		this.sendState = sendState;
	}

	public String getLgroup_id()
	{
		return lgroup_id;
	}

	public void setLgroup_id(String lgroup_id)
	{
		this.lgroup_id = lgroup_id;
	}

	public String getMbpublicti_id()
	{
		return mbpublicti_id;
	}

	public void setMbpublicti_id(String mbpublicti_id)
	{
		this.mbpublicti_id = mbpublicti_id;
	}

	public String getGroup_name()
	{
		return group_name;
	}

	public void setGroup_name(String group_name)
	{
		this.group_name = group_name;
	}

	public String getGrprofile_url()
	{
		return grprofile_url;
	}

	public void setGrprofile_url(String grprofile_url)
	{
		this.grprofile_url = grprofile_url;
	}

	public String getGrpower_id()
	{
		return grpower_id;
	}

	public void setGrpower_id(String grpower_id)
	{
		this.grpower_id = grpower_id;
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

	public String getUserContent()
	{
		return userContent;
	}

	public void setUserContent(String userContent)
	{
		this.userContent = userContent;
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

	public String getProfilePhoto()
	{
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto)
	{
		this.profilePhoto = profilePhoto;
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

	public String getUserEmail()
	{
		return userEmail;
	}

	public void setUserEmail(String userEmail)
	{
		this.userEmail = userEmail;
	}

	public String getEventId()
	{
		return eventId;
	}

	public void setEventId(String eventId)
	{
		this.eventId = eventId;
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

	public String getMaxGuestCount()
	{
		return maxGuestCount;
	}

	public void setMaxGuestCount(String maxGuestCount)
	{
		this.maxGuestCount = maxGuestCount;
	}

	public String getEventOpen()
	{
		return eventOpen;
	}

	public void setEventOpen(String eventOpen)
	{
		this.eventOpen = eventOpen;
	}

	public String getEventHostId()
	{
		return eventHostId;
	}

	public void setEventHostId(String eventHostId)
	{
		this.eventHostId = eventHostId;
	}

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
