package com.test.dto;

public class MemberDTO
{
	private int lMember_id, member_admin, public_fri, public_grL, public_email, public_tel, public_br, eveAttend_id, member_age, blackGr_id;	 
	private String cityPe_id, member_join, member_realId, member_pw, member_email, member_name, member_tel, member_birth, member_gender, member_info, lGroup_id, grPower_id, grJoin_day, member_imageUrl, blackGr_reason;
	
	// 관심지역
	private String city_name;
	
	// 가입 그룹 수 
	private String joinGrCount;
	
	// 참석 이벤트 수
	private String atEvent;
	
	// 최근 이벤트 참석일
	private String curEveAttend;
	
	// 최근 로그인 기록
	private String curLogIn;
	
	// 페이지 주인, 손님
	//private String host, guest;
	
	// 공개여부 (친구, 그룹, 이메일, 전화번호, 생년월일)	
	private int friendPublic, groupPublic, emailPublic, telPublic, birPublic;

	// 친구여부 (주인, 손님)
	private int friendCheck;
	
	// 같은 그룹번호
	private String sameGroup;
	
	// 개인주최 이벤트 공개여부
	//private String myeventcheck;
	
	private String category_content, mbCategory_id, category_code;
    //         내관심사아이디    관심사코드      자기소개  자기 생일

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
	String mbPublicTi_id, group_name, grProfile_url;

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
	
	public int getlMember_id()
	{
		return lMember_id;
	}
	public void setlMember_id(int lMember_id)
	{
		this.lMember_id = lMember_id;
	}
	public int getMember_admin()
	{
		return member_admin;
	}
	public void setMember_admin(int member_admin)
	{
		this.member_admin = member_admin;
	}
	public int getPublic_fri()
	{
		return public_fri;
	}
	public void setPublic_fri(int public_fri)
	{
		this.public_fri = public_fri;
	}
	public int getPublic_grL()
	{
		return public_grL;
	}
	public void setPublic_grL(int public_grL)
	{
		this.public_grL = public_grL;
	}
	public int getPublic_email()
	{
		return public_email;
	}
	public void setPublic_email(int public_email)
	{
		this.public_email = public_email;
	}
	public int getPublic_tel()
	{
		return public_tel;
	}
	public void setPublic_tel(int public_tel)
	{
		this.public_tel = public_tel;
	}
	public int getPublic_br()
	{
		return public_br;
	}
	public void setPublic_br(int public_br)
	{
		this.public_br = public_br;
	}
	public int getEveAttend_id()
	{
		return eveAttend_id;
	}
	public void setEveAttend_id(int eveAttend_id)
	{
		this.eveAttend_id = eveAttend_id;
	}
	public int getMember_age()
	{
		return member_age;
	}
	public void setMember_age(int member_age)
	{
		this.member_age = member_age;
	}
	public int getBlackGr_id()
	{
		return blackGr_id;
	}
	public void setBlackGr_id(int blackGr_id)
	{
		this.blackGr_id = blackGr_id;
	}
	public String getCityPe_id()
	{
		return cityPe_id;
	}
	public void setCityPe_id(String cityPe_id)
	{
		this.cityPe_id = cityPe_id;
	}
	public String getMember_join()
	{
		return member_join;
	}
	public void setMember_join(String member_join)
	{
		this.member_join = member_join;
	}
	public String getMember_realId()
	{
		return member_realId;
	}
	public void setMember_realId(String member_realId)
	{
		this.member_realId = member_realId;
	}
	public String getMember_pw()
	{
		return member_pw;
	}
	public void setMember_pw(String member_pw)
	{
		this.member_pw = member_pw;
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
	public String getMember_birth()
	{
		return member_birth;
	}
	public void setMember_birth(String member_birth)
	{
		this.member_birth = member_birth;
	}
	public String getMember_gender()
	{
		return member_gender;
	}
	public void setMember_gender(String member_gender)
	{
		this.member_gender = member_gender;
	}
	public String getMember_info()
	{
		return member_info;
	}
	public void setMember_info(String member_info)
	{
		this.member_info = member_info;
	}
	public String getlGroup_id()
	{
		return lGroup_id;
	}
	public void setlGroup_id(String lGroup_id)
	{
		this.lGroup_id = lGroup_id;
	}
	public String getGrPower_id()
	{
		return grPower_id;
	}
	public void setGrPower_id(String grPower_id)
	{
		this.grPower_id = grPower_id;
	}
	public String getGrJoin_day()
	{
		return grJoin_day;
	}
	public void setGrJoin_day(String grJoin_day)
	{
		this.grJoin_day = grJoin_day;
	}
	public String getMember_imageUrl()
	{
		return member_imageUrl;
	}
	public void setMember_imageUrl(String member_imageUrl)
	{
		this.member_imageUrl = member_imageUrl;
	}
	public String getBlackGr_reason()
	{
		return blackGr_reason;
	}
	public void setBlackGr_reason(String blackGr_reason)
	{
		this.blackGr_reason = blackGr_reason;
	}
	public String getCity_name()
	{
		return city_name;
	}
	public void setCity_name(String city_name)
	{
		this.city_name = city_name;
	}
	public String getJoinGrCount()
	{
		return joinGrCount;
	}
	public void setJoinGrCount(String joinGrCount)
	{
		this.joinGrCount = joinGrCount;
	}
	public String getAtEvent()
	{
		return atEvent;
	}
	public void setAtEvent(String atEvent)
	{
		this.atEvent = atEvent;
	}
	public String getCurEveAttend()
	{
		return curEveAttend;
	}
	public void setCurEveAttend(String curEveAttend)
	{
		this.curEveAttend = curEveAttend;
	}
	public String getCurLogIn()
	{
		return curLogIn;
	}
	public void setCurLogIn(String curLogIn)
	{
		this.curLogIn = curLogIn;
	}
	public int getFriendPublic()
	{
		return friendPublic;
	}
	public void setFriendPublic(int friendPublic)
	{
		this.friendPublic = friendPublic;
	}
	public int getGroupPublic()
	{
		return groupPublic;
	}
	public void setGroupPublic(int groupPublic)
	{
		this.groupPublic = groupPublic;
	}
	public int getEmailPublic()
	{
		return emailPublic;
	}
	public void setEmailPublic(int emailPublic)
	{
		this.emailPublic = emailPublic;
	}
	public int getTelPublic()
	{
		return telPublic;
	}
	public void setTelPublic(int telPublic)
	{
		this.telPublic = telPublic;
	}
	public int getBirPublic()
	{
		return birPublic;
	}
	public void setBirPublic(int birPublic)
	{
		this.birPublic = birPublic;
	}
	public int getFriendCheck()
	{
		return friendCheck;
	}
	public void setFriendCheck(int friendCheck)
	{
		this.friendCheck = friendCheck;
	}
	public String getSameGroup()
	{
		return sameGroup;
	}
	public void setSameGroup(String sameGroup)
	{
		this.sameGroup = sameGroup;
	}
	public String getCategory_content()
	{
		return category_content;
	}
	public void setCategory_content(String category_content)
	{
		this.category_content = category_content;
	}
	public String getMbCategory_id()
	{
		return mbCategory_id;
	}
	public void setMbCategory_id(String mbCategory_id)
	{
		this.mbCategory_id = mbCategory_id;
	}
	public String getCategory_code()
	{
		return category_code;
	}
	public void setCategory_code(String category_code)
	{
		this.category_code = category_code;
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
	public String getMbPublicTi_id()
	{
		return mbPublicTi_id;
	}
	public void setMbPublicTi_id(String mbPublicTi_id)
	{
		this.mbPublicTi_id = mbPublicTi_id;
	}
	public String getGroup_name()
	{
		return group_name;
	}
	public void setGroup_name(String group_name)
	{
		this.group_name = group_name;
	}
	public String getGrProfile_url()
	{
		return grProfile_url;
	}
	public void setGrProfile_url(String grProfile_url)
	{
		this.grProfile_url = grProfile_url;
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
	
}
