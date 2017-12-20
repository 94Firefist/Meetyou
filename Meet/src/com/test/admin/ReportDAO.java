package com.test.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ReportDAO implements IReportDAO
{
	// 인터페이스 자료형을 속성으로 구성
	private DataSource dataSource;

	// setter 구성
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// 신고접수 리스트 출력
	@Override
	public ArrayList<ReportDTO> reportList() throws SQLException, ClassNotFoundException
	{
		ArrayList<ReportDTO> result = new ArrayList<ReportDTO>();
		Connection conn = dataSource.getConnection();
		String sql = "SELECT R.REPORT_ID AS \"신고접수아이디\""
				+ ", R.LIMEMBER_ID AS \"신고자아이디\""
				+ ", R.LUMEMBER_ID AS \"신고대상아이디\""
				+ ",LT.LEADERTYPE_INFO AS \"신고대상타입\""
				+ ",LT.LEADERTYPE_ID AS \"신고대상타입아이디\""
				+ ",RN.REPTYPE_NAME  AS \"신고유형\""
				+ ", R.REPORT_REASON AS \"신고상세내용\""
				+ ",TO_CHAR(R.REPORT_DATE, 'YYYY-MM-DD') AS \"신고접수일자\""
				+ " FROM REPORT R JOIN REPTYPE T"
				+ " ON R.REPTYPE_ID = T.REPTYPE_ID"
				+ " JOIN REPTYPE_NAME RN "
				+ " ON RN.REPTYPE_NAME_CODE = T.REPTYPE_NAME_CODE"
				+ " JOIN LEADERNUM LN ON LN.LEADERNUM_ID=R.LUMEMBER_ID"
				+ " JOIN LEADERTYPE LT ON LT.LEADERTYPE_ID = LN.LEADERTYPE_ID"
				+ " JOIN VIEW_REPORT VR ON R.REPORT_ID = VR.REPORT_ID WHERE VR.HANDLING='0'"
				+ " ORDER BY R.REPORT_ID";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			ReportDTO dto = new ReportDTO();

			dto.setReport_id(rs.getString("신고접수아이디"));
			dto.setLimember_id(rs.getString("신고자아이디"));
			dto.setLumember_id(rs.getString("신고대상아이디"));
			dto.setLeadertype_id(rs.getString("신고대상타입"));
			dto.setRep_type(rs.getString("신고유형"));
			dto.setRep_content(rs.getString("신고상세내용"));
			dto.setRep_date(rs.getString("신고접수일자"));

			result.add(dto);
		}

		return result;
	}

	//1-1 신고접수번호에 따른 상세정보 (신고유형, 신고접수일자, 신고대상내용) 
	@Override
	public ReportDTO reportList2(String report_id) throws SQLException, ClassNotFoundException
	{
		ReportDTO result = new ReportDTO();
		Connection conn = dataSource.getConnection();
		String sql ="SELECT RN.REPTYPE_NAME AS 신고유형, R.REPORT_REASON AS 신고상세내용"
				+ ",TO_CHAR(R.REPORT_DATE, 'YYYY-MM-DD') AS 신고접수일자"
				+ " FROM REPORT R JOIN REPTYPE T ON R.REPTYPE_ID = T.REPTYPE_ID"
				+ " JOIN REPTYPE_NAME RN ON T.REPTYPE_NAME_CODE = RN.REPTYPE_NAME_CODE"
				+ " JOIN LEADERNUM LN ON LN.LEADERNUM_ID=R.LUMEMBER_ID JOIN"
				+ " LEADERTYPE LT ON LT.LEADERTYPE_ID = LN.LEADERTYPE_ID"
				+ " WHERE R.REPORT_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, report_id);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result.setRep_type(rs.getString("신고유형"));
			result.setRep_content(rs.getString("신고상세내용"));
			result.setRep_date(rs.getString("신고접수일자"));
		}
		
		return result;
			
	}
	
	
	// 신고자아이디에 따른 신고접수정보출력
	@Override
	public ArrayList<ReportDTO> searchRepId(String limember_id) throws SQLException, ClassNotFoundException
	{
		ArrayList<ReportDTO> result = new ArrayList<ReportDTO>();
		Connection conn = dataSource.getConnection();
		String sql = "SELECT* FROM VREPINFO WHERE \"신고자아이디\"=? AND HANDLING='0'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, limember_id);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			ReportDTO dto = new ReportDTO();
			
			 dto.setReport_id(rs.getString("신고접수아이디"));
			 dto.setLimember_id(rs.getString("신고자아이디"));
			 dto.setLumember_id(rs.getString("신고대상아이디"));
			 dto.setLeadertype_id(rs.getString("신고대상타입"));
			 dto.setRep_type(rs.getString("신고유형"));
			 dto.setRep_content(rs.getString("신고상세내용"));
			 dto.setRep_date(rs.getString("신고접수일자"));
			 
			 result.add(dto);
			 
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}

	
	//신고대상타입에 따른 신고접수 리스트 정렬
	@Override
	public ArrayList<ReportDTO> searchUtypeId(String leadertype_id) throws SQLException, ClassNotFoundException
	{
		ArrayList<ReportDTO> result = new ArrayList<ReportDTO>();
		Connection conn = dataSource.getConnection();
		String sql ="SELECT V.\"신고접수번호\",VI.\"신고자아이디\" ,V.\"신고대상아이디\", VI.\"신고대상타입아이디\""
				+ ", V.\"신고대상타입\",  VI.\"신고유형\", VI.\"신고상세내용\", VI.\"신고접수일자\""
				+ " FROM(SELECT LUMEMBER_ID AS \"신고대상아이디\", REPORT_ID AS \"신고접수번호\", ID.LEADERTYPE_INFO AS \"신고대상타입\""
				+ " FROM  REPORT R JOIN VLEADERNUM_ID ID ON R.LUMEMBER_ID = ID.LEADERNUM_ID) V "
				+ " JOIN VREPINFO VI ON V.\"신고접수번호\" = VI.\"신고접수아이디\""
				+ " WHERE VI.\"신고대상타입아이디\"=? AND VI.HANDLING='0'"
				+ " ORDER BY V.\"신고접수번호\" ASC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,leadertype_id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			ReportDTO dto = new ReportDTO();

			dto.setReport_id(rs.getString("신고접수번호"));
			dto.setLimember_id(rs.getString("신고자아이디"));
			dto.setLumember_id(rs.getString("신고대상아이디"));
			dto.setLeadertype_id(rs.getString("신고대상타입"));
			dto.setRep_type(rs.getString("신고유형"));
			dto.setRep_content(rs.getString("신고상세내용"));
			dto.setRep_date(rs.getString("신고접수일자"));
			
			result.add(dto);
		}

		return result;
	}

	@Override
	public int repCount() throws SQLException, ClassNotFoundException
	{
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	//신고처리관련 메소드
	
	//(신고처리아이디, 신고접수아이디, 신고자아이디,  신고대상타입, 신고제재(패널티정책), 신고처리내용, 신고접수일자, 처리일자)
	@Override
	public ArrayList<ReportDTO> repproList() throws SQLException, ClassNotFoundException
	{
		ArrayList<ReportDTO> result = new ArrayList<ReportDTO>();
		Connection conn = dataSource.getConnection();
		String sql = "SELECT * FROM VREPPROINFO";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			ReportDTO dto = new ReportDTO();

			dto.setReppro_id(rs.getString("신고처리아이디"));
			dto.setLimember_id(rs.getString("신고자아이디"));
			dto.setLeadertype_id(rs.getString("신고대상타입"));
			dto.setRep_panalty(rs.getString("패널티정책"));
			dto.setRep_content(rs.getString("신고처리내용"));
			dto.setRep_date(rs.getString("신고접수일자"));
			dto.setReppro_date(rs.getString("신고처리일자"));
			
			result.add(dto);
		}

		return result;
	}

	
	
	@Override
	public ReportDTO searchProId(String reppro_id) throws SQLException, ClassNotFoundException
	{
		// TODO Auto-generated method stub
				return null;
	}

	@Override
	public ReportDTO searchPanId(String rep_panalty) throws SQLException, ClassNotFoundException
	{
		// TODO Auto-generated method stub
		return null;
	}

	
	//4.신고대상타입에 따른 신고처리정보 정렬/출력 
	@Override
	public ArrayList<ReportDTO> searchLTId(String leadertype_id) throws SQLException, ClassNotFoundException
	{
		ArrayList<ReportDTO> result = new ArrayList<ReportDTO>();
		Connection conn = dataSource.getConnection();
		String sql = "SELECT \"신고처리아이디\", \"신고자아이디\", \"신고대상타입\", \"신고타입내용\", \"신고처리내용\""
				+ ", \"신고접수일자\", \"신고처리일자\""
				+ " FROM VREPPROINFO "
				+ " WHERE \"신고대상아이디\" = ?"
				+ " ORDER BY \"신고처리아이디\" DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, leadertype_id);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			ReportDTO dto = new ReportDTO();

			dto.setReppro_id(rs.getString("신고처리아이디"));
			dto.setLimember_id(rs.getString("신고자아이디"));
			dto.setLeadertype_id(rs.getString("신고대상타입"));
			dto.setRep_panalty(rs.getString("신고타입내용"));
			dto.setReppro_content(rs.getString("신고처리내용"));;
			dto.setRep_date(rs.getString("신고접수일자"));
			dto.setReppro_date(rs.getString("신고처리일자"));
			
			result.add(dto);
			
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}

	@Override
	public int proCount() throws SQLException, ClassNotFoundException
	{
		// TODO Auto-generated method stub
		return 0;
	}

	
	/*신고접수 또는 신고처리시 신고대상타입 옵션 뿌려주기*/
	@Override
	public ArrayList<ReportDTO> optionList1() throws SQLException, ClassNotFoundException
	{
		ArrayList<ReportDTO> result = new ArrayList<ReportDTO>();
		Connection conn = dataSource.getConnection();
		String sql ="SELECT LEADERTYPE_ID, LEADERTYPE_INFO FROM LEADERTYPE";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			ReportDTO dto = new ReportDTO();
			
			dto.setLeadertype_id(rs.getString("LEADERTYPE_ID"));
			dto.setLeadertype_info(rs.getString("LEADERTYPE_INFO"));
			
			result.add(dto);
		}
		
		return result;
	}

	@Override
	public ArrayList<ReportDTO> optionList2() throws SQLException, ClassNotFoundException
	{
		
		return null;
	}

	//3.신고접수/처리시 제재유형 옵션 뿌려주기
	@Override
	public ArrayList<ReportDTO> optionList3() throws SQLException, ClassNotFoundException
	{
		ArrayList<ReportDTO> result = new ArrayList<ReportDTO>();
		Connection conn = dataSource.getConnection();
		String sql ="SELECT PANALTYPOL_ID, PANALTYPOL_CONTENT FROM PANALTYPOL ORDER BY PANALTYPOL_ID";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			ReportDTO dto = new ReportDTO();
			
			dto.setRep_panalty(rs.getString("PANALTYPOL_ID"));
			dto.setRep_panaltypol(rs.getString("PANALTYPOL_CONTENT"));
			
			result.add(dto);
		}
		
		return result;
	}

	@Override
	public ArrayList<ReportDTO> reportList3(String limember_id, String leadertype_id)
			throws SQLException, ClassNotFoundException
	{
		ArrayList<ReportDTO> result = new ArrayList<ReportDTO>();
		Connection conn = dataSource.getConnection();
		String sql ="SELECT * FROM VREPINFO Where \"신고대상타입아이디\" = ? AND \"신고자아이디\" = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, leadertype_id);
		pstmt.setString(2, limember_id);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{			
			ReportDTO dto = new ReportDTO();

			dto.setReport_id(rs.getString("신고접수아이디"));
			dto.setLimember_id(rs.getString("신고자아이디"));
			dto.setLumember_id(rs.getString("신고대상아이디"));
			dto.setLeadertype_id(rs.getString("신고대상타입"));
			dto.setRep_type(rs.getString("신고유형"));
			dto.setRep_content(rs.getString("신고상세내용"));
			dto.setRep_date(rs.getString("신고접수일자"));
			
			result.add(dto);
		}
		
		return result;
	}

	//6.신고자아아디, 신고대상타입아이디, 제재내용 에 따른 신고처리 리스트 출력/정렬
	@Override
	public ArrayList<ReportDTO> allOptionPro(String limember_id, String leadertype_id, String rep_panalty)
			throws SQLException, ClassNotFoundException
	{
		//System.out.println(limember_id);
		//System.out.println(leadertype_id);
		//System.out.println(rep_panalty);
		
		int i = 1;
		
		ArrayList<ReportDTO> result = new ArrayList<ReportDTO>();
		Connection conn = dataSource.getConnection();
		
		String sql ="SELECT \"신고처리아이디\", \"신고자아이디\" , \"신고대상타입\", \"패널티정책\""
				+ " ,\"신고처리내용\",\"신고접수일자\",\"신고처리일자\""
				+ " FROM VREPPROINFO"
				+ " WHERE 1 = 1"
				+ " ORDER BY \"신고처리아이디\" DESC";
		
				//처음 신고자의 아이디는 null, 이후에는 공백("")으로 처리됨
				if(limember_id != null && !limember_id.trim().equals(""))
				{
					sql += "AND \"신고자아이디\" = ?";
				}
				if(!leadertype_id.equals("0"))
				{
					sql += "AND \"신고대상아이디\" = ?";
				}
				if(!rep_panalty.equals("0"))
				{
					sql += "AND \"패널티정책아이디\" = ?";
				}
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				
				//옵션의 선택 및 입력 값에 따라 받아오는 것 다르게 해줘야함.
				//처음 신고자의 아이디는 null, 이후에는 공백("")으로 처리됨
				if(limember_id != null && !limember_id.trim().equals(""))
				{
					pstmt.setString(i++, limember_id);
				}
				if(!leadertype_id.equals("0"))
				{
					pstmt.setString(i++, leadertype_id);
				}
				if(!rep_panalty.equals("0"))
				{
					pstmt.setString(i++, rep_panalty);
				}
			
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{			
			ReportDTO dto = new ReportDTO();
			
			dto.setReppro_id(rs.getString("신고처리아이디"));
			dto.setLimember_id(rs.getString("신고자아이디"));
			dto.setLeadertype_id(rs.getString("신고대상타입"));
			dto.setRep_panalty(rs.getString("패널티정책"));
			dto.setReppro_content(rs.getString("신고처리내용"));
			dto.setRep_date(rs.getString("신고접수일자"));
			dto.setReppro_date(rs.getString("신고처리일자"));
			
			result.add(dto);
		}
		
		return result;
	}

	


	

}
