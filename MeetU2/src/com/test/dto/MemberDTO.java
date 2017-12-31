package com.test.dto;

public class MemberDTO
{
	private int lmember_id, member_admin, public_fri, public_grl, public_email, public_tel, public_br, eveattend_id, member_age, blackgr_id;	 
	private String citype_id, member_join, member_realid, member_pw, member_email, member_name, member_tel, member_birth, member_gender, member_info, lgroup_id, grpower_id, grjoin_day, member_imageUrl, blackgr_reason;
	
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
	public String getMember_join()
	{
		return member_join;
	}
	public void setMember_join(String member_join)
	{
		this.member_join = member_join;
	}
	public String getJoinGrCount()
	{
		return joinGrCount;
	}
	public void setJoinGrCount(String joinGrCount)
	{
		this.joinGrCount = joinGrCount;
	}
	public String getCity_name()
	{
		return city_name;
	}
	public void setCity_name(String city_name)
	{
		this.city_name = city_name;
	}
	public String getBlackgr_reason()
	{
		return blackgr_reason;
	}
	public void setBlackgr_reason(String blackgr_reason)
	{
		this.blackgr_reason = blackgr_reason;
	}
	public int getBlackgr_id()
	{
		return blackgr_id;
	}
	public void setBlackgr_id(int blackgr_id)
	{
		this.blackgr_id = blackgr_id;
	}
	
	public int getMember_age()
	{
		return member_age;
	}
	public void setMember_age(int member_age)
	{
		this.member_age = member_age;
	}
	
	public int getEveattend_id()
	{
		return eveattend_id;
	}
	public void setEveattend_id(int eveattend_id)
	{
		this.eveattend_id = eveattend_id;
	}
	public String getCitype_id()
	{
		return citype_id;
	}
	public void setCitype_id(String citype_id)
	{
		this.citype_id = citype_id;
	}
	public String getLgroup_id()
	{
		return lgroup_id;
	}
	public void setLgroup_id(String lgroup_id)
	{
		this.lgroup_id = lgroup_id;
	}
	public String getGrpower_id()
	{
		return grpower_id;
	}
	public void setGrpower_id(String grpower_id)
	{
		this.grpower_id = grpower_id;
	}
	public String getGrjoin_day()
	{
		return grjoin_day;
	}
	public void setGrjoin_day(String grjoin_day)
	{
		this.grjoin_day = grjoin_day;
	}
	public String getMember_imageUrl()
	{
		return member_imageUrl;
	}
	public void setMember_imageUrl(String member_imageUrl)
	{
		this.member_imageUrl = member_imageUrl;
	}
	public int getLmember_id()
	{
		return lmember_id;
	}
	public void setLmember_id(int lmember_id)
	{
		this.lmember_id = lmember_id;
	}
	public String getCity_code()
	{
		return citype_id;
	}
	public void setCity_code(String city_code)
	{
		this.citype_id = city_code;
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
	public int getPublic_grl()
	{
		return public_grl;
	}
	public void setPublic_grl(int public_grl)
	{
		this.public_grl = public_grl;
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
	public String getMember_realid()
	{
		return member_realid;
	}
	public void setMember_realid(String member_realid)
	{
		this.member_realid = member_realid;
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
	
	

	
}
