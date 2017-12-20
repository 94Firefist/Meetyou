package com.test.admin;

public class ReportDTO2
{
	/* 신고접수에서 신고처리로 가기위한 속성
	(INSERT INTO REPPRO(REPPRO_ID, LMEMBER_ID(관리자), REPORT_ID, PANALTYPOL_ID, REPPRO_CONTENT, REPPRO_DATE)) */
	// 신고처리아이디(reppro_id), 신고접수아이디(report_id), 관리자아이디(limember_id)
	// 신고대상타입(leadertype_info), 신고유형(rep_type 도배,무분별 이벤트 등)
	// 신고내용(rep_content), 신고처리내용(reppro_content)
	// 신고제재(패널티정책아이디 rep_panalty)
	// 신고처리일자(reppro_date)
	private String rep_type, rep_content, rep_date, reppro_content, reppro_date;
	private String reppro_id, report_id, limember_id, lumember_id, leadertype_id;

	// 신고처리 제재유형(글쓰기 정지 등)/ 제재유형 기간(5일)/ 패널티정책(혐의점 없음 등)
	private String rep_panaltypol, rep_panalty, rep_day;
	
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


	public String getRep_panaltypol()
	{
		return rep_panaltypol;
	}


	public void setRep_panaltypol(String rep_panaltypol)
	{
		this.rep_panaltypol = rep_panaltypol;
	}


	public String getRep_panalty()
	{
		return rep_panalty;
	}


	public void setRep_panalty(String rep_panalty)
	{
		this.rep_panalty = rep_panalty;
	}


	public String getRep_day()
	{
		return rep_day;
	}


	public void setRep_day(String rep_day)
	{
		this.rep_day = rep_day;
	}
	
	
	
	
	
}
