package com.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.footer.FAQDTO;
import com.test.footer.IFAQListDAO;
import com.test.footer.INoticeListDAO;
import com.test.footer.ISiteInfoDAO;

@Controller
public class FooterController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	// 사이트 소개
	@RequestMapping(value="/agreementintroduce.action")
	public ModelAndView agreementIntroduce()
	{
		ModelAndView mav = new ModelAndView();
		
		ISiteInfoDAO dao = sqlSession.getMapper(ISiteInfoDAO.class);
		
		mav.addObject("siteInfoContent", dao.siteInfoContent("1"));
		
		mav.setViewName("/WEB-INF/view/footer/agreementIntroduce.jsp");
		
		return mav;
	}
	
	// 이용약관
	@RequestMapping(value="/siteintroduce.action")
	public ModelAndView siteIntroduce()
	{
		ModelAndView mav = new ModelAndView();
		
		ISiteInfoDAO dao = sqlSession.getMapper(ISiteInfoDAO.class);
		
		mav.addObject("siteInfoContent", dao.siteInfoContent("5"));
		
		mav.setViewName("/WEB-INF/view/footer/siteIntroduce.jsp");
		
		return mav;
	}
	
	// FAQ 리스트 *
	@RequestMapping(value="/faqintroduce.action", method=RequestMethod.GET)
	public ModelAndView faqIntroduce()
	{
		ModelAndView mav = new ModelAndView();
		
		IFAQListDAO dao = sqlSession.getMapper(IFAQListDAO.class);
		
		mav.addObject("faqAll", dao.faqAll());

		mav.setViewName("/WEB-INF/view/footer/faqIntroduce.jsp");
		
		return mav; 
	}

	// FAQ *
	@RequestMapping(value="/faqintroducecomfirm.action", method=RequestMethod.GET)
	public ModelAndView faqintroduceComfirm(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();		
		
		String faqId = request.getParameter("faqId");
		
		IFAQListDAO dao = sqlSession.getMapper(IFAQListDAO.class);
		
		mav.addObject("faqList", dao.faqList(faqId));
		
		mav.setViewName("/WEB-INF/view/footer/faqIntroduceComfirm.jsp");
		
		return mav; 
 
	}

	// 1:1 문의 QnA (추가) *
	@RequestMapping(value="/qnaadd.action", method=RequestMethod.POST)
	public ModelAndView qnaAdd(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		
		String userId = (String)session.getAttribute("keynumber");
		String title = request.getParameter("subject");
		String content = request.getParameter("message");
		
		//System.out.println(title);
		//System.out.println(content);
		
		IFAQListDAO dao = sqlSession.getMapper(IFAQListDAO.class);
		
		FAQDTO faq = new FAQDTO();	
		
		faq.setUserId(userId);
		faq.setTitle(title);
		faq.setContent(content);
		
		dao.qnaAdd(faq);
		
		mav.setViewName("redirect:faqintroduce.action");
			
		return mav;
	}

	// 공지사항 리스트 *
	@RequestMapping(value="/noticeintroduce.action", method=RequestMethod.GET)
	public ModelAndView noticeIntroduce()
	{
		ModelAndView mav = new ModelAndView();
		
		INoticeListDAO dao = sqlSession.getMapper(INoticeListDAO.class);	
				
		mav.addObject("noticeAll", dao.noticeAll());

		mav.setViewName("/WEB-INF/view/footer/noticeIntroduce.jsp");
		
		return mav; 		
		
	}
	
	// 공지사항 상세 내용 *
	@RequestMapping(value="/noticeintroducecomfirm.action", method=RequestMethod.GET)
	public ModelAndView noticeIntroduceComfirm(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();		
	
		String noticeId = request.getParameter("noticeId");
		
		INoticeListDAO dao = sqlSession.getMapper(INoticeListDAO.class);
		
		mav.addObject("noticeList", dao.noticeList(noticeId));
		
		mav.setViewName("/WEB-INF/view/footer/noticeIntroduceComfirm.jsp");
		
		return mav; 
	}

}
