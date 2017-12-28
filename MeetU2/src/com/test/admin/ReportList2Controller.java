package com.test.admin;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ReportList2Controller implements Controller
{
	private IReportDAO dao;

	public void setDao(IReportDAO dao)
	{
		this.dao = dao;
	}
	
	ArrayList<ReportDTO> reportproList = new ArrayList<ReportDTO>();
	ArrayList<ReportDTO> optionList3 = new ArrayList<ReportDTO>();
	ArrayList<ReportDTO> optionList1 = new ArrayList<ReportDTO>();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
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
			/*신고처리시 신고대상타입 옵션 뿌려주기*/
			//String optionList1 = request.getParameter("options1");
			optionList1 = dao.optionList1();
			mav.addObject("optionList1", optionList1);
			
			/*신고처리시 제재내용 옵션 뿌려주기*/
			optionList3 = dao.optionList3();
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
			
			reportproList = dao.allOptionPro(imember_id , repproselval , repproselval2);
			
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
