package com.test.message;

import java.sql.SQLException;
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

import com.test.admin.AdminPage;
import com.test.admin.QNADTO;
import com.test.friend.Friend_DTO;
import com.test.friend.Friend_IDAO;
import com.test.group.Group_DTO;
import com.test.group.Group_IDAO;

@Controller
public class MessageController
{

	@Autowired
	private SqlSession sqlSession;

	@Resource(name = "AdminPage")
	private AdminPage adminpage;
	
	@RequestMapping(value = "/messageFriendPick.action", method = RequestMethod.GET)
	public String messageFriendPick(HttpServletRequest request)
	{

		String id = request.getParameter("friendId");

		return "/WEB-INF/view/message/messageSendForm.jsp?friendId=" + id;
	}

	@RequestMapping(value = "/messageHostPick.action", method = RequestMethod.GET)
	public String messageHostPick(HttpServletRequest request)
	{

		String id = request.getParameter("friendId");

		return "/WEB-INF/view/message/messageSendHostPickForm.jsp?friendId=" + id;
	}

	// 받은 메시지 리스트 확인
	@RequestMapping(value = "/messagemyreceive.action", method = RequestMethod.GET)
	public ModelAndView messageMyreceive(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		Message_IDAO dao = sqlSession.getMapper(Message_IDAO.class);
		int keynumber = Integer.parseInt((String) session.getAttribute("keynumber"));  //나의 대표 번호 가져오기
		ModelAndView mav = new ModelAndView();
		// 현재 페이지
		int page = Integer.parseInt(request.getParameter("page")==null?"1":request.getParameter("page"));
		
		// 한 화면에 출력될 페이지 수
		int countPage = 5;
		
		int[] sePage = adminpage.StartEndPage(page,  dao.pageCount(), countPage, 5);
		
		int startPage = sePage[0];
		int endPage = sePage[1];
		int totalPage = sePage[2];
		
		HashMap<String, Integer> stMap = new HashMap<String, Integer>();
		stMap.put("startPage", (page-1)*5+1);
		stMap.put("countPage", page*countPage);
		stMap.put("id", keynumber);
		
		//대표번호로 내가 받은 메시지 번호들과 메시지의 타입에 대한 배열 가져오기 
		ArrayList<ReceiveMessageDTO> receiveMsgList = new ArrayList<ReceiveMessageDTO>();
		receiveMsgList = dao.getUesrReceiveMessage(stMap);
		
		mav.addObject("page", page);
		mav.addObject("receiveMsgList", receiveMsgList);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("totalPage", totalPage);
		
		
		//메시지 리스트를 받을 리스트 변수 
		ArrayList<Message_DTO> receiveMsgDtos = new ArrayList<Message_DTO>();
		
		
		for(ReceiveMessageDTO dto : receiveMsgList) {
			String msgid = String.valueOf(dto.getMessageId());
			int typeid = dto.getMessageType();
			
			Message_DTO message = null;
			
			if(typeid == 6) 
			{
				message = dao.receiveMsgnew(msgid);
				receiveMsgDtos.add(message);
			} 
			else 
			{
				HashMap<String, Object> hashmap = new HashMap<String, Object>();
				hashmap.put("lmbtextsend_id", msgid);
				hashmap.put("keynumber", keynumber);
				message = dao.getGMsg(hashmap);
				receiveMsgDtos.add(message);
			}
			
		}
		
		mav.setViewName("/WEB-INF/view/message/messageMyreceive.jsp");
		mav.addObject("receiveMsgList", receiveMsgDtos);
		
		return mav;
	}

	// 보낸 메시지 리스트 확인 
	@RequestMapping(value = "/messagemysent.action", method = RequestMethod.GET)
	public ModelAndView messageMysent(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		Message_IDAO dao = sqlSession.getMapper(Message_IDAO.class);
		String keynumber = (String) session.getAttribute("keynumber");
		

		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		hashmap.put("keynumber", keynumber);
		
		ArrayList<Message_DTO> sendMsgList = dao.sendMsgList(hashmap );
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/view/message/messageMysent.jsp");
		mav.addObject("sendMsgList", sendMsgList);
		return mav;
	}

	// 받은 메시지 내용 가져오기 및 수신확인 날짜 데이터 넣기   
	@RequestMapping(value = "/messagemyreceiveform.action", method = RequestMethod.GET)
	public ModelAndView messageMyreceiveForm(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		
		//나의 대표 번호 가져오기 
		String keynumber = (String) session.getAttribute("keynumber");  
		
		//클릭한 메시지의 메시지 번호 가져오기 
		Message_IDAO dao = sqlSession.getMapper(Message_IDAO.class);
		String lmbtextsend_id = request.getParameter("lmbtextsend_id");
		
		//메시지의 타입 가져오기 
		String type = dao.msgType(lmbtextsend_id);
		
		ModelAndView mav = new ModelAndView();
		
		//만약 타입이 6이면 개인~
		if(type.equals("6"))
		{
			// 내용가져오기
			Message_DTO receiveMsg = dao.getMsg(lmbtextsend_id);
			
			// 수신확인데이터 넣기
			dao.readMsg(lmbtextsend_id);
			
			//뷰에 해당 내용 뿌려주기 
			mav.setViewName("/WEB-INF/view/message/messageMyreceiveForm.jsp");
			mav.addObject("receiveMsg", receiveMsg);
		}	
		else
		{
			//내용 확인하기 
			HashMap<String, Object> hashmap = new HashMap<String, Object>();
			hashmap.put("lmbtextsend_id", lmbtextsend_id);
			hashmap.put("keynumber", keynumber);
			Message_DTO receiveMsg = dao.getGMsg(hashmap);
			
			//수신확인하기 
			dao.readGMsg(hashmap);
			
			//뷰에 해당 내용 뿌려주기 
			mav.setViewName("/WEB-INF/view/message/messageMyreceiveForm.jsp");
			mav.addObject("receiveMsg", receiveMsg);
		}	
		
		return mav;
		

		
	}

	// 보낸 메시지 내용 출력하기
	@RequestMapping(value = "/messagemysentform.action", method = RequestMethod.GET)
	public ModelAndView messageMysentForm(HttpServletRequest request) throws ClassNotFoundException, SQLException
	{
		//메시지 번호 
		Message_IDAO dao = sqlSession.getMapper(Message_IDAO.class);
		String lmbtextsend_id = request.getParameter("lmbtextsend_id");
		
		Message_DTO sendMsg = dao.getsendMsg(lmbtextsend_id);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/view/message/messageMysentForm.jsp");
		mav.addObject("sendMsg", sendMsg);

		return mav;
	}

	// 메시지 출력화면에서 삭제하기 (받은메시지)
	@RequestMapping(value = "/messageRemoveform.action", method = RequestMethod.GET)
	public ModelAndView messageDeleteForm(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		//나의 대표 번호 가져오기 
		String keynumber = (String) session.getAttribute("keynumber");  
		
		//메시지 번호 
		Message_IDAO dao = sqlSession.getMapper(Message_IDAO.class);
		String lmbtextsend_id = request.getParameter("lmbtextsend_id");
		
		//메시지의 타입 가져오기 
		String type = dao.msgType(lmbtextsend_id);

		ModelAndView mav = new ModelAndView();	
		if(type.equals("6"))
		{
			//개인 메시지 삭제하기 
			dao.removeMsg(lmbtextsend_id);
			mav.setViewName("redirect:/messagemyreceive.action");
		}
		else
		{	
			//해쉬맵 설정
			HashMap<String, Object> hashmap = new HashMap<String, Object>();
			hashmap.put("lmbtextsend_id", lmbtextsend_id);
			hashmap.put("keynumber", keynumber);
			
			//그룹 메시지 삭제하기 
			dao.removeGMsg(hashmap);
			mav.setViewName("redirect:/messagemyreceive.action");
		}
		
		

		return mav;

	}

	// 메시지 출력화면에서 삭제하기 (보낸메시지)  
	@RequestMapping(value = "/messagesendRemoveform.action", method = RequestMethod.GET)
	public ModelAndView messagesendDeleteForm(HttpServletRequest request) throws ClassNotFoundException, SQLException
	{

		Message_IDAO dao = sqlSession.getMapper(Message_IDAO.class);
		String lmbtextsend_id = request.getParameter("lmbtextsend_id");

		int removeMsg = dao.removesendMsg(lmbtextsend_id);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/messagemysent.action");

		return mav;

	}

	// 메시지 리스트에서 선택된 메시지 삭제하기 (받은 메시지)
	@RequestMapping(value = "/messageRemoveChoiceform.action", method = RequestMethod.GET)
	public ModelAndView messageDeleteChoiceForm(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{

		Message_IDAO dao = sqlSession.getMapper(Message_IDAO.class);

		
		// 그전 페이지에서 form 자체를 넘겨 받아
		// 체크박스의 이름이 delete인 아이들의 벨류값을 가져와서 배열에 담는다.
		// 반복문으로 하나하나 빼와서 각각 다 제거 처리를 해준다.
		String[] checklist = request.getParameterValues("delete");
		//나의 대표 번호 가져오기 
		String keynumber = (String) session.getAttribute("keynumber");  
		
		for (int i = 0; i < checklist.length; i++)
		{
			String typeId = dao.msgType(checklist[i]);
			
			if(typeId.equals("6")) 
			{
				dao.removeMsg(checklist[i]);
			}
			else
			{
				
				//해쉬맵 설정
				HashMap<String, Object> hashmap = new HashMap<String, Object>();
				hashmap.put("lmbtextsend_id", checklist[i]);
				hashmap.put("keynumber", keynumber);
				dao.removeGMsg(hashmap);
			}
			
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/messagemyreceive.action");

		return mav;
	}

	// 메시지 리스트에서 선택된 메시지 삭제하기 (보낸 메시지)
	@RequestMapping(value = "/messageRemovesendChoiceform.action", method = RequestMethod.GET)
	public ModelAndView messageDeletesendChoiceForm(HttpServletRequest request)
			throws ClassNotFoundException, SQLException
	{

		Message_IDAO dao = sqlSession.getMapper(Message_IDAO.class);

		String[] checklist = request.getParameterValues("delete");
		for (int i = 0; i < checklist.length; i++)
		{
			dao.removesendMsg(checklist[i]);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/messagemysent.action");

		return mav;
	}

	// 메시지 보내기 창 띄우기 (그룹리스트, 친구리스트 가져와야함~~)
	@RequestMapping(value = "/messagesendform.action", method = RequestMethod.GET)
	public ModelAndView messageSendForm(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		
		if(session.getAttribute("keynumber")==null)
		{
			
		}
		
		//그룹리스트 미리 가져와야함 
		Group_IDAO dao = sqlSession.getMapper(Group_IDAO.class);
		
		//친구리스트 미리 가져와야함
		Friend_IDAO fdao = sqlSession.getMapper(Friend_IDAO.class);
		
		//로그인한 사람의 대표번호가져오기 
		String keynumber = (String) session.getAttribute("keynumber");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/view/message/messageSendForm.jsp");
		
		//그룹리스트 넘겨주기 
		ArrayList<Group_DTO> msgGrouplist = dao.msgGrouplist(keynumber);
		mav.addObject("msgGrouplist", msgGrouplist);
		
		//친구리스트 넘겨주기
		ArrayList<Friend_DTO> msgFriendlist = fdao.msgFriendList(keynumber);
		mav.addObject("msgFriendlist", msgFriendlist);
		

		return mav;
	}

	// 메시지 보내기(개인) 
	@RequestMapping(value = "/messagesendtofriend.action", method = RequestMethod.GET)
	public ModelAndView messageSendtoFriend(HttpServletRequest request,  HttpSession session) throws ClassNotFoundException, SQLException
	{

		Message_IDAO dao = sqlSession.getMapper(Message_IDAO.class);
		
		int mykeynumber =  Integer.parseInt((String)session.getAttribute("keynumber"));
		int friendkeynumber = Integer.parseInt(request.getParameter("F_keynumber"));
		String title = request.getParameter("subject");
		String content = request.getParameter("message");
		
		HashMap<String, Object> memberTextMap = new HashMap<String, Object>();
		memberTextMap.put("limember_id", mykeynumber); // 보내는 사람 keynumber
		memberTextMap.put("lumember_id", friendkeynumber); // 받는 사람 friendkeynumber
		memberTextMap.put("mbtextsend_title", title); // 제목
		memberTextMap.put("mbtextsend_content", content); // 내용

		dao.sendMemberMsg(memberTextMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/messagemysent.action");
		return mav;
	}
	
	//메시지 보내기(그룹)  "/messagesendtogroup.action"   --확인해바야뎀
	@RequestMapping(value = "/messagesendtogroup.action", method = RequestMethod.GET)
	public ModelAndView messageSendtoGroup(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		Message_IDAO dao = sqlSession.getMapper(Message_IDAO.class);
		
		//내 대표번호, 그룹 대표번호, 타이틀, 내용
		int mykeynumber =  Integer.parseInt((String)session.getAttribute("keynumber"));
		int groupid = Integer.parseInt(request.getParameter("groupid"));
		String title = request.getParameter("subject");
		String content = request.getParameter("message");
		
		//해쉬맵 구성 
		HashMap<String, Object> groupTextMap = new HashMap<String, Object>();
		groupTextMap.put("limember_id", groupid); // 받는 사람 groupid
		groupTextMap.put("lumember_id", mykeynumber); // 보내는 사람 keynumber
		groupTextMap.put("mbtextsend_title", title); // 제목
		groupTextMap.put("mbtextsend_content", content); // 내용
		
		//그룹메시지 보내기 
		dao.sendGroupMsg(groupTextMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/messagemyreceive.action");
		return mav;
	}

	// 친구에게 이벤트 초대메시지 보내기
	@RequestMapping(value = "/messagesendinviteform.action", method = RequestMethod.GET)
	public String messageSendInviteForm(HttpServletRequest request)
	{

		return "/WEB-INF/view/message/messageSendInviteForm.jsp";
	}

}
