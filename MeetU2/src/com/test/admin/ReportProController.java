package com.test.admin;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportProController
{
	@Autowired
	private SqlSession sqlSession;
	
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
		
		ReportDTO2 result = new ReportDTO2();
		
		IReportDAO2 dao2 = sqlSession.getMapper(IReportDAO2.class);
		
		String reppro_id = request.getParameter("reportTest2");
		
		result  = dao2.proDetailId(reppro_id);
			
		mav.addObject("result", result);
		
		mav.setViewName("ajax/ReportDetail2.jsp");

		
		return mav;
		
	}
}
