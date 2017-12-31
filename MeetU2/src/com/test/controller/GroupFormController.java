package com.test.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.dao.EventIDAO;
import com.test.dao.IAlbumDAO;
import com.test.dao.IEventDAO;
import com.test.dao.IGroupDAO;
import com.test.dto.EventDTO;
import com.test.dto.GroupDTO;
import com.test.dto.MemberDTO;
import com.test.dto.TagDTO;
import com.test.java.FileManager;
import com.test.java.GroupStaticClass;
import com.test.dto.CategoryDTO;
import com.test.dto.CityDTO;
import com.test.dao.IMemberDAO;

@Controller
public class GroupFormController
{
	public static String GROUP_HOME = "grouphome.action";
	public static String GROUP_INTRODUCE = "groupintroduce.action";
	public static String GROUP_INFO = "groupInfo.action";
	public static String GROUP_MEMBERINFO = "groupmemberInfo.action";
	public static String GROUP_SINGUPINFO = "groupsingupInfo.action";
	public static String GROUP_BLACKLISTINFO = "groupblackListInfo.action";
	public static String GROUP_OPENINFO = "groupopenInfo.action";
	public static String GROUP_GROUPPHOTO = "groupphoto.action";
	public static String GROUP_EVENTPICTURE = "grouppageeventpicture.action";
	public static String GROUP_EVENT = "groupevent.action";
	public static String GROUP_MEMBERLIST = "groupmemberlist.action";
	public static String GROUP_TIMELINE = "grouptimeline.action";
	
	@Autowired
	private SqlSession sqlsession;
	
	// 그룹만들기
	@RequestMapping(value="/groupform.action")
	public String GroupForm(HttpSession session, ModelMap map)
	{
		// 데이터 받기
		if(session.getAttribute("keynumber")==null || session.getAttribute("admin")!=null)
			return "/loginform.action";
		
		IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);
		
		ArrayList<CategoryDTO> categorylist = groupDAO.categoryList();
		ArrayList<CityDTO> citylist = groupDAO.citytypelist();
		
		map.addAttribute("categorylist", categorylist);
		map.addAttribute("citylist", citylist);
		
		return "/WEB-INF/view/group/GroupCreate.jsp";
	}
	
	@RequestMapping(value="/groupform2.action")
	public String GroupForm2(HttpServletRequest request, HttpSession session, ModelMap map)
	{
		// 데이터 받기
		String groupName = request.getParameter("groupName");
		String citype = request.getParameter("citype");
		String[] tags = request.getParameterValues("tags");
		String pub = request.getParameter("pub")==null?"3":request.getParameter("pub");
		
		com.test.dao.IMemberDAO groupDAO = sqlsession.getMapper(com.test.dao.IMemberDAO.class);
		ArrayList<CategoryDTO> categorylist =  groupDAO.categoryList();
		
		map.addAttribute("categorylist", categorylist);
		map.addAttribute("groupName", groupName);
		map.addAttribute("citype", citype);
		map.addAttribute("tags", tags);
		map.addAttribute("pub", pub);
		
		return "/WEB-INF/view/group/GroupCreate2.jsp";
	}
	
	@RequestMapping(value="/groupinsert.action")
	public String GroupInsert(HttpServletRequest request, HttpSession session)
	{
		// 데이터 받기
		if(session.getAttribute("keynumber")==null || session.getAttribute("admin")!=null)
			return "/loginform.action";
		
		String groupName = request.getParameter("groupName");	// 그룹 이름
		String citype = request.getParameter("citype");			// 카테고리
		String[] chk = request.getParameterValues("chk");		// 관심사
		String[] tags = request.getParameterValues("tags");		// 태그들
		String pub = request.getParameter("pub");				// 공개범위
		
		
		
		int keynum = Integer.parseInt((String)session.getAttribute("keynumber")); // 대표번호
		
		HashMap<String, Object> groupMap = new HashMap<String, Object>();
		groupMap.put("member_id", keynum);
		groupMap.put("group_name", groupName);
		groupMap.put("citype_id", citype);
		groupMap.put("public_gr", Integer.parseInt(pub));
		groupMap.put("public_grl", 3);
		groupMap.put("public_gra", 3);
		groupMap.put("group_info", "소개를 써주세요.");
		
		IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);
		groupDAO.addGroup(groupMap);
		
		String lGroup_id = groupMap.get("result").toString();
		System.out.println("result : " + lGroup_id);
		
		// 태그 넣기
		
		if(tags != null)
		{
			List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
			HashMap<String, Object> HashTag = null;
			
			for(int i=0; i<tags.length; i++)
			{ 
				HashTag = new HashMap<String, Object>();
				HashTag.put("seq", groupDAO.groupSEQ());
				HashTag.put("tagName", tags[i]);
				HashTag.put("lGroup_id", lGroup_id);
				
				list.add(HashTag);
			}
			
			groupDAO.addTag(list);
		}
		
		// 관심사
		if(chk != null)
		{
			List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
			HashMap<String, Object> HashTag = null;
			
			for(int i=0; i<chk.length; i++)
			{ 
				HashTag = new HashMap<String, Object>();
				HashTag.put("seq", groupDAO.groupSEQ());
				HashTag.put("category_code", chk[i]);
				HashTag.put("lGroup_id", lGroup_id);
				
				list.add(HashTag);
			}
			
			groupDAO.addCategory(list);
		}
		
		return "/grouphome.action";
	}
	
	
	@RequestMapping(value = "/grouphome.action")
	public ModelAndView GroupHome(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);
			
			String lMember_id = (String) session.getAttribute("keynumber");
			
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			if (lMember_id != null)
			{
				String bgCheck = groupDAO.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				mav.addObject("bgCheck", bgCheck);
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null)
				{
					groupPower = "5";
				}
			}

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			ArrayList<CategoryDTO> groupCategorys = groupDAO.getGroupCategorys(lGroup_id);
			ArrayList<TagDTO> groupTags = groupDAO.getGroupTags(lGroup_id);

			ArrayList<EventDTO> preEventDtos = groupDAO.getPreEventLists(GroupStaticClass.getGroupAndCountMap(lGroup_id, 2));
			ArrayList<EventDTO> posEventDtos = groupDAO.getPosEventLists(GroupStaticClass.getGroupAndCountMap(lGroup_id, 2));

			mav.setViewName("/WEB-INF/view/group/groupPageHome.jsp");
			mav.addObject("groupPower", groupPower);
			mav.addObject("groupCategorys", groupCategorys);
			mav.addObject("groupTags", groupTags);
			mav.addObject("groupInfo", groupDTO);
			mav.addObject("preEventDtos", preEventDtos);
			mav.addObject("posEventDtos", posEventDtos);
			mav.addObject("lGroup_id", lGroup_id);
			mav.addObject("groupPower", groupPower);
			System.out.println(lGroup_id);
			System.out.println(lMember_id);
			System.out.println(groupPower);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupintroduce.action", method = RequestMethod.GET)
	public ModelAndView GroupIntroduce(HttpServletRequest request)
	{

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			if (lMember_id != null)
			{
				
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null)
				{
					groupPower = "5";
				}
				
				String bgCheck = groupDAO.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				mav.addObject("bgCheck", bgCheck);
				
			}
			mav.setViewName("/WEB-INF/view/group/groupPageGroupIntroduce.jsp");
			mav.addObject("lGroup_id", lGroup_id);
			mav.addObject("groupPower", groupPower);
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);

			mav.addObject("groupInfo", groupDTO);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupInfo.action", method = RequestMethod.GET)
	public ModelAndView GroupInfo(HttpServletRequest request)
	{

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);
			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower != null)
				{
					
					if (groupPower.equals("2"))
					{
						mav.setViewName("redirect:/" + GroupFormController.GROUP_MEMBERINFO);
						return mav;
					} else if (groupPower.equals("1"))
					{

					} else
					{
						mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
						return mav;
					}
					String bgCheck = groupDAO.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
					mav.addObject("bgCheck", bgCheck);
				}
			}
			ArrayList<CategoryDTO> groupCategorys = groupDAO.getGroupCategorys(lGroup_id);
			ArrayList<TagDTO> groupTags = groupDAO.getGroupTags(lGroup_id);
			
			
			
			mav.setViewName("/WEB-INF/view/group/groupPageC_groupInfo.jsp");
			mav.addObject("groupPower", groupPower);
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			
			mav.addObject("tags", groupTags);
			mav.addObject("categorys", groupCategorys);
			mav.addObject("usableCategorys", groupDAO.getGroupUsableCategorys(lGroup_id));
			
			mav.addObject("tagCount", groupTags.size());
			mav.addObject("categoryCount", groupCategorys.size());
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
	@RequestMapping(value = "/groupmemberInfo.action", method = RequestMethod.GET)
	public ModelAndView GroupmemberInfo(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);
			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower != null)
				{
					if (groupPower.equals("1") || groupPower.equals("2"))
					{

					} else
					{
						mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
						return mav;
					}
					
				}
				String bgCheck = groupDAO.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				mav.addObject("bgCheck", bgCheck);
			}
			
			ArrayList<MemberDTO> groupAdmins = groupDAO.getGroupMember(GroupStaticClass.getGrlist(lGroup_id, "2"));
			ArrayList<MemberDTO> groupMembers = groupDAO.getGroupMember(GroupStaticClass.getGrlist(lGroup_id, "3"));

			mav.addObject("groupAdmins", groupAdmins);
			mav.addObject("groupMembers", groupMembers);
			
			
			mav.setViewName("/WEB-INF/view/group/groupPageC_memberInfo.jsp");
			mav.addObject("groupPower", groupPower);
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupsingupInfo.action", method = RequestMethod.GET)
	public ModelAndView GroupsingupInfo(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);
			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower != null)
				{
					if (groupPower.equals("1") || groupPower.equals("2"))
					{

					} else
					{
						mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
						return mav;
					}
				}
				String bgCheck = groupDAO.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				mav.addObject("bgCheck", bgCheck);
			}

			mav.setViewName("/WEB-INF/view/group/groupPageC_singupInfo.jsp");
			mav.addObject("groupPower", groupPower);
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			mav.addObject("groupMember", groupDAO.getGroupMember(GroupStaticClass.getGrlist(lGroup_id, "6")));
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupblackListInfo.action", method = RequestMethod.GET)
	public ModelAndView GroupblackListInfo(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);
			IMemberDAO memberDAO = sqlsession.getMapper(IMemberDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);
			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower != null)
				{
					if (groupPower.equals("1") || groupPower.equals("2"))
					{

					} else
					{
						mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
						return mav;
					}
				}
				String bgCheck = groupDAO.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				mav.addObject("bgCheck", bgCheck);
			}
			String targetId = request.getParameter("targetId");
			if(targetId == null || targetId.equals(""))
			{
				
			}
			else {
				mav.addObject("member", memberDAO.getMemberOfRealid(targetId));
			}
			mav.setViewName("/WEB-INF/view/group/groupPageC_blackListInfo.jsp");
			mav.addObject("groupPower", groupPower);
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			mav.addObject("blacks", groupDAO.getGroupBlackList(lGroup_id));

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupopenInfo.action", method = RequestMethod.GET)
	public ModelAndView GroupopenInfo(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);
			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower != null)
				{
					if (groupPower.equals("2"))
					{
						mav.setViewName("redirect:/" + GroupFormController.GROUP_MEMBERINFO);
					} else if (groupPower.equals("1"))
					{

					} else
					{
						mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
						return mav;
					}
				}
				String bgCheck = groupDAO.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				mav.addObject("bgCheck", bgCheck);
			}

			mav.addObject("groupPower", groupPower);
			mav.addObject("options", groupDAO.getGroupPublicList());
			mav.setViewName("/WEB-INF/view/group/groupPageC_openInfo.jsp");

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupphoto.action", method = RequestMethod.GET)
	public ModelAndView GroupPhoto(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);
			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null)
				{
					groupPower = "5";
				}
				// 블랙리스트 여부확인 : NULL = 비회원, 0 = 그룹블랙X, 1 = 그룹블랙O
				String bgCheck = groupDAO.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				mav.addObject("bgCheck", bgCheck);
			}			
			mav.addObject("groupPower", groupPower);
			mav.setViewName("/WEB-INF/view/group/groupPagePhoto.jsp");
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			mav.addObject("albums", groupDAO.getGroupEventAlbums(lGroup_id));

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
	@RequestMapping(value = "/grouppageeventpicture.action", method = RequestMethod.GET)
	public ModelAndView GroupPageEventPicture(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);
			IAlbumDAO albumDAO = sqlsession.getMapper(IAlbumDAO.class);
			IEventDAO eventDAO = sqlsession.getMapper(IEventDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null)
				{
					groupPower = "5";
				}
				// 블랙리스트 여부확인 : NULL = 비회원, 0 = 그룹블랙X, 1 = 그룹블랙O
				String bgCheck = groupDAO.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				mav.addObject("bgCheck", bgCheck);
			}
			mav.addObject("lGroup_id", lGroup_id);
			mav.addObject("groupPower", groupPower);
			mav.setViewName("/WEB-INF/view/group/groupPageEventPicture.jsp");
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String eventId = request.getParameter("eventId");
			
			
			String albumId = eventDAO.getAlbumId(eventId);
			if(albumId == null) {
				mav.setViewName("redirect:/" + GroupFormController.GROUP_GROUPPHOTO);
				return mav;
			}

			mav.addObject("pictures", albumDAO.getGroupAlbumPictures(albumId));
			mav.addObject("album", albumDAO.getAlbumInfo(albumId));
			String attendId = eventDAO.getAttendId(GroupStaticClass.getEventUesd(eventId, lMember_id));
			mav.addObject("attendId", attendId);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupevent.action")
	public ModelAndView GroupEvent(HttpServletRequest request)
	{

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);
			IEventDAO eventDAO = sqlsession.getMapper(IEventDAO.class);
			
			CommentController co = new CommentController();
			mav = co.getComment(request, session, sqlsession);
			
			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);
			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null)
				{
					groupPower = "5";
				}
				String bgCheck = groupDAO.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				mav.addObject("bgCheck", bgCheck);
				
			} else {
				lMember_id = "0";
			}
			String eventId = request.getParameter("eventId");
			if (eventId == null || eventId.equals(""))
			{
				mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
				return mav;
			}

			ArrayList<MemberDTO> yesAttends = eventDAO.getAttendMember(GroupStaticClass.getEalist(eventId, "1", 1, 5));
			ArrayList<MemberDTO> noAttends = eventDAO.getAttendMember(GroupStaticClass.getEalist(eventId, "2", 1, 5));
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			HashMap<String, Object> sortMap = eventDAO.getSortValues(eventId);
			
			int women = (Integer) sortMap.get("F");
			int men = (Integer) sortMap.get("M");
			int age10 = (Integer) sortMap.get("AGE10");
			int age20 = (Integer) sortMap.get("AGE20");
			int age30 = (Integer) sortMap.get("AGE30");
			int age40 = (Integer) sortMap.get("AGE40");
			int total = women + men;

			if (total != 0)
			{
				women = 100 * (women / total);
				men = 100 * (men / total);
				women += 100 - women - men;
			} else
			{

				age10 = 25;
				age20 = 25;
				age30 = 25;
				age40 = 25;

			}
			
			String attendId = eventDAO.getAttendId(GroupStaticClass.getEventUesd(eventId, lMember_id));
			mav.addObject("eventUsed", eventDAO.getEventUsed(eventId));
			mav.addObject("groupInfo", groupDTO);
			mav.addObject("eventId", eventId);
			mav.addObject("eventInfo", eventDAO.getEventInfo(GroupStaticClass.getEventUesd(eventId, lMember_id)).get(0));
			mav.addObject("tags", eventDAO.getEventTags(eventId));
			mav.addObject("groupPower", groupPower);
			mav.addObject("yesAttends", yesAttends);
			mav.addObject("noAttends", noAttends);
			mav.addObject("women", women);
			mav.addObject("men", men);
			mav.addObject("age10", age10);
			mav.addObject("age20", age20);
			mav.addObject("age30", age30);
			mav.addObject("age40", age40);
			mav.addObject("attendId", attendId);
			mav.addObject("lMember_id", lMember_id);
			
			String acceptAlbum = groupDAO.getGroupAcceptAlbum(eventId);
			if(acceptAlbum != null) {
				mav.addObject("acceptAlbum", acceptAlbum);
			}
			
			mav.setViewName("/WEB-INF/view/group/groupPageEvent.jsp");
			mav.addObject("lGroup_id", lGroup_id);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupmemberlist.action", method = RequestMethod.GET)
	public ModelAndView GroupMemberList(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null)
				{
					groupPower = "5";
				}
				String bgCheck = groupDAO.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				mav.addObject("bgCheck", bgCheck);
			}

			ArrayList<MemberDTO> groupMaster = groupDAO.getGroupMember(GroupStaticClass.getGrlist(lGroup_id, "1"));
			ArrayList<MemberDTO> groupAdmins = groupDAO.getGroupMember(GroupStaticClass.getGrlist(lGroup_id, "2"));
			ArrayList<MemberDTO> groupMembers = groupDAO.getGroupMember(GroupStaticClass.getGrlist(lGroup_id, "3"));

			mav.addObject("lGroup_id", lGroup_id);
			mav.addObject("groupMaster", groupMaster);
			mav.addObject("groupAdmins", groupAdmins);
			mav.addObject("groupMembers", groupMembers);

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			mav.addObject("groupPower", groupPower);
			mav.setViewName("/WEB-INF/view/group/groupPageMemberlist.jsp");
			mav.addObject("lGroup_id", lGroup_id);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/grouptimeline.action")
	public ModelAndView GroupTimeLine(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);
			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null)
				{
					groupPower = "5";
				}
				
				String bgCheck = groupDAO.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				mav.addObject("bgCheck", bgCheck);
			}

			ArrayList<EventDTO> groupEvents = groupDAO.getEventLists(lGroup_id);
			mav.addObject("groupEvents", groupEvents);

			mav.setViewName("/WEB-INF/view/group/groupPageTimeline.jsp");
			mav.addObject("lGroup_id", lGroup_id);
			mav.addObject("groupPower", groupPower);
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupjoin.action", method = RequestMethod.GET)
	public ModelAndView GroupJoinAction(HttpServletRequest request)
	{

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);
			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			if (lMember_id != null)
			{
				
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				
			} else {
				
				mav.setViewName("redirect:/loginform.action");
				return mav;
				
			}
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);

			if (groupDTO.getGrauto_accept() == 1)
			{
				if (groupPower == null)
				{
					groupDAO.InsertGroupMember(GroupStaticClass.getGroupJoin(lGroup_id, lMember_id, 3));
				} else
				{
					groupDAO.changeGroupMemberPower(GroupStaticClass.getGroupJoin(lGroup_id, lMember_id, 3));
				}
			} else
			{
				if (groupPower == null)
				{
					groupDAO.InsertGroupMember(GroupStaticClass.getGroupJoin(lGroup_id, lMember_id, 6));
				} else
				{
					groupDAO.changeGroupMemberPower(GroupStaticClass.getGroupJoin(lGroup_id, lMember_id, 6));
				}
			}
			mav.addObject("groupInfo", groupDTO);
			mav.addObject("groupPower", groupPower);
			mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
			mav.addObject("lGroup_id", lGroup_id);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupjoinwaitclose.action", method = RequestMethod.GET)
	public ModelAndView Groupjoinwaitclose(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null)
				{
					groupPower = "5";
				}
			}

			groupDAO.changeGroupMemberPower(GroupStaticClass.getGroupJoin(lGroup_id, lMember_id, 5));

			mav.addObject("lGroup_id", lGroup_id);
			mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupsingupchange.action", method = RequestMethod.GET)
	public ModelAndView GroupSinghupChange(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			int singupVal;
			if (groupDTO.getGrauto_accept() == 1)
			{
				singupVal = 0;
			} else
			{
				singupVal = 1;
			}

			groupDAO.singupchangeGroup(GroupStaticClass.getSingupMap(lGroup_id, singupVal));
			mav.setViewName("redirect:/" + GroupFormController.GROUP_SINGUPINFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupoptionchange.action", method = RequestMethod.POST)
	public ModelAndView GroupOptionChange(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);

			String public_gr = request.getParameter("groupOpen");
			String public_grl = request.getParameter("memberListOpen");
			String public_gra = request.getParameter("photoOpen");

			// 업데이트 하는 부분
			groupDAO.changeGroupOption(GroupStaticClass.getGroupOptionMap(lGroup_id, public_gr, public_gra, public_grl));

			mav.setViewName("redirect:/" + GroupFormController.GROUP_OPENINFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupapprovesingup.action", method = RequestMethod.GET)
	public ModelAndView GroupApproveSingup(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1") || groupPower.equals("2")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String targetId = request.getParameter("targetId");

			// 업데이트 하는 부분
			groupDAO.changeGroupMemberPower(GroupStaticClass.getGroupJoin(lGroup_id, targetId, 3));

			mav.setViewName("redirect:/" + GroupFormController.GROUP_SINGUPINFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupremovesingup.action", method = RequestMethod.GET)
	public ModelAndView GroupRemoveSingup(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1") || groupPower.equals("2")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String targetId = request.getParameter("targetId");

			// 업데이트 하는 부분
			groupDAO.changeGroupMemberPower(GroupStaticClass.getGroupJoin(lGroup_id, targetId, 5));

			mav.setViewName("redirect:/" + GroupFormController.GROUP_SINGUPINFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupremoveblack.action", method = RequestMethod.GET)
	public ModelAndView GroupRemoveBlack(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1") || groupPower.equals("2")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String targetId = request.getParameter("targetId");

			// 업데이트 하는 부분
			groupDAO.removeGroupBlackList(GroupStaticClass.getGroupAndTargetMap(lGroup_id, targetId));

			mav.setViewName("redirect:/" + GroupFormController.GROUP_BLACKLISTINFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupgetoutmember.action", method = RequestMethod.GET)
	public ModelAndView GroupRemoveMember(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1") || groupPower.equals("2")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String targetId = request.getParameter("targetId");
			
			// 업데이트 하는 부분
			groupDAO.removeGroupMember(GroupStaticClass.getGroupAndTargetMap(lGroup_id, targetId));

			mav.setViewName("redirect:/" + GroupFormController.GROUP_MEMBERINFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupswitchmaster.action", method = RequestMethod.GET)
	public ModelAndView GroupSwitchMaster(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);

			String targetId = request.getParameter("targetId");

			// 업데이트 하는 부분
			
			HashMap<String , Object> memberMap = new HashMap<String, Object>();
			memberMap.put("GROUP_ID", lGroup_id);
			memberMap.put("TARGET_ID", targetId);
			
			groupDAO.changeGroupMaster(memberMap);

			mav.setViewName("redirect:/" + GroupFormController.GROUP_OPENINFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupupgrademember.action", method = RequestMethod.GET)
	public ModelAndView GroupUpgradeMember(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);

			String targetId = request.getParameter("targetId");
			// 업데이트 하는 부분
			groupDAO.changeGroupMemberPower(GroupStaticClass.getGroupJoin(lGroup_id, targetId, 2));

			mav.setViewName("redirect:/" + GroupFormController.GROUP_MEMBERINFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/groupdowngrademember.action", method = RequestMethod.GET)
	public ModelAndView GroupDowngradeMember(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}
			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);

			String targetId = request.getParameter("targetId");
			// 업데이트 하는 부분
			groupDAO.changeGroupMemberPower(GroupStaticClass.getGroupJoin(lGroup_id, targetId, 3));

			mav.setViewName("redirect:/" + GroupFormController.GROUP_MEMBERINFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
	@RequestMapping(value = "/groupblackinsert.action", method = RequestMethod.POST)
	public ModelAndView GroupBlackInsert(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("blackGroupId");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1") || groupPower.equals("2")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String targetId = request.getParameter("blackMemberId");
			String blackText = request.getParameter("blackText");
			// 업데이트 하는 부분
			groupDAO.insertGroupBlack(GroupStaticClass.getGroupBlackMap(lMember_id, lGroup_id, targetId, blackText));

			mav.setViewName("redirect:/" + GroupFormController.GROUP_BLACKLISTINFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
	// 1
	
	@RequestMapping(value = "/groupremovecategory.action", method = RequestMethod.GET)
	public ModelAndView GroupRemoveCategory(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1") || groupPower.equals("2")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String target = request.getParameter("targetId");
			groupDAO.removeGroupCategory(target);

			mav.setViewName("redirect:/" + GroupFormController.GROUP_INFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	@RequestMapping(value = "/groupremovetag.action", method = RequestMethod.GET)
	public ModelAndView GroupRemoveTag(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1") || groupPower.equals("2")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String target = request.getParameter("targetId");
			groupDAO.removeGroupTag(target);

			mav.setViewName("redirect:/" + GroupFormController.GROUP_INFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	@RequestMapping(value = "/groupaddcategory.action", method = RequestMethod.GET)
	public ModelAndView GroupAddCategory(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1") || groupPower.equals("2")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String target = request.getParameter("targetId");
			groupDAO.addGroupCategory(GroupStaticClass.getGroupAndTargetMap(lGroup_id, target));

			mav.setViewName("redirect:/" + GroupFormController.GROUP_INFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	@RequestMapping(value = "/groupaddtag.action", method = RequestMethod.GET)
	public ModelAndView GroupAddTag(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1") || groupPower.equals("2")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String target = "#" + request.getParameter("targetId");
			// 업데이트 하는 부분
			groupDAO.addGroupTag(GroupStaticClass.getGroupAndTargetMap(lGroup_id, target));

			mav.setViewName("redirect:/" + GroupFormController.GROUP_INFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
	@RequestMapping(value = "/groupupdateinfo.action", method = RequestMethod.GET)
	public ModelAndView GroupUpdateInfo(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1") || groupPower.equals("2")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String target = request.getParameter("targetId");
			// 업데이트 하는 부분
			groupDAO.updateGroupInfo(GroupStaticClass.getGroupAndTargetMap(lGroup_id, target));

			mav.setViewName("redirect:/" + GroupFormController.GROUP_INFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
	@RequestMapping(value = "/groupupdatesubject.action", method = RequestMethod.GET)
	public ModelAndView GroupUpdateSubject(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1") || groupPower.equals("2")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String target = request.getParameter("targetId");
			// 업데이트 하는 부분
			groupDAO.updateGroupSubject(GroupStaticClass.getGroupAndTargetMap(lGroup_id, target));

			mav.setViewName("redirect:/" + GroupFormController.GROUP_INFO);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	@RequestMapping(value = "/groupaddalbum.action", method = RequestMethod.GET)
	public ModelAndView GroupAddAlbum(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		try
		{
			IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);
			IEventDAO eventDAO = sqlsession.getMapper(IEventDAO.class);

			String lMember_id = (String) session.getAttribute("keynumber");
			String groupPower = "0";
			String lGroup_id = request.getParameter("lGroup_id");
			if (lGroup_id == null || lGroup_id.equals(""))
			{
				mav.setViewName("redirect:/maingroup.action");
				return mav;
			}
			mav.addObject("lGroup_id", lGroup_id);

			if (lMember_id != null)
			{
				groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
				if (groupPower == null || !(groupPower.equals("1") || groupPower.equals("2")))
				{
					mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
					return mav;
				}
			}

			GroupDTO groupDTO = groupDAO.getGroupInfo(lGroup_id);
			mav.addObject("groupInfo", groupDTO);
			String eventId = request.getParameter("eventId");
			// 인설트 하는 부분
			String grlistId = groupDAO.getGrlist(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
			eventDAO.addAlbum(GroupStaticClass.getGrlistAndEventMap(grlistId, eventId));
			mav.addObject("eventId", eventId);
			mav.setViewName("redirect:/" + GroupFormController.GROUP_EVENT);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
	@Resource(name = "fileManager")
	private FileManager fileManager;
	
	@RequestMapping(value="/groupprofile.action")
	public String GroupProfile(HttpSession session, HttpServletRequest request, ModelMap map)
	{
		// 이미지 저장 경로 설정
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "image";
		
		// 데이터 가져오기
		String drag = request.getParameter("dragv");
		String lGroup_id = request.getParameter("lGroup_id");
		
		// 파일 생성
		File dir = new File(pathname);

		// 폴더가 없을 경우 생성
		if (!dir.exists())
			dir.mkdirs();
		
		// 이미지가 설정되어있나 없나 확인 후 업로드
		if(!drag.equals("/images/defaultgr.png"))
			drag = fileManager.ChangeImg(drag, pathname);
		
		IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);
		
		HashMap<String, String> groupproMap = new HashMap<String, String>();
		
		groupproMap.put("drag", drag);
		groupproMap.put("lGroup_id", lGroup_id);
		
		groupDAO.groupProfile(groupproMap);
		
		map.addAttribute("lGroup_id", lGroup_id);
		
		return "redirect:/groupInfo.action";
	}
	
	@RequestMapping(value="/eventupdateform.action")
	public String EventUpdateFrom(HttpServletRequest request, HttpSession session, ModelMap map)
	{
		// 데이터 받기
		String eventId = request.getParameter("eventId");
		String lGroup_id = request.getParameter("lGroup_id");
		
		IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);
		IEventDAO eventDAO = sqlsession.getMapper(IEventDAO.class);
		EventIDAO dao2 = sqlsession.getMapper(EventIDAO.class);
		String keynumber = (String)session.getAttribute("keynumber");
		
		ArrayList<EventDTO> dto = eventDAO.getEventInfo(GroupStaticClass.getEventUesd(eventId, (String)session.getAttribute("keynumber")));
		
		/*	SEQ             IN  EVENT.LEVENT_ID%TYPE
		, EVENT_NAME      IN  EVENT.EVENT_NAME%TYPE
		, CITY_CODE       IN  NUMBER
		, LOC_GEOLAT      IN  EVENT.LOC_GEOLAT%TYPE
		, LOC_GEOLNG      IN  EVENT.LOC_GEOLNG%TYPE
		, EVENT_PLACE     IN  EVENT.EVENT_PLACE%TYPE
		, EVENT_INFO      IN  EVENT.EVENT_INFO%TYPE
		, EVENT_DATE      IN  VARCHAR
		, EVENT_MINATTEND IN  EVENT.EVENT_MINATTEND%TYPE
		, EVENT_MAXATTEND IN  EVENT.EVENT_MAXATTEND%TYPE
		, EVENT_MINM      IN  EVENT.EVENT_MINM%TYPE
		, EVENT_URL       IN  EVEPROFILE.EVEPROFILE_URL%TYPE
		, MBPUBLICTI_ID   IN  Eveattend.Mbpublicti_ID%TYPE*/
		
		
//		System.out.println(dto.get(0).getAttend_count());   // 1
//		System.out.println(dto.get(0).getCity_code());      // null
//		System.out.println(dto.get(0).getCity_name());      // 충청북도 청주시 상당구 낭성면 갈산1길
//		System.out.println(dto.get(0).getEveattend_id());   // 1
//		System.out.println(dto.get(0).getEvent_date());     // null
//		System.out.println(dto.get(0).getEvent_gender());   // 0
//		System.out.println(dto.get(0).getEvent_hm());       // 11 : 44
//		System.out.println(dto.get(0).getEvent_info());     // <p>123213123123</p>
//		System.out.println(dto.get(0).getEvent_maxAge());   // 0
//		System.out.println(dto.get(0).getEvent_maxattend());// 6
//		System.out.println(dto.get(0).getEvent_maxMoney()); // 0
//		System.out.println(dto.get(0).getEvent_minAge());   // 0
//		System.out.println(dto.get(0).getEvent_minattend());// 0
//		System.out.println(dto.get(0).getEvent_minm());     // 123123
//		System.out.println(dto.get(0).getEvent_name());     // 되니?
//		System.out.println(dto.get(0).getEvent_place());    // 123123123
//		System.out.println(dto.get(0).getEvent_url());      // /uploads/image/201712141044306241566120172.png
//		System.out.println(dto.get(0).getEvent_ymd());      // 2017년 12월 16일
//		System.out.println(dto.get(0).getEventused());      // 1
//		System.out.println(dto.get(0).getEvestatus_id());   // 1
//		System.out.println(dto.get(0).getLevent_id());      // 399
//		System.out.println(dto.get(0).getLgroup_id());      // 324
//		System.out.println(dto.get(0).getLgroup_name());    // 비공개
//		System.out.println(dto.get(0).getLmember_id());     // 5
//		System.out.println(dto.get(0).getLoc_geolat());     // 36.6226068
//		System.out.println(dto.get(0).getLoc_geolng());     // 127.6039725
//		System.out.println(dto.get(0).getPublic_age());     // 1
//		System.out.println(dto.get(0).getPublic_attendl()); // 1
//		System.out.println(dto.get(0).getPublic_eve());     // 2
//		System.out.println(dto.get(0).getPublic_eveName()); // 회원공개
//		System.out.println(dto.get(0).getPublic_gender());  // 1
//		System.out.println(dto.get(0).getPublic_place());   // 1
		
		String birthday = dto.get(0).getEvent_ymd().replaceAll(" ", "-").replace("년", "").replace("월", "").replace("일", "");
		String picker = dto.get(0).getEvent_hm().replaceAll(" ", "");
		
		ArrayList<com.test.dto.EEventDTO> grouplist = dao2.groupList(keynumber);
		ArrayList<com.test.dto.EEventDTO> categorylist = dao2.categoryList(); // 카테고리 리스트
		ArrayList<com.test.dto.EEventDTO> publiclist = dao2.evepublicList();	// 공개범위 리스트 처음뿌려주기용
		map.addAttribute("grouplist", grouplist);
		map.addAttribute("categorylist", categorylist);
		map.addAttribute("publiclist", publiclist);
		
		map.addAttribute("eventId", eventId);
		map.addAttribute("lGroup_id", lGroup_id);
		map.addAttribute("eventName", dto.get(0).getEvent_name());
		map.addAttribute("mbPublic", dto.get(0).getPublic_eveName());
		map.addAttribute("minsu", dto.get(0).getEvent_minattend());
		map.addAttribute("maxsu", dto.get(0).getEvent_maxattend());
		map.addAttribute("money", dto.get(0).getEvent_minm());
		map.addAttribute("drags", dto.get(0).getEvent_url());
		map.addAttribute("content", dto.get(0).getEvent_info());
		map.addAttribute("lGroup_id", String.valueOf(dto.get(0).getLgroup_id()));
		map.addAttribute("url", dto.get(0).getEvent_url());
		map.addAttribute("birthday", birthday);
		map.addAttribute("picker", picker);
		map.addAttribute("place", dto.get(0).getCity_name()+" 　/"+dto.get(0).getEvent_place());
		map.addAttribute("categore_id", groupDAO.categoryupdate(eventId));
		map.addAttribute("lat", dto.get(0).getLoc_geolat());
		map.addAttribute("lng", dto.get(0).getLoc_geolng());

		return "WEB-INF/view/event/EventUpdate.jsp";
	}
	
	@RequestMapping(value="/eventupdate.action", method = RequestMethod.POST)
	public String EventUpdate(HttpServletRequest request, HttpSession session, ModelMap maps)
	{
		String eventId = request.getParameter("eventId");		// 이벤트 고유 아이디
		String eventName = request.getParameter("eventName");	// 이벤트 명
		String mbPublic = request.getParameter("mbPublic");		// 공개범위
		String datepicker = request.getParameter("datepicker");	// 날짜
		String time = request.getParameter("time");				// 시간
		String map = request.getParameter("map");				// 위치
		String minsu = request.getParameter("minsu");			// 최소인원
		String maxsu = request.getParameter("maxsu");			// 최대인원
		String money = request.getParameter("money");			// 참가비
		String content = request.getParameter("content");		// 소개
		String lat = request.getParameter("lat");				// 좌표
		String lng = request.getParameter("lng");				// 좌표
		String dragv = request.getParameter("dragv");			// 사진 base64 인코딩 값
		String url = request.getParameter("url");				// 초기 사진 주소
		String lGroup_id = request.getParameter("lGroup_id");		// 그룹 아이디
		
		EventIDAO groupDAO = sqlsession.getMapper(EventIDAO.class);
		
		// 이미지 저장 경로 설정
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "image";
		
		// city_code 가져오기
		String loadName = map.split("/")[0];
		String place = map.split("/")[1];
		loadName = loadName.substring(0, loadName.lastIndexOf(" "));
		String city_code = groupDAO.getCityCode(loadName);
		
		// 시간 가져오기 + 날짜와 합치기
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm a", Locale.US);
		
		String picker = datepicker+" "+time;
		Date date = null;
		String dateString = null;
		try
		{
			date = format.parse(picker);
			dateString = format.format(date);

			format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			dateString = format.format(date);
			
		} catch (ParseException e)
		{
			e.printStackTrace();
		}
		
		// 파일 생성
		File dir = new File(pathname);

		// 폴더가 없을 경우 생성
		if (!dir.exists())
			dir.mkdirs();
		
		// 이미지가 설정되어있나 없나 확인 후 업로드
		if(!dragv.equals(url))
			dragv = fileManager.ChangeImg(dragv, pathname);
		else
			dragv = url;

		HashMap<String, Object> eventMap = new HashMap<String, Object>();
		
		System.out.println(eventId);
		System.out.println(eventName);
		System.out.println(city_code);
		System.out.println(lat);
		System.out.println(lng);
		System.out.println(place);
		System.out.println(content);
		System.out.println(dateString);
		System.out.println(minsu);
		System.out.println(maxsu);
		System.out.println(money);
		System.out.println(dragv);
		System.out.println(mbPublic);
		
		eventMap.put("event_id", eventId);
		eventMap.put("event_name", eventName);
		eventMap.put("city_code", city_code);
		eventMap.put("loc_geolat", lat);
		eventMap.put("loc_geolng", lng);
		eventMap.put("event_place", place);
		eventMap.put("event_info", content);
		eventMap.put("event_date", dateString);
		eventMap.put("event_minattend", minsu);
		eventMap.put("event_maxattend", maxsu);
		eventMap.put("minm", money);
		eventMap.put("url", dragv);
		eventMap.put("mbpublic", mbPublic);
		
		IGroupDAO dao2 = sqlsession.getMapper(IGroupDAO.class);
		dao2.eventupdate(eventMap);
		
		maps.addAttribute("lGroup_id", lGroup_id);
		maps.addAttribute("eventId", eventId);
		
		return "/groupevent.action";
	}
	
	@RequestMapping(value = "/groupseteventattend.action", method = RequestMethod.GET)
   public ModelAndView GroupSetEventAttend(HttpServletRequest request)
   {
      ModelAndView mav = new ModelAndView();
      HttpSession session = request.getSession();
      

      try
      {
         IGroupDAO groupDAO = sqlsession.getMapper(IGroupDAO.class);
 		 IEventDAO eventDAO = sqlsession.getMapper(IEventDAO.class);
         String lMember_id = (String) session.getAttribute("keynumber");
         String groupPower = "0";
         String lGroup_id = request.getParameter("lGroup_id");
         if (lGroup_id == null || lGroup_id.equals(""))
         {
            mav.setViewName("redirect:/maingroup.action");
            return mav;
         }
         mav.addObject("lGroup_id", lGroup_id);
         if (lMember_id != null)
         {
            groupPower = groupDAO.getGroupPower(GroupStaticClass.getGroupAndTargetMap(lGroup_id, lMember_id));
            if (groupPower == null)
            {
               groupPower = "5";
            }
            
         }
         
         String eventId = request.getParameter("eventId");
         mav.addObject("eventId", eventId);
         String target = request.getParameter("target");
         String attendId = eventDAO.getAttendId(GroupStaticClass.getEventUesd(eventId, lMember_id));
         
         System.out.println(target);
         System.out.println(attendId);
         
         if(attendId == null) {
        	 eventDAO.addEveAttend(GroupStaticClass.getEventAndMemberAndAttendMap(eventId, lMember_id, target));
         } else {
            if(!attendId.equals(target))
            {
            	eventDAO.updateEveAttend(GroupStaticClass.getEventAndMemberAndAttendMap(eventId, lMember_id, target));
            }
         }
         mav.setViewName("redirect:/" + GroupFormController.GROUP_EVENT);

      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      return mav;
   }
	@RequestMapping(value="/groupeventpictureupload.action")
	public String GroupEventPictureUpload(HttpSession session, HttpServletRequest request, ModelMap map)
	{
		// 이미지 저장 경로 설정
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "image";

		// 데이터 가져오기
		String lMember_id = (String) session.getAttribute("keynumber");
		String drag = request.getParameter("dragv");
		String lGroup_id = request.getParameter("lGroup_id");
		String albumId = request.getParameter("albumId");
		String eventId = request.getParameter("eventId");
		
		
		// 파일 생성
		File dir = new File(pathname);
		
		// 폴더가 없을 경우 생성
		if (!dir.exists())
			dir.mkdirs();
		// 이미지가 설정되어있나 없나 확인 후 업로드
		if(!drag.equals("/images/defaultgr.png"))
			drag = fileManager.ChangeImg(drag, pathname);
		IEventDAO eventDAO = sqlsession.getMapper(IEventDAO.class);
		IAlbumDAO albumDAO = sqlsession.getMapper(IAlbumDAO.class);
		String eveAttendId = eventDAO.getEveAttendId(GroupStaticClass.getEventUesd(eventId, lMember_id));
		String attendId = eventDAO.getAttendId(GroupStaticClass.getEventUesd(eventId, lMember_id));
		if(attendId != null && attendId.equals("1"))
		{
			albumDAO.addEventPicture(GroupStaticClass.getEventPictureMap(albumId, eveAttendId, drag));
		} else {
			
		}
		
		
		map.addAttribute("lGroup_id", lGroup_id);
		map.addAttribute("albumId", albumId);
		map.addAttribute("eventId", eventId);
		
		return "redirect:/" + GroupFormController.GROUP_EVENTPICTURE;
	}
}
