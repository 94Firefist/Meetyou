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

import com.test.event.EventDTO;
import com.test.event.EventIDAO;
import com.test.java.FileManager;

@Controller
public class EventController
{
	@Resource(name = "fileManager")
	private FileManager fileManager;
	
	@Autowired
	private SqlSession sqlSession;
	
	// 이벤트 만들기
	@RequestMapping(value="/eventform.action")
	public String EventForm(HttpSession session, HttpServletRequest request, ModelMap map)
	{
		// 아이디 세션 유무 확인
		if(session.getAttribute("id")==null || session.getAttribute("admin")!=null)
			return "/loginform.action";
		
		// 리더넘 가져오기
		String keynumber = (String)session.getAttribute("keynumber");
		
		// dao
		EventIDAO dao = sqlSession.getMapper(EventIDAO.class);

		String tag = dao.getTag(keynumber);		// 남은 태그 갯수
		String power = dao.getPower(keynumber);	// 남은 파워링크 갯수
		ArrayList<EventDTO> grouplist = dao.groupList(keynumber);	// 그룹 리스트 뿌려주기
		ArrayList<EventDTO> categorylist = dao.categoryList(); // 카테고리 리스트
		ArrayList<EventDTO> publiclist = dao.evepublicList();	// 공개범위 리스트 처음뿌려주기용
		
		map.addAttribute("tag", tag);
		map.addAttribute("power", power);
		map.addAttribute("grouplist", grouplist);
		map.addAttribute("categorylist", categorylist);
		map.addAttribute("publiclist", publiclist);
		
		return "/WEB-INF/view/event/EventCreate.jsp"; 
	}
	
	// 이벤트 생성
	@RequestMapping(value="/event.action")
	public String Event(HttpServletRequest request, HttpSession session)
	{
		// 프로젝트 경로
		String cp = request.getContextPath();
		
		// 이미지 저장 경로 설정
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "image";
		
		// 아이디 세션 유무 확인
		if(session.getAttribute("id")==null || session.getAttribute("admin")!=null)
			return "/maingroup.action";
		
		// dao 생성
		EventIDAO dao = sqlSession.getMapper(EventIDAO.class);
		
		// 데이터 받기
		String eventName = request.getParameter("eventName");	// 이벤트 명
		String groupSel = request.getParameter("groupSel");		// 개최주최
		String mbPublic = request.getParameter("mbPublic");		// 공개범위
		String category = request.getParameter("category");		// 카테고리
		String datepicker = request.getParameter("datepicker");	// 날짜
		String time = request.getParameter("time");				// 시간
		String map = request.getParameter("map");				// 위치
		String minsu = request.getParameter("minsu");			// 최소인원
		String maxsu = request.getParameter("maxsu");			// 최대인원
		String money = request.getParameter("money");			// 참가비
		String content = request.getParameter("content");		// 소개
		String lat = request.getParameter("lat");				// 좌표
		String lng = request.getParameter("lng");				// 좌표
		
		String chk1 = request.getParameter("chk1");				// 참가비 체크여부
		String chk2 = request.getParameter("chk2");				// 성비 체크여부
		String chk3 = request.getParameter("chk3");				// 연령대 체크여부
		String cmax = request.getParameter("cmax");				// 참가비 맥스값
		String min = request.getParameter("min");				// 연령대 최소값
		String max = request.getParameter("max");				// 연령대 최대값
		/*String wor = request.getParameter("wor");				// 성비 여자 값*/		
		String tags[] = request.getParameterValues("tags");		// 태그 값들
		String powerpicker1 = request.getParameter("powerpicker1"); // 파워링크 시작일
		String powerpicker2 = request.getParameter("powerpicker2"); // 파워링크 종료일
		String dragv = request.getParameter("dragv");				// 사진 base64 인코딩 값
		
		
		if(!powerpicker1.equals(""))
		{
			SimpleDateFormat power2 = new SimpleDateFormat("yyyy-MM-dd");
			Date date2 = null;
			try
			{
				date2 = power2.parse(powerpicker2);
				date2.setDate(date2.getDate()+1);
				powerpicker2 = power2.format(date2);
			} catch (Exception e) 
			{
				System.out.println(e.toString());
			}
		}
		// 대표번호
		int keynum = Integer.parseInt((String)session.getAttribute("keynumber"));
		
		// city_code 가져오기
		String loadName = map.split("/")[0];
		String place = map.split("/")[1];
		loadName = loadName.substring(0, loadName.lastIndexOf(" "));
		String city_code = dao.getCityCode(loadName);
		
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
		if(!dragv.equals("/images/drag.png"))
			dragv = fileManager.ChangeImg(dragv, pathname);
		else
			dragv = "/images/meetU.png";
		
//		System.out.println(eventName);
//		System.out.println(city_code);
//		System.out.println(keynum);
//		System.out.println(groupSel);
//		System.out.println(lat);
//		System.out.println(lng);
//		System.out.println(place);
//		System.out.println(content);
//		System.out.println(dateString);
//		System.out.println(minsu);
//		System.out.println(maxsu);
//		System.out.println(money);
//		System.out.println(dragv);
		
		EventDTO eventDTO = new EventDTO();
		
		
		eventDTO.setEvent_name(eventName);
		eventDTO.setCity_code(city_code);
		if(!groupSel.equals("solo"))
			eventDTO.setLgroup_id(groupSel);
		eventDTO.setLmember_id(keynum);
		eventDTO.setLoc_geolat(lat);
		eventDTO.setLoc_geolng(lng);
		eventDTO.setEvent_place(place);
		eventDTO.setEvent_info(content);
		eventDTO.setEvent_date(dateString);
		eventDTO.setEvent_minattend(Integer.parseInt(minsu));
		eventDTO.setEvent_maxattend(Integer.parseInt(maxsu));
		eventDTO.setPublic_attendl(1);
		eventDTO.setPublic_place(1);
		eventDTO.setPublic_gender(1);
		eventDTO.setPublic_age(1);
		eventDTO.setPublic_eve(1);
		eventDTO.setEvent_minm(Integer.parseInt(money));
		eventDTO.setEvent_url(dragv);
		
		System.out.println(eventDTO.getLgroup_id());
		
		HashMap<String, Object> eventMap = new HashMap<String, Object>();
		eventMap.put("result", "");
		eventMap.put("event_name", eventDTO.getEvent_name());
		eventMap.put("city_code", eventDTO.getCity_code());         
		eventMap.put("lmember_id", eventDTO.getLmember_id());
		eventMap.put("lgroup_id", eventDTO.getLgroup_id());
		eventMap.put("loc_geolat", eventDTO.getLoc_geolat());                      
		eventMap.put("loc_geolng", eventDTO.getLoc_geolng());                      
		eventMap.put("event_place", eventDTO.getEvent_place());                 
		eventMap.put("event_info", eventDTO.getEvent_info());
		eventMap.put("event_date", eventDTO.getEvent_date());            
		eventMap.put("event_minattend", eventDTO.getEvent_minattend());                 
		eventMap.put("event_maxattend", eventDTO.getEvent_maxattend());    
		eventMap.put("public_attendl", eventDTO.getPublic_attendl());
		eventMap.put("public_place", eventDTO.getPublic_place());                     
		eventMap.put("public_gender", eventDTO.getPublic_gender());                    
		eventMap.put("public_age", eventDTO.getPublic_age());                       
		eventMap.put("public_eve", eventDTO.getPublic_eve());                       
		eventMap.put("event_minm", eventDTO.getEvent_minm());
		eventMap.put("event_url", eventDTO.getEvent_url());
		eventMap.put("mbpublic_id", mbPublic);
		eventMap.put("category_id", category);
		
		dao.addEvent(eventMap);
		
		String eventId = eventMap.get("result").toString();
		
		HashMap<String, String> insertHash = new HashMap<String, String>();
		
		// 참가비
		if(chk1 != null)
		{
			System.out.println("1");
			insertHash.put("eventId", eventId);
			insertHash.put("optionId", "3");
			insertHash.put("optionVal", cmax);
			dao.addEvecondi(insertHash);
		}
		/*
		// 성비
		if(chk2 != null)
		{
			insertHash.put("eventId", eventId);
			insertHash.put("optionId", "4");
			insertHash.put("optionVal", wor);
			dao.addEvecondi(insertHash);
		}*/
		
		// 연령대
		if(chk3 != null)
		{
			insertHash.put("eventId", eventId);
			insertHash.put("optionId", "1");
			insertHash.put("optionVal", min);
			dao.addEvecondi(insertHash);
			
			insertHash.put("eventId", eventId);
			insertHash.put("optionId", "2");
			insertHash.put("optionVal", max);
			dao.addEvecondi(insertHash);
		}
		
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
				HashTag.put("eventId", eventId);
				
				list.add(HashTag);
			}
			
			dao.addTag(list);
		}
		
		// 파워링크를 적용시켰을 때
		if(powerpicker1 != null && powerpicker2 != null && !powerpicker1.equals("") && !powerpicker2.equals(""))
		{
			HashMap<String, Object> powerMap = new HashMap<String, Object>();
			
			SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-mm-dd");
			Date beginDate = null;
			Date endDate = null;
			try
			{
				beginDate = simpledate.parse(powerpicker1);
				endDate = simpledate.parse(powerpicker2);
			} catch (ParseException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			long diff = endDate.getTime() - beginDate.getTime();
			int diffDays = (int)((diff/(24*60*60*1000)));
			
			powerMap.put("item_code", "1");		// 아이템코드
			powerMap.put("lmemver_id", keynum);	// 리더넘
			powerMap.put("levent_id", eventId);		// 이벤트 ID
			powerMap.put("itemlog_usercount", diffDays);	// 아이템 사용수량
			powerMap.put("power_stdate", powerpicker1);	// 시작일
			powerMap.put("power_endate", powerpicker2);	// 종료일
			
			System.out.println(powerpicker1);
			System.out.println(powerpicker2);
			
			dao.addPower(powerMap);
		}
		
		return "redirect:/mainevent.action";
	}
	
}