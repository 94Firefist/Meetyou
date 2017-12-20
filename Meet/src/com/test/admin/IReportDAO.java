package com.test.admin;

import java.sql.SQLException;
import java.util.ArrayList;

//<접수>
//1.신고접수 정보(신고접수아이디, 신고자아이디, 신고대상아이디, 신고유형, 신고내용, 신고일자, 신고대상타입)
//reportList()

//1-1 신고접수번호에 따른 정보 (신고유형, 신고접수일자, 신고대상내용) 
// reportList2(String report_id)
//1-2 신고접수번호에 따른 정보삭제
// reportDel(String report_id)


//2.신고자아이디에 따른 신고접수정보 출력(VREPINFO)
//searchrepId(String limember_id)

//4.신고대상타입에 따른 신고접수정보 정렬/출력 
//searchRep(String leadertype_info)
//5.검색된 신고처리 
//proCount()
//6.신고자와 신고대상타입이 선택됐을 때 신고접수정보 출력
//reportList3(String limember_id, String leadertype_info)
//7.신고접수번호에 따라 선택된 신고접수 처리를 위한 액션처리
//reportSelList(String report_id, )
/*모달1에서 제재유형 옵션 뿌리기 위한 액션처리*/
//public String[] panaltyOption() throws SQLException, ClassNotFoundException;

//<처리>
//1.처리된 신고의 정보 (신고접수아이디, 신고자아이디,  신고대상타입, 신고제재(패널티정책id/PENALTY), 신고처리내용(PENALTYTYPE_CONTENT), 신고접수일자, 처리일자)
//repproList()
//2.신고자아이디에 따른 신고처리정보 출력(VREPPROINFO)
//searchProId(String limember_id)
//3.신고제재(패널티정책)에 따른 신고처리정보 정렬/출력
//searchPanId(String rep_panalty)
//4.신고대상타입에 따른 신고처리정보 정렬/출력 
//searchProId(String leadertype_info)
//5.검색된 신고접수 repCount()
//6.신고자아아디, 신고대상타입아이디, 제재내용 에 따른 신고처리 리스트 출력/정렬
//allOptionPro(String limember_id, String limember_id,String rep_panalty)


//<공통>
//1.신고접수 또는 신고처리시 신고대상타입 옵션 뿌려주기
//optionList1()
//2.신고접수 또는 신고처리시 신고유형 옵션 뿌려주기
//optionList2()
//3.신고접수/처리시 제재유형 옵션 뿌려주기
//optionList3()

public interface IReportDAO
{
	public ArrayList<ReportDTO> reportList() throws SQLException, ClassNotFoundException;
	public ReportDTO reportList2(String report_id) throws SQLException, ClassNotFoundException;
	public ArrayList<ReportDTO> searchRepId(String limember_id) throws SQLException, ClassNotFoundException;
	public ArrayList<ReportDTO> searchUtypeId(String leadertype_id) throws SQLException, ClassNotFoundException;
	public int repCount() throws SQLException, ClassNotFoundException;
	public ArrayList<ReportDTO> reportList3(String limember_id, String leadertype_id) throws SQLException, ClassNotFoundException;
	
	//public String[] panaltyOption() throws SQLException, ClassNotFoundException;
	
	public ArrayList<ReportDTO> repproList() throws SQLException, ClassNotFoundException;
	public ReportDTO searchProId(String reppro_id) throws SQLException, ClassNotFoundException;
	public ReportDTO searchPanId(String rep_panalty) throws SQLException, ClassNotFoundException;
	public ArrayList<ReportDTO> searchLTId(String leadertype_id) throws SQLException, ClassNotFoundException;
	public int proCount() throws SQLException, ClassNotFoundException;
	public ArrayList<ReportDTO> allOptionPro(String limember_id, String leadertype_id,String rep_panalty) throws SQLException, ClassNotFoundException;
	

	public ArrayList<ReportDTO> optionList1() throws SQLException, ClassNotFoundException;
	public ArrayList<ReportDTO> optionList2() throws SQLException, ClassNotFoundException;
	public ArrayList<ReportDTO> optionList3() throws SQLException, ClassNotFoundException;
}
