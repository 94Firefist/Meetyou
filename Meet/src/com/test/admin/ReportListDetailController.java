package com.test.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ReportListDetailController implements Controller
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

}
