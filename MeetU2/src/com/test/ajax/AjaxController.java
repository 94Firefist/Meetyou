package com.test.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.admin.FAQDTO;
import com.test.admin.NoticeDTO;
import com.test.admin.IAdminDAO;

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
				
				mav.addObject("title", result.getTitle());
				mav.addObject("content", result.getContent());
				mav.setViewName("/ajax/Ajax.jsp");
				
			}
			if (faqId != null)
			{
				FAQDTO result = new FAQDTO();
				result = dao.getFAQContent(faqId);
				
				mav.addObject("title", result.getTitle());
				mav.addObject("content", result.getContent());
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
