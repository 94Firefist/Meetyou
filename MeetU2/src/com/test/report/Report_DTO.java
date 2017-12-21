package com.test.report;

public class Report_DTO
{
			//신고사유이름  신고상세이유   신고일
	String reptype_name,  report_reason, report_date; 
	
		//신고사유아이디 //신고유형    //신고사유코드        신고아이디  신고자       신고당한사람
	int reptype_id,      leadertype_id, reptype_name_code , report_id, limember_id, lumember_id;

	public String getReport_reason()
	{
		return report_reason;
	}

	public void setReport_reason(String report_reason)
	{
		this.report_reason = report_reason;
	}

	public String getReport_date()
	{
		return report_date;
	}

	public void setReport_date(String report_date)
	{
		this.report_date = report_date;
	}

	public int getReport_id()
	{
		return report_id;
	}

	public void setReport_id(int report_id)
	{
		this.report_id = report_id;
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

	public String getReptype_name()
	{
		return reptype_name;
	}

	public void setReptype_name(String reptype_name)
	{
		this.reptype_name = reptype_name;
	}

	public int getReptype_id()
	{
		return reptype_id;
	}

	public void setReptype_id(int reptype_id)
	{
		this.reptype_id = reptype_id;
	}

	public int getLeadertype_id()
	{
		return leadertype_id;
	}

	public void setLeadertype_id(int leadertype_id)
	{
		this.leadertype_id = leadertype_id;
	}

	public int getReptype_name_code()
	{
		return reptype_name_code;
	}

	public void setReptype_name_code(int reptype_name_code)
	{
		this.reptype_name_code = reptype_name_code;
	}
	
	
	
	
	
}
