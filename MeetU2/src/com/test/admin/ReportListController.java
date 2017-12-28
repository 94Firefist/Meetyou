package com.test.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ReportListController implements Controller
{
	private IReportDAO dao;

	public void setDao(IReportDAO dao)
	{
		this.dao = dao;
	}

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
		
		// 사용자가 페이지 요청하면
		// 디비로부터 직원 정보 받아다가 뷰단에 말해서 지정
		ArrayList<ReportDTO> reportList = new ArrayList<ReportDTO>();
		ArrayList<ReportDTO> optionList1 = new ArrayList<ReportDTO>();
		ArrayList<ReportDTO> optionList3 = new ArrayList<ReportDTO>();
		
		try
		{
	
			/*신고접수 : 신고대상타입 옵션 & 신고상세정보 모달창에서 제재유형 뿌려주기*/
			//String optionList1 = request.getParameter("options1");
			optionList1 = dao.optionList1();
			mav.addObject("optionList1", optionList1);
			optionList3 = dao.optionList3();
			mav.addObject("optionList3",optionList3);
			
			
			/*정렬액션처리*/
			/*신고자 아이디에 대해 출력*/
			String imember_id = request.getParameter("imember_id");
			/*신고접수 신고대상타입 옵션에 따라 출력*/
			String repselval = request.getParameter("repsel");
			
			
			/*신고접수 리스트 출력*/
			if((imember_id==null || imember_id.equals("")) && (repselval==null || repselval.equals("0"))) //모두 선택안됐을때
			{
				
				reportList  = dao.reportList();	//전체 기본리스트 출력
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
					reportList  = dao.searchUtypeId(repselval);
					mav.addObject("repsel", repselval);
					mav.addObject("reportList", reportList);
				}
				else if(imember_id!=null && (repselval==null || repselval.equals("0"))) //신고자가 검색되고 신고대상이 선택되지 않았을 때
				{
					reportList  = dao.searchRepId(imember_id);
					mav.addObject("imember_id", imember_id);
					mav.addObject("reportList", reportList);
				}
			
			}
			else if((imember_id!=null) & (repselval!=null))	//둘다 선택
			{
//				System.out.println(imember_id);
//				System.out.println(repselval);
				
				reportList  = dao.reportList3(imember_id, repselval);
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

}
