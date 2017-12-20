package com.test.calendar;

import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalendarController
{
	@Resource(name = "Schdule")
	private Schdule schdule;
	
	@RequestMapping(value="/calendar.action")
	public ModelAndView Calendar(ModelAndView mav, HttpServletRequest request)
	{
		//데이터 받기
		String choiceYear = request.getParameter("year");
		String choiceMonth = request.getParameter("month");
		
		//현재 년도에 대한 값 받아오기 
		Calendar cd = Calendar.getInstance(); //캘린더 객체 생성
		int nowYear = cd.get(Calendar.YEAR); //현재 년도
		int nowMonth = cd.get(Calendar.MONTH) + 1; //현재 월 가져오기 0부터 시작하므로 1을 더해주어야 함. 

		//선택옵션 구성하기(현재 년도를 디폴드로 선택되어있게 구성. 혹시나 다른 년도가 선택되면 그에 따라 옵션 구성을 달리함)
		//만약 선택되어있는게 있다면 그걸 현재 년도로 설정!
		if (choiceYear != null)
			nowYear = Integer.parseInt(choiceYear); // 선택된 초이스 값은 스트링이므로 인트형으로 형변환 

		//선택되어있다면 그게 현재 년도. 아니면 그냥 현재년도가 선택되어있을 수 있는 상황. 
		String yOptions = ""; //년도에 대한 옵션을 담을 변수 선언. 

		for (int i = nowYear - 10; i <= nowYear + 10; i++) {
			if (i == nowYear) //구성한 옵션에서 변수가 선택한 년도가 되었을 때 셀렉트 되도록 구성. 
				yOptions += "<option value='" + i + "' selected='selected'>" + i + "</option>";
			else
				yOptions += "<option value='" + i + "'>" + i + "</option>";
		}

		//만약 선택되어있는 게 있다면 그걸 현재 월로 설정!
		String mOptions = ""; //월에 대한 옵션을 담을 변수 선어. 

		if (choiceMonth != null)
			nowMonth = Integer.parseInt(choiceMonth);

		for (int i = 1; i <= 12; i++) {
			if (i == nowMonth)
				mOptions += "<option value='" + i + "' selected='selected'>" + i + "</option>";
			else
				mOptions += "<option value='" + i + "'>" + i + "</option>";
		}

		// 선택한 년과 월에 따라. 요일과 마지막 달의 날을 구한다!

		// 전년도 12월 31일까지의 날짜 수 구하기  
		int total = 0; //최종일수 
		total = 365 * (nowYear - 1) + (nowYear - 1) / 4 - (nowYear - 1) / 100 + (nowYear - 1) / 400;

		// 해당 달의 전달까지의 날수를 구하고. 만약에 윤년이면 1을 더한다. 
		int lastDay[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

		for (int i = 0; i < nowMonth - 1; i++) {
			total += lastDay[i];
		}

		if (nowMonth > 3 && (nowYear % 4 == 0 && nowYear % 100 != 0 || nowYear % 400 == 0)) {
			total++;
		}

		//이번달 첫날 계산하기 위해 +1. 
		total++;

		//요일 계산
		int nowDay = total % 7; //요일 계산 일요일이 0일 

		//선택에 따라 다른 방식으로 달력 출력(출력하면서 일정있는지 확인하는 함수 호출)

		String myTable = "";

		myTable += "<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>";

		myTable += "<tr>";

		//일단 공백 생성
		for (int i = 0; i < nowDay; i++) {
			myTable += "<td></td>";
		}

		//달력그리면서 스케쥴 체크 후 달력그리기 
		for (int i = 1; i <= lastDay[nowMonth - 1]; i++, nowDay++) {

			int ilSu = schdule.schduleCheck(nowYear, nowMonth, i);

			//년도와 날짜를 각 td의 아이디로 사용
			String calId = Integer.toString(nowYear) + Integer.toString(nowMonth) + Integer.toString(i);

			if (ilSu == 0) //받은수가 0이면 그걸 빼고 그리고 
				myTable += "<td id=" + calId + ">" + i + "</td>";
			else
				//일정수가 있을 경우 클래스를 ilsuok로 변경
				myTable += "<td class='ilsuok' id=" + calId + ">" + i
						+ "<span class='ilsuokSpan' Style='color:red; display:none;'><small>(" + ilSu
						+ ")<small></span></td>";

			if (nowDay % 7 == 6) //토요일마다 개행
				myTable += "</tr><tr>";
		}

		for (; (nowDay - 1) % 7 != 6; nowDay++)
			myTable += "<td></td>";

		myTable += "</tr>";
		
		mav.addObject("myTable", myTable);
		mav.addObject("yOptions", yOptions);
		mav.addObject("mOptions", mOptions);
		
		mav.setViewName("/WEB-INF/view/personal/calenderCheck.jsp");
		
		return mav;	
	}
}
