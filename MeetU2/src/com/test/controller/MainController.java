package com.test.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.dao.IMainListDAO;
import com.test.dto.GroupDTO;
import com.test.dto.EventDTO;
import com.test.dto.SearchDetailDTO;
import com.test.java.PowerLinkPick;

@Controller
public class MainController
{
	@Autowired
	private SqlSession sqlSession;
	 
	// 메인 그룹 페이지
	@RequestMapping(value="/maingroup.action", method=RequestMethod.GET)
	public ModelAndView MainGroup(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		// 이벤트 리스트 뿌려줄 준비
		IMainListDAO dao = sqlSession.getMapper(IMainListDAO.class);
		
		
		
		// 검색바 지역 수정
		mav.addObject("cityList", dao.cityList());
		
		
		// 관심지역을 가져온다.
		String city = request.getParameter("city");
		
		// 세션에서 가져오는 관심지역
		String scity = (String)session.getAttribute("city");	
		
		
		if(scity==null || scity=="")
		{
			// 처음 접속한 비회원일 경우
			session.setAttribute("city", "서울특별시");
		}
		else if(!(scity.equals(city)) && (city!=null))
		{
			// 관심지역을 바꾸었을 경우
			session.setAttribute("city", city);
			
		}
		
		
		SearchDetailDTO dto = new SearchDetailDTO();
			
		String keyword = request.getParameter("keyword");
		
		if(keyword != null && keyword.trim() != "")
		{	
			String[] key = keyword.split(" ");
			dto.setKeyword(key);
		}
		
		dto.setCity((String)session.getAttribute("city"));
		
		ArrayList<GroupDTO> groupList = dao.groupList(dto);
		int size = groupList.size();
		
		mav.addObject("size", size);
		
		mav.addObject("grouplist", groupList);
		
		
		mav.setViewName("/WEB-INF/view/main/MainpageGroup.jsp");
		return mav;
	}
	
	
	
	// 메인 이벤트 페이지
	@RequestMapping(value="/mainevent.action", method=RequestMethod.GET)
	public ModelAndView MainEvent(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		// 이벤트 리스트 뿌려줄 준비
		IMainListDAO dao = sqlSession.getMapper(IMainListDAO.class);
		
		
		// 정렬 기준을 가져온다.
//			String sortType = request.getParameter("sortType");
		
		
		// 카테고리를 가져온다
		mav.addObject("category", dao.interestList());
		

		// 검색바 지역 수정
		mav.addObject("cityList", dao.cityList());
		
		// 관심지역을 가져온다.
		String city = request.getParameter("city");
		
		// 세션에서 가져오는 관심지역
		String scity = (String)session.getAttribute("city");	
		
		
		if(scity==null || scity=="")
		{
			// 처음 접속한 비회원일 경우
			session.setAttribute("city", "서울특별시");
		}
		else if(!(scity.equals(city)) && (city!=null))
		{
			// 관심지역을 바꾸었을 경우
			session.setAttribute("city", city);
			
		}
		
		
		
		
		
		
		// 파워링크 --------------------------------------------------------
		ArrayList<EventDTO> list = dao.powerList();
		
		int length = list.size();
		
		if(length > 4)
		{
			int[] index = PowerLinkPick.select(length);
			
			ArrayList<EventDTO> powerList = new ArrayList<EventDTO>();
			
			for(int i=0; i<4; i++)
			{
				powerList.add(list.get(index[i]));
			}
		
			mav.addObject("powerList", powerList);
		}
		else
		{
			mav.addObject("powerList", list);
		}
		
		mav.addObject("powerSize", length);
		
		//-------------------------------------------------------- 파워링크
	
		SearchDetailDTO dto = new SearchDetailDTO();
		
		
		if(request.getParameter("search") != null)
		{
			dto.setSearch("true");
			
			if(request.getParameter("genderOption") != null)
			{	
				if(request.getParameter("gender") != null)
				{
					if(request.getParameter("gender").equals("genderM"))
						dto.setGender("true");
					else if(request.getParameter("gender").equals("genderF"))
						dto.setGender("false");
					
					if(request.getParameter("genderRate") != null
							&& (request.getParameter("genderRate").trim() != ""))
					{
						dto.setGenderRate(request.getParameter("genderRate"));
						dto.setGenderOption("true");
					}
				}
			}
			
			
			if(request.getParameter("ageOption") != null)
			{	
				if(request.getParameter("ageMin") != null
						&& request.getParameter("ageMin").trim() != "")
				{
					dto.setAgeMin(request.getParameter("ageMin"));
					dto.setAgeOption("true");
				}
				
				if(request.getParameter("ageMax") != null
						&& request.getParameter("ageMax").trim() != "")
				{
					dto.setAgeMax(request.getParameter("ageMax"));
					dto.setAgeOption("true");
				}
			}
			
			
			if(request.getParameter("dateOption") != null)
			{
				if(request.getParameter("dateMin") != null 
						&& request.getParameter("dateMin").trim() != "")
				{
					dto.setDateMin(request.getParameter("dateMin"));
					dto.setDateOption("true");
				}
				
				if(request.getParameter("dateMax") != null 
						&& request.getParameter("dateMax").trim() != "")
				{
					dto.setDateMax(request.getParameter("dateMax"));
					dto.setDateOption("true");
				}
			}
				
			
			if(request.getParameter("moneyOption") != null)
			{
				if(request.getParameter("moneyMin") != null
						&& request.getParameter("moneyMin").trim() != "")
				{
					dto.setMoneyMin(request.getParameter("moneyMin"));
					dto.setMoneyOption("true");
				}
				
				if(request.getParameter("moneyMax") != null
						&& request.getParameter("moneyMax").trim() != "")
				{
					dto.setMoneyMin(request.getParameter("moneyMax"));
					dto.setMoneyOption("true");
				}
			}

			
			if(request.getParameter("interestOption") != null)
			{
				String[] interestCK = request.getParameterValues("interestCK");
				
				
				if(interestCK != null && interestCK.length != 0)
				{
					dto.setInterestOption("true");
					dto.setInterestCK(interestCK);
				}
			}
			
			
			if(request.getParameter("tagOption") != null)
			{
				String[] tags = request.getParameterValues("tags");
				if(tags != null)
				{
					if(tags.length != 0)
					{
//							for(int i=0; i<tags.length; i++)
//								System.out.println(tags[i]);
						dto.setTagOption("true");
						dto.setTags(tags);
					}
				}
			}
		}
		
		
		String keyword = request.getParameter("keyword");
		
		if(keyword != null && keyword.trim() != "")
		{
			String[] key = keyword.split(" ");
			dto.setKeyword(key);
		}
		
		dto.setCity((String)session.getAttribute("city"));
		
		if(session.getAttribute("keynumber")!=null)
			dto.setId((String)session.getAttribute("keynumber"));
		
		ArrayList<EventDTO> eventList = dao.eventList(dto);
		int size = eventList.size();
		
		mav.addObject("size", size);
		mav.addObject("list", eventList);
		
		mav.setViewName("/WEB-INF/view/main/MainpageEvent.jsp");
		return mav;
	}
	
	
	// 메인 이벤트 페이지
	@RequestMapping(value="/whoevent.action", method=RequestMethod.GET)
	public ModelAndView WhoseEvent(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		
		IMainListDAO dao = sqlSession.getMapper(IMainListDAO.class);
		
		EventDTO dto = new EventDTO();
		
		String eventnum = request.getParameter("id");
		
		dto = dao.whoEvent(eventnum);
		
		String lGroup_id = dto.getlGroup_id();
		
		String lMember_id = String.valueOf( dto.getlMember_id() );
		
//			System.out.println(lmember_id);
//			System.out.println(eventnum);
//			
		if(lMember_id != null)
		{
			if(lGroup_id != null)
			{
				// 그룹의 이벤트 페이지
				mav.setViewName("groupevent.action?lGroup_id="+lGroup_id+"&eventId="+eventnum);
			}
			else
			{
				// 개인의 이벤트 페이지
				mav.setViewName("personalevent.action?userkey="+lMember_id+"&eventId="+eventnum);
			}
		} 
		else
		{
			mav.setViewName("redirect:/mainevent.action");
		}
		return mav;
	}
		
}
