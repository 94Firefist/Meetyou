package com.test.controller;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.test.dao.EventIDAO;
import com.test.dao.IMemberDAO;
import com.test.java.ExampleUTF8SendSMS;

@Controller
public class Ajax
{
	@Resource(name = "SendSMS")
	private ExampleUTF8SendSMS send;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/address.action")
	public ModelAndView Address(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 데이터 수신한다.
		String address = request.getParameter("address").replaceAll(" ", "+");
		
		ModelAndView mav = new ModelAndView();
		
		// 에이작스로 보낼 객체 생성
		ArrayList<String> LatLng = new ArrayList<String>();
		try
		{
			// XML 로 데이터 가져오기
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document xmlObj = null;
			do
			{
				String str = "https://maps.googleapis.com/maps/api/geocode/xml?address="+address
						+ "&key=AIzaSyCOh9gYfNwr-p7ZnBT0iXXPlCm9e-hapX4";
				URL url = new URL(str);
				InputSource is = new InputSource(url.openStream());
				xmlObj = builder.parse(is);
				
				// 루트 접근
				Element root = xmlObj.getDocumentElement();
				
				// location 가져오기
				NodeList locationNodelist = root.getElementsByTagName("location");
				
				// 결과값이 없을때 뒤에있는 주소를 자르기
				if (locationNodelist.getLength() == 0)
				{
					StringBuffer bf = new StringBuffer();
					int minus = bf.append(address).reverse().indexOf("+")+1;
					address = bf.reverse().substring(0, bf.length()-minus);
					continue;
				}
			
				NodeList LatLngNodeList = locationNodelist.item(0).getChildNodes();
		
				for(int i=0; i<LatLngNodeList.getLength(); i++)
				{
					Node LatLngNode = LatLngNodeList.item(i);
					
					if(LatLngNode.getNodeType() == 1)
					{
						Element LatLngElement = (Element)LatLngNode;
						LatLng.add(LatLngElement.getTextContent());
					}
				}
				
				// 반복문 빠져나가기
				break;
				
			} while (true);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		mav.addObject("Lat", LatLng.get(0));
		mav.addObject("Lng", LatLng.get(1));
		mav.setViewName("redirect:ajax/AddressOk.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/idSearch.action")
	public String IdSearch(HttpServletRequest request, ModelMap map)
	{
		String userId = request.getParameter("userId").toUpperCase();
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		String result = "win";
		
		if(userId.equals(dao.idsearch(userId)))
			result = "fail";
		
		map.addAttribute("result", result);
		
		return "ajax/IdSearchOK.jsp";
	}
	
	@RequestMapping(value="/checknum.action")
	public String checkNum(HttpServletRequest request ,ModelMap map)
	{
		// 데이터 받기
		String address = request.getParameter("address");
		String result = send.SendSMS(address);
		map.addAttribute("result", result);
		return "ajax/CheckNum.jsp";
	}
	
	@RequestMapping(value="/pay.action")
	public String Pay(HttpServletRequest request, ModelMap map, HttpSession session)
	{
		String paynum = request.getParameter("paynum");
		String keynumber = (String)session.getAttribute("keynumber");
		
		EventIDAO dao = sqlSession.getMapper(EventIDAO.class);
		
		
		
		HashMap<String, String> payMap = new HashMap<String, String>();
		
		payMap.put("keynumber", keynumber);
		payMap.put("paynum", paynum);
		
		dao.pay(payMap);
		
		String tag = dao.getTag(keynumber);
		String power = dao.getPower(keynumber);
		
		System.out.println(tag);
		System.out.println(power);
		
		map.addAttribute("tag",	tag);
		map.addAttribute("power", power);
		
		return "ajax/pay.jsp";
	}
}
