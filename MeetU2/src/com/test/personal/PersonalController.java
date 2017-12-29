package com.test.personal;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.comment.CommentController;
import com.test.common.FileManager;
import com.test.dao.IEventDAO;
import com.test.dto.EventDTO;
import com.test.dto.MemberDTO;
import com.test.group.GroupFormController;
import com.test.group.GroupStaticClass;

@Controller
public class PersonalController
{
	@Autowired
	private SqlSession sqlSession;

	// 홈
   @RequestMapping(value="/personalhome.action", method=RequestMethod.GET)
   public ModelAndView PersonalHome(HttpServletRequest request, HttpSession session)
   {
      ModelAndView mav = new ModelAndView();       
      
      IPersonalLeftbarDAO leftdao = sqlSession.getMapper(IPersonalLeftbarDAO.class);
      IPersonalHomeDAO main = sqlSession.getMapper(IPersonalHomeDAO.class);   
      IPersonalTimelineDAO timedao = sqlSession.getMapper(IPersonalTimelineDAO.class);
      IPersonalCheckDAO checkdao = sqlSession.getMapper(IPersonalCheckDAO.class);
      
      String keynumber = (String) session.getAttribute("keynumber");        // 손님      
      String userNumber = request.getParameter("userkey");               // 주인   
   
      // 좌측
      mav.addObject("memberName", leftdao.memberName(userNumber));         // 이름
      mav.addObject("friendCount", leftdao.friendCount(userNumber));         // 친구 수
      mav.addObject("pastMeetU", leftdao.pastMeetU(userNumber));            // 과거 참여
      mav.addObject("userCityList", leftdao.userCityList(userNumber));      // 관심 지역
      mav.addObject("userTagList", leftdao.userTagList(userNumber));          // 관심사
      mav.addObject("profilePhoto", leftdao.profilePhoto(userNumber));      // 프로필 사진
   
      // 메인
      mav.addObject("userContent", main.userContent(userNumber));            // 소개

      //
      if (keynumber == null)   // 회원
         keynumber = "0";
         
      // 친구여부
      HashMap<String, Object> hashmap = new HashMap<String, Object>();
      hashmap.put("guestId", keynumber);
      hashmap.put("hostId", userNumber);

      // 그룹여부
      HashMap<String, Object> sameGroupCount = new HashMap<String, Object>();
      sameGroupCount.put("guestId", keynumber);
      sameGroupCount.put("hostId", userNumber);

//      System.out.println("-------------------------------------------------------");
      
//      System.out.println("주인 : " + userNumber);
//      System.out.println("손님 : " + keynumber);
         
//      System.out.println("-------------------------------------------------------");
      
      if (userNumber.equals(keynumber))   // 본인
      {
//         System.out.println("본인맞음");
         mav.addObject("hostEventList", timedao.hostEventList(userNumber));
         mav.addObject("hostInEventList", timedao.hostInEventList(userNumber));
         mav.addObject("my", 1);
      }
      else
      {
//         System.out.println("본인아님");
         mav.addObject("my", 0);
         
         // 개인 리스트
         ArrayList<PersonalTimelineDTO> result = new ArrayList<PersonalTimelineDTO>();
         for( PersonalTimelineDTO dto : timedao.hostEventList(userNumber) )
         {
            // 전체공개
            if(dto.getEventOpen().equals("1")) 
            {
               System.out.println("전체공개");
               result.add(dto);
               System.out.println("됨");
            }
            // 회원공개
            else if(dto.getEventOpen().equals("2"))
            {
               System.out.println("회원공개");
               
               if (keynumber != "0")
               {
                  System.out.println("됨");
                  result.add(dto);
               }               
            }
            // 친구, 그룹공개
            else if(dto.getEventOpen().equals("3"))
            {
               System.out.println("그룹, 친구공개");
               
               if (checkdao.friendCheck(hashmap) == 1 || checkdao.sameGroupCount(sameGroupCount) > 0)
               {   
                  System.out.println("됨");
                  result.add(dto);
               }
            }
            // 비공개
            /*else if(dto.getEventOpen().equals("4"))
            {
            }*/
            System.out.println("~");
         }
         
         mav.addObject("hostEventList", result);   
         
         System.out.println("-------------------------------------------------------");
         
         // 참여 예정 리스트
         ArrayList<PersonalTimelineDTO> result2 = new ArrayList<PersonalTimelineDTO>();
         for( PersonalTimelineDTO dto : timedao.hostInEventList(userNumber) )
         {
            // 전체 공개
            if (dto.getEventOpen().equals("1"))
            {
               System.out.println("전체공개");
               result2.add(dto);
               System.out.println("됨");
            }
            // 회원 공개
            else if (dto.getEventOpen().equals("2"))
            {
               System.out.println("회원공개");
               
               if (keynumber != "0")
               {
                  System.out.println("됨");
                  result2.add(dto);
               }
            }
            // 친구, 그룹 공개
            else if (dto.getEventOpen().equals("3"))
            {
               System.out.println("그룹, 친구공개");
               
               // 친구여부
               HashMap<String, Object> hashmap2 = new HashMap<String, Object>();
               hashmap2.put("guestId", keynumber);
               hashmap2.put("hostId", dto.getEventHostId());

               // 그룹여부
               HashMap<String, Object> sameGroupCount2 = new HashMap<String, Object>();
               sameGroupCount2.put("guestId", keynumber);
               sameGroupCount2.put("hostId", dto.getEventHostId());
               
               if (checkdao.friendCheck(hashmap2) == 1 || checkdao.sameGroupCount(sameGroupCount2) > 0)
               {   
                  System.out.println("됨");
                  result2.add(dto);
               }
            }
            // 비공개
            System.out.println("~");
         }
         
         mav.addObject("hostInEventList", result2);
      }
      
      mav.setViewName("/WEB-INF/view/personal/personalPageHome.jsp");
      
      return mav; 
   }

	// 자기소개
	@RequestMapping(value = "/personalintroducemyself.action", method = RequestMethod.GET)
	public ModelAndView PersonalIntroducemyself(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();

		IPersonalLeftbarDAO leftdao = sqlSession.getMapper(IPersonalLeftbarDAO.class);
		IPersonalPageIntroducemyselfDAO selfdao = sqlSession.getMapper(IPersonalPageIntroducemyselfDAO.class);
		IPersonalCheckDAO checkdao = sqlSession.getMapper(IPersonalCheckDAO.class);

		String keynumber = (String) session.getAttribute("keynumber"); // 로그인한 이의 대표 번호 가져오기
		String userNumber = request.getParameter("userkey");

		// 개인 공개 여부
		mav.addObject("hostpublic", checkdao.hostCheckList(userNumber));

		// 친구 여부
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("guestId", keynumber);
		hashmap.put("hostId", userNumber);
		if(keynumber==null)
		{
			mav.addObject("friendcheck", "0");
		}
		else
		{
			mav.addObject("friendcheck", checkdao.friendCheck(hashmap));
		}

		// 좌측
		mav.addObject("memberName", leftdao.memberName(userNumber)); // 이름
		mav.addObject("friendCount", leftdao.friendCount(userNumber)); // 친구 수
		mav.addObject("pastMeetU", leftdao.pastMeetU(userNumber)); // 과거 참여
		mav.addObject("userCityList", leftdao.userCityList(userNumber)); // 관심 지역
		mav.addObject("userTagList", leftdao.userTagList(userNumber)); // 관심사
		mav.addObject("profilePhoto", leftdao.profilePhoto(userNumber)); // 프로필 사진
																			// 달력
		// 로그인 한 사람의 대표 번호 넘기기(비회원 여부 판단하기 위해)
		mav.addObject("keynumber", keynumber);
		mav.addObject("userNumber", userNumber);

		// 개인 정보
		mav.addObject("userInfo", selfdao.userInfo(userNumber)); // 개인 정보 (지역제외)
		mav.setViewName("/WEB-INF/view/personal/personalPageIntroducemyself.jsp");

		return mav;

	}

	// 타임라인(이벤트)
	@RequestMapping(value="/personaltimeline.action")
	public ModelAndView personalTimeline(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		IPersonalLeftbarDAO leftdao = sqlSession.getMapper(IPersonalLeftbarDAO.class);
		IPersonalTimelineDAO timedao = sqlSession.getMapper(IPersonalTimelineDAO.class);
		IPersonalCheckDAO checkdao = sqlSession.getMapper(IPersonalCheckDAO.class);
		
		String keynumber = (String) session.getAttribute("keynumber");  		// 손님		
		String userNumber = request.getParameter("userkey");					// 주인
	
		// 좌측
		mav.addObject("memberName", leftdao.memberName(userNumber));			// 이름
		mav.addObject("friendCount", leftdao.friendCount(userNumber));			// 친구 수
		mav.addObject("pastMeetU", leftdao.pastMeetU(userNumber));				// 과거 참여
		mav.addObject("userCityList", leftdao.userCityList(userNumber));		// 관심 지역
		mav.addObject("userTagList", leftdao.userTagList(userNumber));			// 관심사
		mav.addObject("profilePhoto", leftdao.profilePhoto(userNumber));		// 프로필 사진																			// 달력	
		
		if (keynumber == null)	// 회원
			keynumber = "0";
			
		// 친구여부
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("guestId", keynumber);
		hashmap.put("hostId", userNumber);

		// 그룹여부
		HashMap<String, Object> sameGroupCount = new HashMap<String, Object>();
		sameGroupCount.put("guestId", keynumber);
		sameGroupCount.put("hostId", userNumber);
/*
		System.out.println("-------------------------------------------------------");
		
		System.out.println("주인 : " + userNumber);
		System.out.println("손님 : " + keynumber);
			
		System.out.println("-------------------------------------------------------");
*/		
		if (userNumber.equals(keynumber))	// 본인
		{
			//System.out.println("본인맞음");
			mav.addObject("hostEventList", timedao.hostEventList(userNumber));
			mav.addObject("hostInEventList", timedao.hostInEventList(userNumber));
			mav.addObject("my", 1);
		}
		else
		{
			//System.out.println("본인아님");
			mav.addObject("my", 0);
			
			// 개인 리스트
			ArrayList<PersonalTimelineDTO> result = new ArrayList<PersonalTimelineDTO>();
			for( PersonalTimelineDTO dto : timedao.hostEventList(userNumber) )
			{
				// 전체공개
				if(dto.getEventOpen().equals("1")) 
				{
					//System.out.println("전체공개");
					result.add(dto);
					//System.out.println("됨");
				}
				// 회원공개
				else if(dto.getEventOpen().equals("2"))
				{
					//System.out.println("회원공개");
					
					if (keynumber != "0")
					{
						//System.out.println("됨");
						result.add(dto);
					}					
				}
				// 친구, 그룹공개
				else if(dto.getEventOpen().equals("3"))
				{
					//System.out.println("그룹, 친구공개");
					
					if (checkdao.friendCheck(hashmap) == 1 || checkdao.sameGroupCount(sameGroupCount) > 0)
					{	
						//System.out.println("됨");
						result.add(dto);
					}
				}
				// 비공개
				/*else if(dto.getEventOpen().equals("4"))
				{
				}*/
				//System.out.println("~");
			}
			
			mav.addObject("hostEventList", result);	
			
			//System.out.println("-------------------------------------------------------");
			
			// 참여 예정 리스트
			ArrayList<PersonalTimelineDTO> result2 = new ArrayList<PersonalTimelineDTO>();
			for( PersonalTimelineDTO dto : timedao.hostInEventList(userNumber) )
			{
				// 전체 공개
				if (dto.getEventOpen().equals("1"))
				{
					//System.out.println("전체공개");
					result2.add(dto);
					//System.out.println("됨");
				}
				// 회원 공개
				else if (dto.getEventOpen().equals("2"))
				{
					//System.out.println("회원공개");
					
					if (keynumber != "0")
					{
						//System.out.println("됨");
						result2.add(dto);
					}
				}
				// 친구, 그룹 공개
				else if (dto.getEventOpen().equals("3"))
				{
					//System.out.println("그룹, 친구공개");
					
					// 친구여부
					HashMap<String, Object> hashmap2 = new HashMap<String, Object>();
					hashmap2.put("guestId", keynumber);
					hashmap2.put("hostId", dto.getEventHostId());

					// 그룹여부
					HashMap<String, Object> sameGroupCount2 = new HashMap<String, Object>();
					sameGroupCount2.put("guestId", keynumber);
					sameGroupCount2.put("hostId", dto.getEventHostId());
					
					if (checkdao.friendCheck(hashmap2) == 1 || checkdao.sameGroupCount(sameGroupCount2) > 0)
					{	
						//System.out.println("됨");
						result2.add(dto);
					}
				}
				// 비공개
				//System.out.println("~");
			}
			
			mav.addObject("hostInEventList", result2);
		}

		
		mav.setViewName("/WEB-INF/view/personal/personalPageTimeline.jsp");
		return mav;
	}


	// 나의 그룹목록 리스트 보여주기
	@RequestMapping(value = "/personalgrouplist.action")
	public ModelAndView personalGrouplist(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();

		IPersonalLeftbarDAO leftdao = sqlSession.getMapper(IPersonalLeftbarDAO.class);
		IPersonalCheckDAO checkdao = sqlSession.getMapper(IPersonalCheckDAO.class);
		IPersonalGroupDAO groupdao = sqlSession.getMapper(IPersonalGroupDAO.class);

		String keynumber = (String) session.getAttribute("keynumber"); // 로그인한 이의 대표 번호 가져오기
		String userNumber = request.getParameter("userkey"); // 주인장 키 가져와서 userNumber에 넣기

		// 개인 공개 여부
		mav.addObject("hostpublic", checkdao.hostCheckList(userNumber));

		// 친구 여부
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("guestId", keynumber);
		hashmap.put("hostId", userNumber);
		
		if(keynumber==null)
		{
			mav.addObject("friendcheck", "0");
		}
		else
		{
			mav.addObject("friendcheck", checkdao.friendCheck(hashmap));
		}
	

		// 좌측
		mav.addObject("memberName", leftdao.memberName(userNumber)); // 이름
		mav.addObject("friendCount", leftdao.friendCount(userNumber)); // 친구 수
		mav.addObject("pastMeetU", leftdao.pastMeetU(userNumber)); // 과거 참여
		mav.addObject("userCityList", leftdao.userCityList(userNumber)); // 관심 지역
		mav.addObject("userTagList", leftdao.userTagList(userNumber)); // 관심사
		mav.addObject("profilePhoto", leftdao.profilePhoto(userNumber)); // 프로필 사진
																			// 달력
		// 로그인 한 사람의 대표 번호 넘기기(비회원 여부 판단하기 위해)
		mav.addObject("keynumber", keynumber);
		mav.addObject("userNumber", userNumber);

		// 그룹리스트 뽑는 메소드 발생!!!!
		// 페이지주인이 운영진, 회원인 그룹이고 공개인 배열리스트
		ArrayList<PersonalGroupDTO> groupdto = groupdao.groupList(userNumber);
		mav.addObject("groupdto", groupdto);

		// 페이지주인이 그룹장인 그룹 배열 리스트 공개인 배열리스트
		ArrayList<PersonalGroupDTO> groupdto_owner = groupdao.groupList_owner(userNumber);
		mav.addObject("groupdto_owner", groupdto_owner);

		mav.setViewName("/WEB-INF/view/personal/personalPageGrouplist.jsp");

		return mav;
	}

	// 그룹 탈퇴하기
	@RequestMapping(value = "/personalgroupout.action")
	public ModelAndView personalGroupout(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		String keynumber = (String) session.getAttribute("keynumber"); // 로그인한 이의 대표 번호 가져오기
		String groupid = request.getParameter("groupid"); // 그룹 아이디 가져오기
		//System.out.println(groupid);
		IPersonalGroupDAO groupdao = sqlSession.getMapper(IPersonalGroupDAO.class);

		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("keynumber", keynumber);
		hashmap.put("groupid", groupid);

		groupdao.groupOut(hashmap);
		mav.setViewName("redirect: /personalgrouplist.action?userkey=" + keynumber);

		return mav;
	}

	// 특정 그룹 목록에서 비공개하기
	@RequestMapping(value = "/personalgroupnoopen.action")
	public ModelAndView personalGroupNoopen(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		String keynumber = (String) session.getAttribute("keynumber"); // 로그인한 이의 대표 번호 가져오기
		String groupid = request.getParameter("groupid"); // 그룹 아이디 가져오기
		System.out.println(groupid);
		IPersonalGroupDAO groupdao = sqlSession.getMapper(IPersonalGroupDAO.class);

		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("keynumber", keynumber);
		hashmap.put("groupid", groupid);

		groupdao.groupNoopen(hashmap);
		mav.setViewName("redirect: /personalgrouplist.action?userkey=" + keynumber);

		return mav;
	}

	// 특정 그룹 목록에서 공개하기
	@RequestMapping(value = "/personalgroupopen.action")
	public ModelAndView personalGroupOpen(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		String keynumber = (String) session.getAttribute("keynumber"); // 로그인한 이의 대표 번호 가져오기
		String groupid = request.getParameter("groupid"); // 그룹 아이디 가져오기
		// System.out.println(groupid);
		IPersonalGroupDAO groupdao = sqlSession.getMapper(IPersonalGroupDAO.class);

		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("keynumber", keynumber);
		hashmap.put("groupid", groupid);

		groupdao.groupOpen(hashmap);
		mav.setViewName("redirect: /personalgrouplist.action?userkey=" + keynumber);

		return mav;
	}

	// 친구리스트
	@RequestMapping(value = "/personalfriendlist.action")
	public ModelAndView personalFriendlist(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();

		IPersonalLeftbarDAO leftdao = sqlSession.getMapper(IPersonalLeftbarDAO.class);
		IPersonalCheckDAO checkdao = sqlSession.getMapper(IPersonalCheckDAO.class);
		IPersonalFriendDAO frienddao = sqlSession.getMapper(IPersonalFriendDAO.class);

		String keynumber = (String) session.getAttribute("keynumber"); // 손님
		String userNumber = request.getParameter("userkey"); // 주인
		

		// 좌측
		mav.addObject("memberName", leftdao.memberName(userNumber)); // 이름
		mav.addObject("friendCount", leftdao.friendCount(userNumber)); // 친구 수
		mav.addObject("pastMeetU", leftdao.pastMeetU(userNumber)); // 과거 참여
		mav.addObject("userCityList", leftdao.userCityList(userNumber)); // 관심 지역
		mav.addObject("userTagList", leftdao.userTagList(userNumber)); // 관심사
		mav.addObject("profilePhoto", leftdao.profilePhoto(userNumber)); // 프로필 사진
																			// 달력

		// 개인 정보 여부
		mav.addObject("hostpublic", checkdao.hostCheckList(userNumber));

		PersonalCheckDTO dto = checkdao.hostCheckList(userNumber);
		// System.out.println(dto.getFriendpublic());

		//System.out.println("여부확인중");

		if (keynumber != null)
		{
			if (keynumber.equals(userNumber)) // 본인 여부
			{
				//System.out.println("본인");

				mav.addObject("my", 1);
				mav.addObject("friendList", frienddao.friendList(userNumber)); // 친구리스트
				mav.addObject("blackList", frienddao.blackList(userNumber)); // 블랙리스트
				mav.addObject("friendSend", frienddao.friendSend(userNumber)); // 신청보낸
				mav.addObject("friendReceive", frienddao.friendReceive(userNumber)); // 신청받은

				// System.out.println(frienddao.blackList(userNumber));
			} else
			{
				//System.out.println("본인 아님");

				if (dto.getFriendpublic() == 2) // 회원
					mav.addObject("friendList", frienddao.friendList(userNumber));
				else if (dto.getFriendpublic() == 3) // 친구여부
				{
					HashMap<String, Object> hashmap = new HashMap<String, Object>();
					hashmap.put("guestId", keynumber);
					hashmap.put("hostId", userNumber);

					if (checkdao.friendCheck(hashmap) == 1) // 친구
					{
						mav.addObject("friendList", frienddao.friendList(userNumber));
					}
				}
			}
		} else
		{
			if (dto.getFriendpublic() == 1) // 전체
				mav.addObject("friendList", frienddao.friendList(userNumber));
		}

		mav.setViewName("/WEB-INF/view/personal/personalPageFriendlist.jsp");
		return mav;

	}

	// 친구 신청 취소
	@RequestMapping(value = "/friendnosend.action", method = RequestMethod.GET)
	public ModelAndView friendnoSend(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();

		//System.out.println("신청 취소");

		String keynumber = (String) session.getAttribute("keynumber");

		String friendNo = request.getParameter("friendNo");

		IPersonalFriendDAO dao = sqlSession.getMapper(IPersonalFriendDAO.class);

		dao.friendnoSend(friendNo);

		mav.setViewName("redirect:personalfriendlist.action?userkey=" + keynumber);

		return mav;
	}

	// 친구 요청 거절
	@RequestMapping(value = "/friendnoreceive.action", method = RequestMethod.GET)
	public ModelAndView friendnoReceive(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();

		//System.out.println("요청취소");

		String keynumber = (String) session.getAttribute("keynumber");

		String friendNo = request.getParameter("friendNo");

		IPersonalFriendDAO dao = sqlSession.getMapper(IPersonalFriendDAO.class);

		dao.friendnoReceive(friendNo);

		mav.setViewName("redirect:personalfriendlist.action?userkey=" + keynumber);

		return mav;
	}

	// 친구 추가 (승낙)
	@RequestMapping(value = "/friendadd.action", method = RequestMethod.GET)
	public ModelAndView friendAdd(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();

		//System.out.println("친구추가");

		String keynumber = (String) session.getAttribute("keynumber");

		String friendNo = request.getParameter("friendNo");

		IPersonalFriendDAO dao = sqlSession.getMapper(IPersonalFriendDAO.class);

		dao.friendAdd(friendNo);

		mav.setViewName("redirect:personalfriendlist.action?userkey=" + keynumber);

		return mav;
	}

	// 친구 삭제 (절교)
	@RequestMapping(value = "/friendremove.action", method = RequestMethod.GET)
	public ModelAndView friendRemove(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();

		//System.out.println("친구삭제");

		String keynumber = (String) session.getAttribute("keynumber");

		String friendNo = request.getParameter("friendNo");

		IPersonalFriendDAO dao = sqlSession.getMapper(IPersonalFriendDAO.class);

		dao.friendRemove(friendNo);

		mav.setViewName("redirect:personalfriendlist.action?userkey=" + keynumber);

		return mav;
	}

	// 블랙리스트 삭제
	@RequestMapping(value = "/blackremove.action", method = RequestMethod.GET)
	public ModelAndView blackRemove(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();

		//System.out.println("블랙삭제");

		String keynumber = (String) session.getAttribute("keynumber");

		String friendNo = request.getParameter("friendNo");

		IPersonalFriendDAO dao = sqlSession.getMapper(IPersonalFriendDAO.class);

		dao.blackRemove(friendNo);

		mav.setViewName("redirect:personalfriendlist.action?userkey=" + keynumber);

		return mav;
	}

	// 블랙리스트 추가
	@RequestMapping(value = "/blackadd.action", method = RequestMethod.GET)
	public ModelAndView blackAdd(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();

		//System.out.println("블랙추가");

		String keynumber = (String) session.getAttribute("keynumber");

		String friendNo = request.getParameter("friendNo");

		IPersonalFriendDAO dao = sqlSession.getMapper(IPersonalFriendDAO.class);
		HashMap<String, String> blackMap = new HashMap<String, String>();
		blackMap.put("hostId", keynumber);
		blackMap.put("friendNum", friendNo);
		dao.blackAdd(blackMap);

		/*
		 * HashMap<String, Object> hashmap = new HashMap<String, Object>();
		 * hashmap.put("guestId", keynumber); hashmap.put("hostId", userNumber);
		 * mav.addObject("friendcheck", checkdao.friendCheck(hashmap));
		 */

		mav.setViewName("redirect:personalfriendlist.action?userkey=" + keynumber);

		return mav;
	}

	// 개인페이지 관리하기
	@RequestMapping(value = "/personalcontrol.action")
	public ModelAndView personalControl(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();

		IPersonalLeftbarDAO leftdao = sqlSession.getMapper(IPersonalLeftbarDAO.class);
		IPersonalCheckDAO checkdao = sqlSession.getMapper(IPersonalCheckDAO.class);
		IPersonalControlDAO condao = sqlSession.getMapper(IPersonalControlDAO.class);

		String keynumber = (String) session.getAttribute("keynumber"); // 로그인한 이의 대표 번호 가져오기
		String userNumber = request.getParameter("userkey"); // 주인장 키 가져와서 userNumber에 넣기

		// 개인 공개 여부
		mav.addObject("hostpublic", checkdao.hostCheckList(userNumber));

		// 친구 여부
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("guestId", keynumber);
		hashmap.put("hostId", userNumber);
		mav.addObject("friendcheck", checkdao.friendCheck(hashmap));

		// 좌측
		mav.addObject("memberName", leftdao.memberName(userNumber)); // 이름
		mav.addObject("friendCount", leftdao.friendCount(userNumber)); // 친구 수
		mav.addObject("pastMeetU", leftdao.pastMeetU(userNumber)); // 과거 참여
		mav.addObject("userCityList", leftdao.userCityList(userNumber)); // 관심 지역
		mav.addObject("userTagList", leftdao.userTagList(userNumber)); // 관심사
		mav.addObject("profilePhoto", leftdao.profilePhoto(userNumber)); // 프로필 사진
																			// 달력
		// 로그인 한 사람의 대표 번호 넘기기(비회원 여부 판단하기 위해)
		mav.addObject("keynumber", keynumber);
		mav.addObject("userNumber", userNumber);

		// System.out.println(userNumber);

		// 컨트롤 개인정보 보내기
		PersonalControlDTO conList = condao.controlList(userNumber); // 이거 나중에 키넘버로 바꿔야됨
		mav.addObject("conList", conList);

		// 컨트롤 나의 관심사리스트 보내기
		ArrayList<PersonalControlDTO> conInterestList = condao.controlInterestList(userNumber);
		mav.addObject("conInterestList", conInterestList);

		// 전체관심사리스트 보내기
		ArrayList<PersonalControlDTO> totalInterestList = condao.interestList();
		mav.addObject("totalInterestList", totalInterestList);

		// 전체지역리스트 보내기
		ArrayList<PersonalControlDTO> cityList = condao.cityList();
		mav.addObject("cityList", cityList);

		mav.setViewName("/WEB-INF/view/personal/personalPageControl.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/personalevent.action", method = RequestMethod.GET)
   public ModelAndView PersonalPageEvent(HttpServletRequest request)
   {
      ModelAndView mav = new ModelAndView();
      HttpSession session = request.getSession();

         try
         {
        	CommentController co = new CommentController();
 			mav = co.getComment(request, session, sqlSession);
 			
           IPersonalLeftbarDAO daoLeft = sqlSession.getMapper(IPersonalLeftbarDAO.class);
           IEventDAO eventDAO = sqlSession.getMapper(IEventDAO.class);
            String memberId = request.getParameter("userkey");
            
//	            if (memberId != null)
//	            {
//	     
//	               // 블랙리스트 여부확인 : NULL = 비회원, 0 = 그룹블랙X, 1 = 그룹블랙O
//	               String bgCheck = dao.getBlackGroupConfirm(GroupStaticClass.getGroupAndTargetMap(groupId, memberId));
//	               mav.addObject("bgCheck", bgCheck);
//	            } else {
//	               memberId = "0";
//	            }
            String eventId = request.getParameter("eventId");
            if (eventId == null || eventId.equals(""))
            {
               mav.setViewName("redirect:/" + GroupFormController.GROUP_HOME);
               return mav;
            }
            
            EventDTO dto = eventDAO.getEventInfo(GroupStaticClass.getEventUesd(eventId, memberId)).get(0);
            
            
            mav.addObject("memberName", (daoLeft.memberName(dto.getLmember_id()+"")));
            mav.addObject("userkey", dto.getLmember_id());
         
            ArrayList<MemberDTO> yesAttends = eventDAO.getAttendMember(GroupStaticClass.getEalist(eventId, "1", 1, 5));
            ArrayList<MemberDTO> noAttends = eventDAO.getAttendMember(GroupStaticClass.getEalist(eventId, "2", 1, 5));
            
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
            
            String attendId = eventDAO.getAttendId(GroupStaticClass.getEventUesd(eventId, memberId));
            
            mav.addObject("eventUsed", eventDAO.getEventUsed(eventId));
            mav.addObject("eventId", eventId);
            mav.addObject("eventInfo", eventDAO.getEventInfo(GroupStaticClass.getEventUesd(eventId, memberId)).get(0));
            mav.addObject("tags", eventDAO.getEventTags(eventId));
            mav.addObject("yesAttends", yesAttends);
            mav.addObject("noAttends", noAttends);
            mav.addObject("women", women);
            mav.addObject("men", men);
            mav.addObject("age10", age10);
            mav.addObject("age20", age20);
            mav.addObject("age30", age30);
            mav.addObject("age40", age40);
            mav.addObject("attendId", attendId);
            
            
            mav.setViewName("/WEB-INF/view/personal/personalPageEvent.jsp");
         } catch (Exception e)
         {
            System.out.println(e.toString());
         }
         return mav;
      }   
	// 나의 기본정보 수정
	@RequestMapping(value = "/controlMyinfo.action")
	public ModelAndView PersonalControlInfo(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		String keynumber = (String) session.getAttribute("keynumber"); // 로그인한 이의 대표 번호 가져오기

		IPersonalControlDAO condao = sqlSession.getMapper(IPersonalControlDAO.class);

		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("email", request.getParameter("email"));
		hashmap.put("tel", request.getParameter("tel"));
		hashmap.put("info", request.getParameter("introduce"));
		hashmap.put("city", request.getParameter("location"));
		hashmap.put("telOpen", request.getParameter("telOpen"));
		hashmap.put("emailOpen", request.getParameter("emailOpen"));
		hashmap.put("birthOpen", request.getParameter("birthOpen"));
		hashmap.put("keynumber", keynumber);

		condao.controlMyinfo(hashmap);
		mav.setViewName("redirect: /personalcontrol.action?userkey=" + keynumber);

		return mav;
	}

	// 나의 특정 관심사 삭제
	@RequestMapping(value = "/personalInterestRemove.action")
	public ModelAndView PersonalControlMyinterestRemove(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		String keynumber = (String) session.getAttribute("keynumber"); // 로그인한 이의 대표 번호 가져오기

		IPersonalControlDAO condao = sqlSession.getMapper(IPersonalControlDAO.class);

		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("mbcategory_id", request.getParameter("mbcategory_id"));
		hashmap.put("keynumber", keynumber);

		condao.controlMyinterestRemove(hashmap);
		mav.setViewName("redirect: /personalcontrol.action?userkey=" + keynumber);

		return mav;
	}

	// 나의 특정 관심사 수정
	@RequestMapping(value = "/personalInterestModity.action")
	public ModelAndView PersonalControlMyinterestModify(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		String keynumber = (String) session.getAttribute("keynumber"); // 로그인한 이의 대표 번호 가져오기

		IPersonalControlDAO condao = sqlSession.getMapper(IPersonalControlDAO.class);

		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("mbcategory_id", request.getParameter("mbcategory_id"));
		hashmap.put("category_code", request.getParameter("category_code"));
		hashmap.put("keynumber", keynumber);

		//System.out.println(keynumber);

		condao.controlMyinterestModify(hashmap);
		mav.setViewName("redirect: /personalcontrol.action?userkey=" + keynumber);

		return mav;
	}

	// 나의 특정 관심사 추가
	@RequestMapping(value = "/personalInterestInsert.action")
	public ModelAndView PersonalControlMyinterestInsert(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		String keynumber = (String) session.getAttribute("keynumber"); // 로그인한 이의 대표 번호 가져오기

		IPersonalControlDAO condao = sqlSession.getMapper(IPersonalControlDAO.class);

		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("category_code", request.getParameter("category_code"));
		hashmap.put("keynumber", keynumber);

		condao.controlMyinterestInsert(hashmap);
		mav.setViewName("redirect: /personalcontrol.action?userkey=" + keynumber);

		return mav;
	}

	@Resource(name = "fileManager")
	private FileManager fileManager;

	// 나의 프로필 수정
	@RequestMapping(value = "/personalPicchange.action")
	public ModelAndView PersonalPicChange(HttpServletRequest request, HttpSession session)
	{
		
		ModelAndView mav = new ModelAndView();
		String keynumber = (String) session.getAttribute("keynumber"); // 로그인한 이의 대표 번호 가져오기

		String dragv = request.getParameter("dragv");
		// 이미지 저장 경로 설정
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "image";

		// 파일 생성
		File dir = new File(pathname);

		// 폴더가 없을 경우 생성
		if (!dir.exists())
			dir.mkdirs();

		// 이미지가 설정되어있나 없나 확인 후 업로드

			dragv = fileManager.ChangeImg(dragv, pathname);
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("keynumber", keynumber);
		hashmap.put("url", dragv);
		
		IPersonalLeftbarDAO dao = sqlSession.getMapper(IPersonalLeftbarDAO.class);
		session.setAttribute("pic", dragv);
		
		dao.profilePhotoModify(hashmap);

		mav.setViewName("redirect: /personalcontrol.action?userkey=" + keynumber);

		return mav;
	}
	
	
	
}
