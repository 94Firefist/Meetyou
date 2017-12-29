package com.test.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.comment.CommentDTO;
import com.test.comment.ICommentDAO;
import com.test.comment.ReviewDTO;


@Controller
public class CommentController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 이벤트 페이지 리뷰/코멘트 가져오기
	@RequestMapping(value="/comment.action", method=RequestMethod.GET)
	public ModelAndView getComment(HttpServletRequest request, HttpSession session, SqlSession sql)
	{
		ModelAndView mav = new ModelAndView();
		
		
		ICommentDAO dao = sql.getMapper(ICommentDAO.class);
		String id = "";
				
		String writepower = "";	
		
		String levent_id = request.getParameter("eventId");
		
		String canWrite = "no";
		
		if(session.getAttribute("keynumber")==null)
		{
			// 비회원일 경우
			writepower = "no";
		}
		else
		{
			// 회원일 경우
			id = (String)session.getAttribute("keynumber");
			
			
			canWrite = dao.canWrite(id);
			
			// 글쓰기 제재를 당했는지 확인
			if(canWrite.equals("0"))
			{
				HashMap<String, String> ids = new HashMap<String, String>();
				
				
				ids.put("id", id);
				ids.put("levent_id", levent_id);
				
				canWrite = "yes";
				
				// 이벤트를 참가했는지 확인
				
				if(dao.writeReview(ids).equals("1"))
				{
					writepower = "yes";
				}
				else
				{
					writepower = "no";
				}
			}
		}
		mav.addObject("writepower", writepower);
		
		mav.addObject("canWrite", canWrite);
		
		mav.addObject("review", dao.getReview(levent_id));
		
		mav.addObject("comment", dao.getComment(levent_id));
		
//		mav.setViewName("/WEB-INF/view/comment.jsp");
		return mav;
	}
	
	// 리뷰 인서트
	@RequestMapping(value="/insertre.action", method=RequestMethod.POST)
	public ModelAndView insertReview(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();

		String page = request.getParameter("page");
		
		String lmember_id ="";
		
		String eventId = request.getParameter("eventId");
		
		if(session.getAttribute("keynumber") != null)
			lmember_id = (String)session.getAttribute("keynumber");
		else
		{
			mav.setViewName("redirect:"+page+"&eventId="+eventId);
			return mav;
		}
		
		String levent_id = request.getParameter("levent_id");
			
		String review_content = request.getParameter("content");
		
		ReviewDTO dto = new ReviewDTO();
		dto.setLevent_id(levent_id);
		dto.setLmember_id(lmember_id);
		dto.setReview_content(review_content);
		
		ICommentDAO dao = sqlSession.getMapper(ICommentDAO.class);
		
		dao.insertReview(dto);
		
		
		mav.setViewName("redirect:"+page+"&eventId="+eventId);
		return mav;
	}
	
	// 코멘트 인서트
	@RequestMapping(value="/insertco.action")
	public ModelAndView InsertComment(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		String page = request.getParameter("page");
		
		String eventId = request.getParameter("eventId");
		
		String lmember_id ="";
		
		if(session.getAttribute("keynumber") != null)
			lmember_id = (String)session.getAttribute("keynumber");
		else
		{
			mav.setViewName("redirect:"+page+"&eventId="+eventId);
			return mav;
		}
				
		String lreview_id = request.getParameter("lreview_id");
			
		String comment_content = request.getParameter("content");
		
		String review_seq = request.getParameter("seq");
		
		String review_lev = request.getParameter("lev");
		
		
		CommentDTO dto = new CommentDTO();
		dto.setLreview_id(lreview_id);
		dto.setLmember_id(lmember_id);
		dto.setComment_content(comment_content);
		dto.setReview_seq(review_seq);
		dto.setReview_lev(review_lev);
		
		ICommentDAO dao = sqlSession.getMapper(ICommentDAO.class);
		
		dao.insertComment(dto);
		
		mav.setViewName("redirect:"+page+"&eventId="+eventId);
		
		return mav;
	}
	
	
}
