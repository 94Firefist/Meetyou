package com.test.admin;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView groupDel(HttpServletRequest request) throws ClassNotFoundException, SQLException
	{
		 ModelAndView mav = new ModelAndView();
		 
		 IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		 
		 String group_id = request.getParameter("group_id");

		 dao.groupDel(group_id);
			
		 mav.setViewName("redirect:grouplist.action");
		
		 return mav;
	}


	
}