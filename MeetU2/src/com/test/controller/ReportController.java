package com.test.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.dao.IReportDAO;
import com.test.dto.ReportDTO;

@Controller
public class ReportController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	//신고하기 창으로 가는 컨트롤러 
	@RequestMapping(value="/reportpopup.action" , method = RequestMethod.GET)
	public ModelAndView ReportPopup(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		String keynumber = (String) session.getAttribute("keynumber");  //나의 대표 번호 가져오기 
		
		IReportDAO dao = sqlSession.getMapper(IReportDAO.class);  //신고 dao 주입

		ArrayList<ReportDTO> msgReportlist = dao.msgReportlist();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msgReportlist", msgReportlist);
		mav.addObject("keynumber", keynumber);
		//System.out.println(keynumber);
		
		mav.setViewName("/WEB-INF/view/Report_popup_content.jsp");
		
		return mav; 
	}
	
	@RequestMapping(value="/reportMsg.action", method = RequestMethod.GET)
	public ModelAndView ReportMsg(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		
		String keynumber = (String) session.getAttribute("keynumber");  //나의 대표 번호 가져오기 
		IReportDAO dao = sqlSession.getMapper(IReportDAO.class);  //신고 dao 주입
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		hashmap.put("limember_id", keynumber);
		hashmap.put("lumember_id", request.getParameter("reportedPerson"));
		hashmap.put("reptype_id", request.getParameter("reportType"));
		hashmap.put("report_reason", request.getParameter("reportDetail"));
		
		dao.msgReport(hashmap);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/messagemyreceive.action");
		return mav; 
	}
	//신고처리 상세처리정보를 열람하기 위한 액션처리
	@RequestMapping(value="/reportproDetail2.action")
	public ModelAndView repproinsert(HttpServletRequest request) throws ClassNotFoundException, SQLException
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
		
		ReportDTO result = new ReportDTO();
		
		IReportDAO dao2 = sqlSession.getMapper(IReportDAO.class);
		
		String reppro_id = request.getParameter("reportTest2");
		
		result  = dao2.proDetailId(reppro_id);
			
		mav.addObject("result", result);
		
		mav.setViewName("ajax/ReportDetail2.jsp");

		
		return mav;
		
	}
	
	//신고처리 insert 액션처리 위한 맵핑
	@RequestMapping(value="/repproinsert.action")
	public ModelAndView repproinsert(HttpServletRequest request,  HttpSession session) throws ClassNotFoundException, SQLException
	{
		ModelAndView mav = new ModelAndView();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
		
		IReportDAO dao2 = sqlSession.getMapper(IReportDAO.class);
		
		
		/*선택된 신고접수 처리를 위한 액션처리*/
		ReportDTO dto2 = new ReportDTO();
		//(REPPRO_ID, LMEMBER_ID, REPORT_ID, PANALTYPOL_ID, REPPRO_CONTENT, REPPRO_DATE)
		String limember_id = (String)session.getAttribute("keynumber");
		String report_id = request.getParameter("report_id");
		String rep_panaltypol = request.getParameter("repprosel2");
		String reppro_content = request.getParameter("reportTest2");
		
		dto2.setlIMember_id(limember_id);
		dto2.setReport_id(report_id);
		dto2.setPanaltyPol_id(rep_panaltypol);
		dto2.setRepPro_content(reppro_content);
		
		
		dao2.reportSelList(dto2);
		
		//매개변수 채워주고
		
		mav.setViewName("redirect:/reportList.action");
		
		return mav;
	}
	
	@RequestMapping(value="/reportDetail.action")
	public ModelAndView handleRequest(HttpServletRequest request) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		IReportDAO dao = sqlSession.getMapper(IReportDAO.class);
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
		
		// 사용자가 페이지 요청하면
		// 디비로부터 직원 정보 받아다가 뷰단에 말해서 지정
		ReportDTO result = new ReportDTO();
		
		
		
		//신고접수 상세내용 클릭시 상세내용 뿌려주는 컨트롤러처리
		String reportTest1 = request.getParameter("reportTest1");
		
		try
		{
			result  = dao.reportList2(reportTest1);
			
			mav.addObject("result", result);
			
			mav.setViewName("ajax/ReportDetail.jsp");

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return mav;
	}
	
	
	@RequestMapping(value="/reportList.action")
	public ModelAndView reportList(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
		
		// 사용자가 페이지 요청하면
		// 디비로부터 직원 정보 받아다가 뷰단에 말해서 지정
		ArrayList<ReportDTO> reportList = new ArrayList<ReportDTO>();
		ArrayList<ReportDTO> optionList1 = new ArrayList<ReportDTO>();
		ArrayList<ReportDTO> optionList3 = new ArrayList<ReportDTO>();
		
		try
		{
			IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
			/*신고접수 : 신고대상타입 옵션 & 신고상세정보 모달창에서 제재유형 뿌려주기*/
			//String optionList1 = request.getParameter("options1");
			optionList1 = reportDAO.optionList1();
			mav.addObject("optionList1", optionList1);
			optionList3 = reportDAO.optionList3();
			mav.addObject("optionList3",optionList3);
			
			
			/*정렬액션처리*/
			/*신고자 아이디에 대해 출력*/
			String imember_id = request.getParameter("imember_id");
			/*신고접수 신고대상타입 옵션에 따라 출력*/
			String repselval = request.getParameter("repsel");
			
			
			/*신고접수 리스트 출력*/
			if((imember_id==null || imember_id.equals("")) && (repselval==null || repselval.equals("0"))) //모두 선택안됐을때
			{
				
				reportList  = reportDAO.reportList();	//전체 기본리스트 출력
				mav.addObject("reportList", reportList);
				mav.setViewName("/WEB-INF/view/admin/AdminReport1.jsp");	//신고접수 페이지 메인으로
			}	
			else if ((imember_id==null || imember_id.equals("")) || (repselval==null || repselval.equals("0"))) 
			{
				
//				System.out.println(imember_id);
//				System.out.println(repselval);
				
				//둘중 하나에 값이 있을 때
				if(repselval!=null && (imember_id==null || imember_id.equals("")) )	//신고대상이 선택되었을 때 + 신고자가 검색되지 않았을 때
				{
					reportList  = reportDAO.searchUtypeId(repselval);
					mav.addObject("repsel", repselval);
					mav.addObject("reportList", reportList);
				}
				else if(imember_id!=null && (repselval==null || repselval.equals("0"))) //신고자가 검색되고 신고대상이 선택되지 않았을 때
				{
					reportList  = reportDAO.searchRepId(imember_id);
					mav.addObject("imember_id", imember_id);
					mav.addObject("reportList", reportList);
				}
			
			}
			else if((imember_id!=null) & (repselval!=null))	//둘다 선택
			{
//				System.out.println(imember_id);
//				System.out.println(repselval);
				
				HashMap<String, Object> hashMap = new HashMap<String, Object>();
				
				hashMap.put("limember_id", imember_id);
				hashMap.put("leadertype_id", repselval);
				
				reportList  = reportDAO.reportList3(hashMap);
				mav.addObject("imember_id", imember_id);
				mav.addObject("repselval", repselval);
				mav.addObject("reportList", reportList);
			}
			mav.setViewName("/WEB-INF/view/admin/AdminReport1.jsp");
			

		} catch (Exception e)
		{
			e.printStackTrace();
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
	@RequestMapping(value="/reportList2.action")
	public ModelAndView reportList2(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
		
		try
		{
			ArrayList<ReportDTO> reportproList = new ArrayList<ReportDTO>();
			ArrayList<ReportDTO> optionList3 = new ArrayList<ReportDTO>();
			ArrayList<ReportDTO> optionList1 = new ArrayList<ReportDTO>();
			
			IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
			/*신고처리시 신고대상타입 옵션 뿌려주기*/
			//String optionList1 = request.getParameter("options1");
			optionList1 = reportDAO.optionList1();
			mav.addObject("optionList1", optionList1);
			
			/*신고처리시 제재내용 옵션 뿌려주기*/
			optionList3 = reportDAO.optionList3();
			mav.addObject("optionList3",optionList3);
			
			
			
			
			/*신고자 아이디에 대해 출력*/
			String imember_id = request.getParameter("imember_id");
			/*신고접수 신고대상타입 옵션에 따라 출력*/
			String repproselval = request.getParameter("repprosel");
			/*신고접수 제재내용 옵션에 따라 출력*/
			String repproselval2 = request.getParameter("repprosel2"); 
			
			
			if(repproselval == null)
			{
				repproselval = "0";
			}
			
			if(repproselval2 == null)
			{
				repproselval2 = "0";
			}
			
			//System.out.println(imember_id);
			
			
			/*
			String a = "%";
			String b = "%";
			String c = "%";
			
			신고처리 리스트 출력
			if(imember_id != null)
			{
				a = imember_id;
			}
			
			if (repproselval != null)
			{
				b = repproselval;
			}
			
			if (repproselval2 != null)
			{
				c = repproselval2;
			}
			System.out.println(a);*/
			
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("", imember_id);
			hashMap.put("", repproselval);
			hashMap.put("", repproselval2);
			
			reportproList = reportDAO.allOptionPro(hashMap);
			
			//System.out.println(reportproList.get(0).getLimember_id());
			//System.out.println(reportproList.get(0).getRep_panalty());
			
			mav.addObject("imember_id",imember_id);
			mav.addObject("repprosel",repproselval);
			mav.addObject("repprosel2",repproselval2);
			mav.addObject("reportproList",reportproList);
			
			
			mav.setViewName("/WEB-INF/view/admin/AdminReport2.jsp");
		
			
			
			/*if(imember_id != null)
			{
				a = imember_id;
			}
			
			if(repproselval != null)
			{
				b = repproselval;
			}
			
			if(repproselval2 != null)
			{
				c = repproselval2;
			}
			*/
			
			/*if(repproselval==null || repproselval.equals("0"))
			{
				reportproList = dao.repproList();	//신고대상타입 옵션이 선택되지 않으면 기존의 신고처리 리스트
				a = "%";
			}	
			else
			{
				reportproList = dao.searchLTId(repproselval);	//	
				mav.addObject("repprosel", repproselval);	
			}
			*/
			
			
			
			/////////////////////////////////////////////////////
			
			//선택된 val값을 jsp로 넘겨주기 위함(selected 상태를 선택된 val로 설정)
			//전체 리스트 출력을 위한 기본값을 다시 선택했을 때 바뀌는 것을 실행할 수 있게 하기 위함.
			/////////////////////////////////////////////////////
			
			
		} catch (Exception e)
		{
			e.printStackTrace();
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}
