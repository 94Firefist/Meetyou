package com.test.admin;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.admin.GroupDTO;
import com.test.admin.IGroupDAO;

@Controller
public class GroupListController
{
	@Autowired
	private SqlSession sqlsession;
	
	

	@RequestMapping(value="/grouplist.action")
	public ModelAndView handleRequest(HttpServletRequest request, HttpSession session)
	{
		
		ModelAndView mav = new ModelAndView();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
		
		ArrayList<GroupDTO> groupList = new ArrayList<GroupDTO>();
		 
		 IGroupDAO dao = sqlsession.getMapper(IGroupDAO.class);
		 AdminPage adminpage = new AdminPage();
		 try
		{
			String groupName = request.getParameter("groupName");
			 
			// 현재 페이지
			int page = Integer.parseInt(request.getParameter("page")==null?"1":request.getParameter("page"));
			
			// 한 화면에 출력될 페이지 수
			int countPage = 10;
			int[] sePage = adminpage.StartEndPage(page,  dao.groupCount(groupName), countPage, 10);
			
			int startPage = sePage[0];
			int endPage = sePage[1];
			int totalPage = sePage[2];
			
			
			
			//System.out.println(String.valueOf((page-1)*10+1));
			//System.out.println(String.valueOf(page*countPage));
			
			HashMap<String,String> stMap = new HashMap<String,String>();
			stMap.put("startPage", String.valueOf((page-1)*10+1));
			stMap.put("countPage", String.valueOf(page*countPage));
			if(groupName != null) {
				stMap.put("GROUPNAME", groupName);
				mav.addObject("groupName", groupName);
			}
			
			
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













