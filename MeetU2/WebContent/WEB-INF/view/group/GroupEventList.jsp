<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<c:out value=""></c:out>
<div class="container"
		style="width: 100%; height: 150px; padding: 2% 16%; background-color: #C7D3ED; margin: 15px 0px 0px 0px;">
		<div style="width: 100%; height: 100%;">
			
				<div style="width: 30%; height: 100%; float: left;">
					<a href="/groupevent.action?groupId=${groupId}&eventId=${event.levent_id}">
						<img alt="URL 오류" src="${event.event_url}" style="width: 100%; height: 100%;">
					</a>
				</div>
				<div style="width: 70%; height: 100%; float: right; padding: 2%;">
					<div style="width: 100%; height: 30%;;">
						<!-- 이벤트 제목 -->
						<a href="/groupevent.action?groupId=${groupId}&eventId=${event.levent_id}">
							<span style="font-size: 20pt; font-weight: bolder; ">${event.event_name}</span>
						</a>
					</div>
					<div style="width: 100%; height: 70%; padding: 2%;">
						<div style="width: 60%; height: 100%; float: left;">
							<label style="height: 50%; font-weight: lighter; ; font-size: 13pt;  font-family: '맑은 고딕'; color: #2478FF; ">${event.city_name}</label>
							<label style="height: 50%; font-weight: lighter; font-size: 11pt;  font-family: '맑은 고딕'; color: #2478FF;">${posEventDto.event_place}</label>
						</div>
						<div style="width: 40%; height: 100%; float: right;">
							<label style="width:100%; height: 30%; font-weight: normal; font-size: 10pt; font-family: '맑은 고딕';">${event.event_ymd}</label>
							<label style="width:100%; height: 70%; font-weight: normal; font-size: 15pt; font-family: '맑은 고딕';"><span class="glyphicon glyphicon-user"></span>${event.attend_count}/${event.event_maxattend}</label>
						</div>
					</div>
				</div>
			
		</div>
	
</div>