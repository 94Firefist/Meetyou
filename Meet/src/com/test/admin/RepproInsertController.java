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
public class RepproInsertController
{
	@Autowired
	private SqlSession sqlSession;
	
	//신고처리 insert 액션처리 위한 맵핑
	@RequestMapping(value="/repproinsert.action")
	public ModelAndView repproinsert(HttpServletRequest request,  HttpSession session) throws ClassNotFoundException, SQLException
	{
		ModelAndView mav = new ModelAndView();
		IReportDAO2 dao2 = sqlSession.getMapper(IReportDAO2.class);
		
		
		/*선택된 신고접수 처리를 위한 액션처리*/
		ReportDTO2 dto2 = new ReportDTO2();
		//(REPPRO_ID, LMEMBER_ID, REPORT_ID, PANALTYPOL_ID, REPPRO_CONTENT, REPPRO_DATE)
		String limember_id = (String)session.getAttribute("keynumber");
		String report_id = request.getParameter("report_id");
		String rep_panaltypol = request.getParameter("repprosel2");
		String reppro_content = request.getParameter("reportTest2");
		
		dto2.setLimember_id(limember_id);
		dto2.setReport_id(report_id);
		dto2.setRep_panaltypol(rep_panaltypol);
		dto2.setReppro_content(reppro_content);
		
		
		dao2.reportSelList(dto2);
		
		//매개변수 채워주고
		
		mav.setViewName("redirect:/reportList.action");
		
		return mav;
	}
	
	
}
