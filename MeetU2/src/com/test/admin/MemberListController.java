package com.test.admin;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.members.IMemberDAO;
import com.test.members.MemberDTO;

@Controller
public class MemberListController
{
	@Autowired
	private SqlSession sqlSession;
	
	@Resource(name = "AdminPage")
	private AdminPage adminpage;
	
	@RequestMapping(value="/memberlist.action")
	public ModelAndView handleRequest(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
		
		// 현재 페이지
		int page = Integer.parseInt(request.getParameter("page")==null?"1":request.getParameter("page"));
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		// 한 화면에 출력될 페이지 수
		int countPage = 10;
		
		int[] sePage = adminpage.StartEndPage(page,  dao.memberPageCount(), countPage, 10);
		
		int startPage = sePage[0];
		int endPage = sePage[1];
		int totalPage = sePage[2];
		
		
		ArrayList<MemberDTO> memberLists = new ArrayList<MemberDTO>();
		memberLists = dao.adminMemberList(page + "");
		
		mav.addObject("page", page);
		mav.addObject("memberList", memberLists);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("totalPage", totalPage);
		
		mav.setViewName("WEB-INF/view/admin/AdminMemberMain.jsp");
		
		return mav;
		
	}
	
	
}