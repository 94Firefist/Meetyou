package com.test.message;

public class Message_DTO
{
	//      보낸사람 이름,  받는 사람 이름, 보낸 날짜,     보낸사람 삭제일, 받는사람 확인일, 받는사람 삭제일 
	String limember_name,  lumember_name, mbtextsend_date, mbtextdel_date, mbtextre_date, mbtextre_deldate
    ,mbtextsend_title,    mbtextsend_content , limember_realid, lumember_realid, lgroup_id;
			//메시지 제목    , 메시지 내용      보낸사람아이디,  받은 사람 아이디 
	
	//쪽지 고유번호 , 메시지 보내는 사람 고유아이디, 메시지 받는 상대 
	int  lmbtextsend_id, limember_id, lumember_id;

	public String getLgroup_id()
	{
		return lgroup_id;
	}

	public void setLgroup_id(String lgroup_id)
	{
		this.lgroup_id = lgroup_id;
	}

	public String getLimember_realid()
	{
		return limember_realid;
	}

	public int getLmbtextsend_id()
	{
		return lmbtextsend_id;
	}

	public void setLmbtextsend_id(int lmbtextsend_id)
	{
		this.lmbtextsend_id = lmbtextsend_id;
	}

	public void setLimember_realid(String limember_realid)
	{
		this.limember_realid = limember_realid;
	}

	public String getLumember_realid()
	{
		return lumember_realid;
	}

	public void setLumember_realid(String lumember_realid)
	{
		this.lumember_realid = lumember_realid;
	}

	public String getLimember_name()
	{
		return limember_name;
	}

	public void setLimember_name(String limember_name)
	{
		this.limember_name = limember_name;
	}

	public String getLumember_name()
	{
		return lumember_name;
	}

	public void setLumember_name(String lumember_name)
	{
		this.lumember_name = lumember_name;
	}

	public String getMbtextsend_date()
	{
		return mbtextsend_date;
	}

	public void setMbtextsend_date(String mbtextsend_date)
	{
		this.mbtextsend_date = mbtextsend_date;
	}

	public String getMbtextdel_date()
	{
		return mbtextdel_date;
	}

	public void setMbtextdel_date(String mbtextdel_date)
	{
		this.mbtextdel_date = mbtextdel_date;
	}

	public String getMbtextre_date()
	{
		return mbtextre_date;
	}

	public void setMbtextre_date(String mbtextre_date)
	{
		this.mbtextre_date = mbtextre_date;
	}

	public String getMbtextre_deldate()
	{
		return mbtextre_deldate;
	}

	public void setMbtextre_deldate(String mbtextre_deldate)
	{
		this.mbtextre_deldate = mbtextre_deldate;
	}

	public String getMbtextsend_title()
	{
		return mbtextsend_title;
	}

	public void setMbtextsend_title(String mbtextsend_title)
	{
		this.mbtextsend_title = mbtextsend_title;
	}

	public String getMbtextsend_content()
	{
		return mbtextsend_content;
	}

	public void setMbtextsend_content(String mbtextsend_content)
	{
		this.mbtextsend_content = mbtextsend_content;
	}

	

	public int getLimember_id()
	{
		return limember_id;
	}

	public void setLimember_id(int limember_id)
	{
		this.limember_id = limember_id;
	}

	public int getLumember_id()
	{
		return lumember_id;
	}

	public void setLumember_id(int lumember_id)
	{
		this.lumember_id = lumember_id;
	}

}
