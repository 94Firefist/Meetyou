package com.test.admin;

import java.sql.SQLException;

public interface IReportDAO2
{
	/*선택된 신고접수 처리를 위한 액션처리*/
	public int reportSelList(ReportDTO2 dto2) throws SQLException, ClassNotFoundException;
	/*신고처리 리스트에서 특정 신고처리상세내용 열람 */
	public ReportDTO2 proDetailId(String reppro_id) throws SQLException, ClassNotFoundException;
	
	
}
