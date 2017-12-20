package com.test.report;

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
		
		Report_IDAO dao = sqlSession.getMapper(Report_IDAO.class);  //신고 dao 주입

		ArrayList<Report_DTO> msgReportlist = dao.msgReportlist();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msgReportlist", msgReportlist);
		mav.addObject("keynumber", keynumber);
		//System.out.println(keynumber);
		
		mav.setViewName("/WEB-INF/view/Report_popup_content.jsp");
		
		return mav; 
	}
	
	@RequestMapping(value="reportMsg.action", method = RequestMethod.GET)
	public ModelAndView ReportMsg(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		
		String keynumber = (String) session.getAttribute("keynumber");  //나의 대표 번호 가져오기 
		Report_IDAO dao = sqlSession.getMapper(Report_IDAO.class);  //신고 dao 주입
		
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
	
	
	
	
	
}
