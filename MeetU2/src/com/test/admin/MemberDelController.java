package com.test.admin;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.members.IMemberDAO;

@Controller
public class MemberDelController
{

	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="/memberDel.action")
	public ModelAndView groupDel(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		 ModelAndView mav = new ModelAndView();

		 // 관리자인지 세션 확인
		 if(session.getAttribute("admin") == null)
		 {
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		 }
		
		 IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		 
		 String member_id = request.getParameter("member_id");

		 dao.memberDel(member_id);
			
		 mav.setViewName("redirect:AdminMemberMain.jsp");
		
		 return mav;
	}

	
}
