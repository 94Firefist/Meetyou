package com.test.personal;

public class PersonalControlDTO
{
			//요청아이디   진짜아이디  메일          실제 이름    전화번호   친구리스트  그룹리스트   이메일        전화번호    생일       지역번호    지역이름  
	String lmember_id, member_realid, member_email, member_name, member_tel, public_fri, public_grl, public_email, public_tel, public_br, citype_id, city_name
	, category_content, mbcategory_id, category_code, member_info , member_birth;
	//관심사이름         내관심사아이디    관심사코드      자기소개  자기 생일
	public String getCategory_content()
	{
		return category_content;
	}

	public String getMember_birth()
	{
		return member_birth;
	}

	public void setMember_birth(String member_birth)
	{
		this.member_birth = member_birth;
	}

	public String getMember_info()
	{
		return member_info;
	}

	public void setMember_info(String member_info)
	{
		this.member_info = member_info;
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

	public void setCategory_content(String category_content)
	{
		this.category_content = category_content;
	}

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
	
	
}
