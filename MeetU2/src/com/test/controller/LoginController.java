package com.test.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.members.IMemberDAO;
import com.test.members.MemberDTO;
@Controller
public class LoginController
{
	// 의존성 객체 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 로그인 확인
	@RequestMapping(value="/login.action", method=RequestMethod.POST)
	public String Login(HttpServletRequest request, HttpSession session)
	{
		// 데이터 수신
		String id = request.getParameter("name").toUpperCase();
		String pw = request.getParameter("pwd");
		String page = request.getParameter("page");
		
		try
		{

			// 값 유무 확인
			if(page==null || page.equals("") || pw==null || pw.equals("") || id==null || id.equals(""))
				page = "/maingroup.action";
			
			// ID 세션 확인
			if(session.getAttribute("id")!=null)
				return "redirect:"+page;
			
			// DB연결
			IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
			
			// 조회
			HashMap<String, String> loginMap = new HashMap<String, String>();
			loginMap.put("name", id);
			loginMap.put("pw", pw);
			MemberDTO dto = dao.login(loginMap);		// 아이디 / 어드민 여부
			String keynumber = dao.memberid(id);		// 리더넘 번호
			
			// 아이디 유효 체크
			if(dto==null)
				return "redirect:/loginform.action?fail=fail&page="+page;
			
			// 비번번호 유효한지 확인
			if(dto.getMember_pw().equals(pw))
			{
				session.setAttribute("id", id);
				session.setAttribute("keynumber", keynumber);
				session.setAttribute("city", dto.getCity_name());
				session.setAttribute("name", dto.getMember_name());
				session.setAttribute("pic", dao.myprofile(keynumber));
				if(Integer.parseInt(dto.getMember_admin()) == 0)
					session.setAttribute("admin", "");
			}
			else
			{
				return "redirect:/loginform.action?fail=fail&page="+page;
			}
			
			return "redirect:"+page;
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			return "/maingroup.action";
		}
	}
	
	// 로그인폼으로 이동
	@RequestMapping(value="/loginform.action", method=RequestMethod.GET)
	public String LoginForm(HttpServletRequest request, ModelMap mp, HttpSession session)
	{
		String page = request.getParameter("page");
		String fail = request.getParameter("fail");

		if(page==null || page.equals(""))
			page = "/maingroup.action";
		
		if(session.getAttribute("id")!=null)
			return "redirect:"+page;

		mp.addAttribute("page", page);
		if(fail != null)
		{
			mp.addAttribute("fail", "fail");
			return "/WEB-INF/view/login/login.jsp";
		}
		
		return "/WEB-INF/view/login/login.jsp";
	}
	
	// 로그아웃 처리
	@RequestMapping(value="/logout.action", method=RequestMethod.GET)
	public String LogOut(HttpServletRequest request, HttpSession session)
	{
		String page = request.getParameter("page");
		
		if(page==null || page.equals(""))
			page="maingroup.action";
		
		session.invalidate();
		
		return "redirect:"+page;
	}
}
