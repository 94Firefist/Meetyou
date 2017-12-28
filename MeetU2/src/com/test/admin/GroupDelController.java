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
public class GroupDelController
{
	@Autowired
	private SqlSession sqlSession;
	

	@RequestMapping(value="/groupDel.action")
	public ModelAndView groupDel(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		 ModelAndView mav = new ModelAndView();

		 // 관리자인지 세션 확인
		 if(session.getAttribute("admin") == null)
		 {
			 mav.setViewName("redirect:/mainevent.action");
			 return mav;
		 }
			
		 IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		 
		 String group_id = request.getParameter("group_id");

		 //dao.groupDel(group_id);
			
		 mav.setViewName("redirect:grouplist.action");
		
		 return mav;
	}


	
}