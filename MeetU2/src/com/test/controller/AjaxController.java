package com.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.dao.IAdminDAO;
import com.test.dto.FAQDTO;
import com.test.dto.NoticeDTO;

@Controller
public class AjaxController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/ajax.action")
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
				
		String noticeId = request.getParameter("noticeId");
		String faqId = request.getParameter("faqId");
		String qnaId = request.getParameter("qnaId");
		
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		
		
		try
		{
			if (noticeId != null)
			{
				NoticeDTO result = new NoticeDTO();
				result = dao.getNoticeContent(noticeId);
				
				mav.addObject("title", result.getNotice_title());
				mav.addObject("content", result.getNotice_content());
				mav.setViewName("/ajax/Ajax.jsp");
				
			}
			if (faqId != null)
			{
				FAQDTO result = new FAQDTO();
				result = dao.getFAQContent(faqId);
				
				mav.addObject("title", result.getFaq_title());
				mav.addObject("content", result.getFaq_content());
				mav.setViewName("/ajax/Ajax.jsp");
			}
			if (qnaId != null)
			{
				String result = dao.qnaContent(qnaId);
				
				mav.addObject("result", result);
				
				mav.setViewName("/ajax/Ajax02.jsp");
			}
			
			
			
//			System.out.println(result);
			
			//mav.addObject("result", result);
			//mav.addObject("title", result.getTitle());
			//mav.addObject("content", result.getContent());
			
			//System.out.println(mav);
			
			//mav.setViewName("Ajax.jsp");
			//mav.setViewName("/WEB-INF/view/AdminNotice.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
