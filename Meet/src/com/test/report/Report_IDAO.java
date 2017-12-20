package com.test.report;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public interface Report_IDAO
{
	//메시지 신고하기에서 신고사유 리스트 뿌려주기 
	public ArrayList<Report_DTO> msgReportlist() throws SQLException, ClassNotFoundException;
	
	//실제로 신고하기 
	public void msgReport(HashMap<String, Object> hashmap) throws SQLException, ClassNotFoundException;
	
	
}
