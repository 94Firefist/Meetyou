package com.test.admin;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.test.admin.GroupDTO;
import com.test.admin.IGroupDAO;


public class GroupListController implements Controller
{
	private IGroupDAO dao;

	public void setDao(IGroupDAO dao)
	{
		this.dao = dao;
	}
	
	ArrayList<GroupDTO> groupList = new ArrayList<GroupDTO>();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		 ModelAndView mav = new ModelAndView();
		 
		 AdminPage adminpage = new AdminPage();
		 try
		{
			 
			 
			// 현재 페이지
			int page = Integer.parseInt(request.getParameter("page")==null?"1":request.getParameter("page"));
			
			// 한 화면에 출력될 페이지 수
			int countPage = 10;
			
			int[] sePage = adminpage.StartEndPage(page,  dao.groupCount(), countPage, 10);
			
			int startPage = sePage[0];
			int endPage = sePage[1];
			int totalPage = sePage[2];
			
			HashMap<String, Integer> stMap = new HashMap<String, Integer>();
			stMap.put("startPage", (page-1)*10+1);
			stMap.put("countPage", page*countPage);
			
			groupList = dao.group_List(stMap);
			
			mav.addObject("page", page);
			mav.addObject("groupLists", groupList);
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("totalPage", totalPage);
			
			mav.setViewName("/WEB-INF/view/admin/AdminMain.jsp");
			 
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		 
		 return mav;
	}
	
	
}













