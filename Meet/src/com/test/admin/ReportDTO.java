package com.test.admin;

public class ReportDTO
{
	//신고처리아이디(reppro_id), 신고접수아이디(report_id), 신고자아이디(limember_id), 신고대상아이디(lumember_id)
	//신고대상타입(leadertype_info), 신고유형(rep_type), 신고내용(rep_content), 신고제재(패널티정책rep_panalty), 신고처리내용(reppro_content)
	//신고접수일자(rep_date), 처리일자(reppro_date)
	private String rep_type, rep_content, rep_date, reppro_content, reppro_date;
	private String reppro_id, report_id, limember_id, lumember_id, leadertype_id, rep_panalty;
	
	//신고대상타입에 대한 정보받기위한
	private String leadertype_info;
	//신고처리 제재유형 정보받기 위한
	private String rep_panaltypol;
	
	
	public String getRep_type()
	{
		return rep_type;
	}
	public void setRep_type(String rep_type)
	{
		this.rep_type = rep_type;
	}
	public String getRep_content()
	{
		return rep_content;
	}
	public void setRep_content(String rep_content)
	{
		this.rep_content = rep_content;
	}
	public String getRep_date()
	{
		return rep_date;
	}
	public void setRep_date(String rep_date)
	{
		this.rep_date = rep_date;
	}
	public String getReppro_content()
	{
		return reppro_content;
	}
	public void setReppro_content(String reppro_content)
	{
		this.reppro_content = reppro_content;
	}
	public String getReppro_date()
	{
		return reppro_date;
	}
	public void setReppro_date(String reppro_date)
	{
		this.reppro_date = reppro_date;
	}
	public String getReppro_id()
	{
		return reppro_id;
	}
	public void setReppro_id(String reppro_id)
	{
		this.reppro_id = reppro_id;
	}
	public String getReport_id()
	{
		return report_id;
	}
	public void setReport_id(String report_id)
	{
		this.report_id = report_id;
	}
	public String getLimember_id()
	{
		return limember_id;
	}
	public void setLimember_id(String limember_id)
	{
		this.limember_id = limember_id;
	}
	public String getLumember_id()
	{
		return lumember_id;
	}
	public void setLumember_id(String lumember_id)
	{
		this.lumember_id = lumember_id;
	}
	public String getLeadertype_id()
	{
		return leadertype_id;
	}
	public void setLeadertype_id(String leadertype_id)
	{
		this.leadertype_id = leadertype_id;
	}
	public String getRep_panalty()
	{
		return rep_panalty;
	}
	public void setRep_panalty(String rep_panalty)
	{
		this.rep_panalty = rep_panalty;
	}
	
	public String getLeadertype_info()
	{
		return leadertype_info;
	}
	public void setLeadertype_info(String leadertype_info)
	{
		this.leadertype_info = leadertype_info;
	}
	public String getRep_panaltypol()
	{
		return rep_panaltypol;
	}
	public void setRep_panaltypol(String rep_panaltypol)
	{
		this.rep_panaltypol = rep_panaltypol;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
