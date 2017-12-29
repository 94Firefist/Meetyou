package com.test.controller;

import java.sql.SQLException;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.admin.AdminPage;
import com.test.admin.FAQDTO;
import com.test.admin.GroupDTO;
import com.test.admin.IAdminDAO;
import com.test.admin.IGroupDAO;
import com.test.admin.NoticeDTO;
import com.test.admin.PaymentDTO;
import com.test.admin.QNADTO;
import com.test.members.IMemberDAO;
import com.test.members.MemberDTO;

@Controller
public class AdminServiceController
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
		 
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
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
			
			
			com.test.dao.IGroupDAO groupDAO = sqlSession.getMapper(com.test.dao.IGroupDAO.class);
			// 카테고리 목록
			
			// 관심지역 목록
			
			// 그룹공개여부 목록
			
			
			mav.setViewName("/WEB-INF/view/admin/AdminMain.jsp");
			 
		} catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		 
		 return mav;
	}
	
	// 공지사항
	// 리스트
	@RequestMapping(value="/noticelist.action", method=RequestMethod.GET)
	public ModelAndView noticelist(HttpServletRequest request, HttpSession session)
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
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 한 화면에 출력될 페이지 수
		int countPage = 10;
		
		int[] sePage = adminpage.StartEndPage(page,  dao.noticePageCount(), countPage, 10);
		
		int startPage = sePage[0];
		int endPage = sePage[1];
		int totalPage = sePage[2];
		
		HashMap<String, Integer> stMap = new HashMap<String, Integer>();
		stMap.put("startPage", (page-1)*10+1);
		stMap.put("countPage", page*countPage);
		
		
		ArrayList<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		noticeList = dao.noticeList(stMap);
		
		mav.addObject("page", page);
		mav.addObject("noticeList", noticeList);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("totalPage", totalPage);
		
		mav.setViewName("WEB-INF/view/admin/AdminNotice.jsp");
		return mav;
		
	}
	// 추가
	@RequestMapping(value="/noticeinsert.action", method=RequestMethod.GET)
	public ModelAndView noticeinsert(HttpServletRequest request, HttpSession session)
	{	
		ModelAndView mav = new ModelAndView();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String admin = (String)session.getAttribute("keynumber");
		
		String title = request.getParameter("titleI");
		String content = request.getParameter("contentI");
		
		NoticeDTO notice = new NoticeDTO();
		
		notice.setAdminid(admin);
		notice.setTitle(title);
		notice.setContent(content);
	
		dao.noticeAdd(notice);
		
		mav.setViewName("redirect:noticelist.action");
		return mav;
	}
	// 수정
	@RequestMapping(value="/noticeupdate.action", method=RequestMethod.POST)
	public ModelAndView noticeupdate(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 데이터 수신
		// 제목, 내용, 번호
		String noticeId = request.getParameter("noticeId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NoticeDTO notice = new NoticeDTO();
		
		notice.setNoticeId(noticeId);
		notice.setTitle(title);
		notice.setContent(content);
		
		dao.noticeModify(notice);
		
		mav.setViewName("redirect:noticelist.action");
		return mav;
	}
	// 삭제
	@RequestMapping(value="/noticedelete.action", method=RequestMethod.GET)
	public ModelAndView noticedelete(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 데이터 수신
		String noticeId = request.getParameter("noticeId");		
		dao.noticeRemove(noticeId);
		
		mav.setViewName("redirect:noticelist.action");
		return mav;
	}

	
// 문의사항
	// 리스트
	@RequestMapping(value="/qnalist.action", method=RequestMethod.GET)
	public ModelAndView qnalist(HttpServletRequest request, HttpSession session)
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
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 한 화면에 출력될 페이지 수
		int countPage = 10;
		
		int[] sePage = adminpage.StartEndPage(page,  dao.pageCount(), countPage, 10);
		
		int startPage = sePage[0];
		int endPage = sePage[1];
		int totalPage = sePage[2];
		
		HashMap<String, Integer> stMap = new HashMap<String, Integer>();
		stMap.put("startPage", (page-1)*10+1);
		stMap.put("countPage", page*countPage);
		
		
		ArrayList<QNADTO> qnaList = new ArrayList<QNADTO>();
		qnaList = dao.qnaList(stMap);
		
		mav.addObject("page", page);
		mav.addObject("qnaList", qnaList);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("totalPage", totalPage);
		
		mav.setViewName("WEB-INF/view/admin/AdminQNA.jsp");
		return mav;
	}
	// 추가
	@RequestMapping(value="/qnainsert.action", method=RequestMethod.POST)
	public ModelAndView qnainsert(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		// 번호 이름 제목 내용 
		String qnaId = request.getParameter("qnaId");
		//String admin = request.getParameter("admin");		세션으로 가져올것~~
		String title = request.getParameter("titleI");
		String content = request.getParameter("contentI");
		QNADTO qna = new QNADTO();
		
		qna.setQnaId(qnaId);
		//qna.setAdmin(admin);		세션으로 가져올것~~
		qna.setTitle(title);
		qna.setContent(content);
		dao.qnaAdd(qna);
		mav.setViewName("redirect:qnalist.action");
		return mav;
	}
	
	
// FAQ
	// 리스트
	@RequestMapping(value="/faqlist.action", method=RequestMethod.GET)
	public ModelAndView faqlist(HttpServletRequest request, HttpSession session)
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
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 한 화면에 출력될 페이지 수
		int countPage = 10;
		
		int[] sePage = adminpage.StartEndPage(page,  dao.faqPageCount(), countPage, 10);
		
		int startPage = sePage[0];
		int endPage = sePage[1];
		int totalPage = sePage[2];
		
		HashMap<String, Integer> stMap = new HashMap<String, Integer>();
		stMap.put("startPage", (page-1)*10+1);
		stMap.put("countPage", page*countPage);
		
		
		ArrayList<FAQDTO> faqList = new ArrayList<FAQDTO>();
		faqList = dao.faqList(stMap);
		
		mav.addObject("page", page);
		mav.addObject("faqList", faqList);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("totalPage", totalPage);
		
		mav.setViewName("WEB-INF/view/admin/AdminFAQ.jsp");
		return mav;
	}
	
	
	// 추가
	@RequestMapping(value="/faqinsert.action", method=RequestMethod.GET)
	public ModelAndView faqinsert(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
				
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String title = request.getParameter("titleI");
		String content = request.getParameter("contentI");
		FAQDTO faq = new FAQDTO();
		
		//faq.setAdmin(admin);		세션으로 가져올것~~
		faq.setTitle(title);
		faq.setContent(content);

		dao.faqAdd(faq);
		
		mav.setViewName("redirect:faqlist.action");

		return mav;
	}
	// 수정
	@RequestMapping(value="/faqupdate.action", method=RequestMethod.POST)
	public ModelAndView faqupdate(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
				
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		// 데이터 수신
		// 제목, 내용, 번호
		String faqId = request.getParameter("faqId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		FAQDTO faq = new FAQDTO();
		
		faq.setFaqId(faqId);
		faq.setTitle(title);
		faq.setContent(content);
		
		dao.faqModify(faq);
		
		mav.setViewName("redirect:faqlist.action");

		return mav;
	}
	// 삭제
	@RequestMapping(value="/faqdelete.action", method=RequestMethod.GET)
	public ModelAndView faqdelete(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
				
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		// 데이터 수신
		String faqId = request.getParameter("faqId");
		
		dao.faqRemove(faqId);
		
		mav.setViewName("redirect:faqlist.action");

		return mav;
	}	
	
	
	// 상품
	@RequestMapping(value="/paymentlist.action", method=RequestMethod.GET)
	public ModelAndView paymentlist(HttpServletRequest request, HttpSession session)
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
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 한 화면에 출력될 페이지 수
		int countPage = 10;
		
		int[] sePage = adminpage.StartEndPage(page,  dao.paymentPageCount(), countPage, 10);
		
		int startPage = sePage[0];
		int endPage = sePage[1];
		int totalPage = sePage[2];
		
		HashMap<String, Integer> stMap = new HashMap<String, Integer>();
		stMap.put("startPage", (page-1)*10+1);
		stMap.put("countPage", page*countPage);
		
		
		ArrayList<PaymentDTO> paymentList = new ArrayList<PaymentDTO>();
		paymentList = dao.paymentList(stMap);
		
		mav.addObject("page", page);
		mav.addObject("paymentList", paymentList);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("totalPage", totalPage);
		
		mav.setViewName("WEB-INF/view/admin/AdminProduct.jsp");
		return mav;
	}
	
	// 수정
	@RequestMapping(value="/paymentupdate.action", method=RequestMethod.GET)
	public ModelAndView paymentupdate(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		// 관리자인지 세션 확인
		if(session.getAttribute("admin") == null)
		{
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 데이터 수신
		String paymentId = request.getParameter("paymentId");
		
		dao.paymentModify(paymentId);
		
		mav.setViewName("redirect:productlist.action");
		return mav;
		
	}
	
	@RequestMapping(value="/memberDel.action")
	public ModelAndView memberDel(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		 ModelAndView mav = new ModelAndView();

		 // 관리자인지 세션 확인
		 if(session.getAttribute("admin") == null)
		 {
			mav.setViewName("redirect:/mainevent.action");
			return mav;
		 }
		
		 IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		 
		 String member_id = request.getParameter("member_id");

		 dao.memberDel(member_id);
			
		 mav.setViewName("redirect:AdminMemberMain.jsp");
		
		 return mav;
	}
	
	@RequestMapping(value="/groupDel.action")
	public ModelAndView groupDel(HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException
	{
		 ModelAndView mav = new ModelAndView();

		 // 관리자인지 세션 확인
		 if(session.getAttribute("admin") == null)
		 {
			 mav.setViewName("redirect:/mainevent.action");
			 return mav;
		 }
			
		 IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		 
		 String group_id = request.getParameter("group_id");

		 //dao.groupDel(group_id);
			
		 mav.setViewName("redirect:grouplist.action");
		
		 return mav;
	}
}
