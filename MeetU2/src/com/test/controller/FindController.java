package com.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.dao.IMemberDAO;
import com.test.dto.CategoryDTO;
import com.test.dto.CityTypeDTO;
import com.test.dto.MemberDTO;

@Controller
public class FindController
{
	@Autowired
	private SqlSession sqlsession;
	
	// 회원가입으로 이동
	@RequestMapping(value="/signup.action", method=RequestMethod.GET)
	public String SignUp(HttpServletRequest request, HttpSession session)
	{
		String page = request.getParameter("page");
		
		if(page==null || page.equals(""))
			page="maingroup.action";
		
		if(session.getAttribute("id")!=null)
			return "redirect:"+page;
		
		return "/WEB-INF/view/find/SignUp.jsp?page="+page;
	}
	
	// 회원가입2로 이동
	@RequestMapping(value="/signup2.action", method=RequestMethod.POST)
	public String SignUp2(HttpServletRequest request, HttpSession session, ModelMap mp)
	{
		String page = request.getParameter("page");
		
		if(page==null || page.equals(""))
			page="maingroup.action";
		
		if(session.getAttribute("id")!=null)
			return "redirect:"+page;

		IMemberDAO dao = sqlsession.getMapper(IMemberDAO.class);
		
		ArrayList<CityTypeDTO> citylist = dao.citytypelist();
		ArrayList<CategoryDTO> categorylist =  dao.categoryList();
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String email = request.getParameter("userEmail");
		String tel = request.getParameter("userTel");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday")+"-";
		birthday += request.getParameter("birthday2")+"-";
		birthday += request.getParameter("birthday3");
		
		mp.addAttribute("page", page);
		mp.addAttribute("userId", userId.toUpperCase());
		mp.addAttribute("userPwd", userPwd);
		mp.addAttribute("userName", userName);
		mp.addAttribute("email", email);
		mp.addAttribute("tel", tel);
		mp.addAttribute("gender", gender);
		mp.addAttribute("birthday", birthday);
		mp.addAttribute("citylist", citylist);
		mp.addAttribute("categorylist", categorylist);
		
		
		return "/WEB-INF/view/find/SignUp2.jsp";
	}
	
	@RequestMapping(value="/signupinsert.action")
	public String SignUpInsert(HttpServletRequest request, HttpSession session)
	{
		
		
		String page = request.getParameter("page");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String[] tags = request.getParameterValues("tags");
		String category = request.getParameter("category");
		
		System.out.println(category);
		System.out.println(userId);
		System.out.println(userPwd);
		System.out.println(email);
		System.out.println(userName);
		System.out.println(tel);
		System.out.println(birthday);
		System.out.println(gender);
		
		HashMap<String, Object> memberMap = new HashMap<String, Object>();
		memberMap.put("citype_id", category);
		memberMap.put("member_realid", userId);
		memberMap.put("member_pw", userPwd);
		memberMap.put("member_email", email);
		memberMap.put("member_name", userName);
		memberMap.put("member_tel", tel);
		memberMap.put("member_birth", birthday);
		memberMap.put("member_gender", gender);
		memberMap.put("member_admin", "1");
		memberMap.put("member_info", "자기소개를 입력해주세요.");
		memberMap.put("public_fri", "4");
		memberMap.put("public_grl", "4");
		memberMap.put("public_email", "4");
		memberMap.put("public_tel", "4");
		memberMap.put("public_br", "4");
		
		IMemberDAO dao = sqlsession.getMapper(IMemberDAO.class);
		dao.memberInsert(memberMap);
		
		String memberId = memberMap.get("result").toString();
		System.out.println(memberId);
		
		// 태그 넣기
		if(tags != null)
		{
			List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
			HashMap<String, Object> HashTag = null;
			
			for(int i=0; i<tags.length; i++)
			{ 
				HashTag = new HashMap<String, Object>();
				HashTag.put("seq", dao.tagSEQ());
				HashTag.put("tagName", tags[i]);
				HashTag.put("memberId", memberId);
				
				list.add(HashTag);
			}
			
			dao.addTAG(list);
		}
		
		 HashMap<String, String> loginMap = new HashMap<String, String>();
	      loginMap.put("name", userId);
	      loginMap.put("pw", userPwd);
	      
	      MemberDTO dto = dao.login(loginMap);      // 아이디 / 어드민 여부
	      String keynumber = dao.memberid(userId);      // 리더넘 번호
	      
	      session.setAttribute("id", userId);
	      session.setAttribute("keynumber", keynumber);
	      session.setAttribute("city", dto.getCity_name());
	      session.setAttribute("name", dto.getMember_name());
	      session.setAttribute("pic", dao.myprofile(keynumber));
		
		
		
		return "redirect:"+page;
	}
	
	// 아이디찾기
	@RequestMapping(value="/idfind.action")
	public String IdFind()
	{
		return "/WEB-INF/view/find/idFind.jsp";
	}
	
	// 아이디찾기2
	@RequestMapping(value="/idfind2.action")
	public String IdFind2()
	{
		return "/WEB-INF/view/find/idFind2.jsp";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="/passwordfind.action")
	public String PasswordFind()
	{
		return "/WEB-INF/view/find/passwordFind.jsp";
	}
	
	// 비밀번호 찾기2
	@RequestMapping(value="/passwordfind2.action")
	public String PasswordFind2()
	{
		return "/WEB-INF/view/find/passwordFind2.jsp";
	}
	
	// 비밀번호 찾기3
	@RequestMapping(value="/passwordfind3.action")
	public String PasswordFind3()
	{
		return "/WEB-INF/view/find/passwordFind3.jsp";
	}
}
