<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	System.out.println(cp);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>나의 홈페이지</title>

<!-- 기본 CSS import -->
<c:import url="../import/head.jsp"></c:import>

<style type="text/css">
#upcomingEventinfo1 {
	poistion: absolute;
	left: 100px;
	top: 0px;
	padding-left: 15px;
}

#upcomingEventinfo2 {
	poistion: absolute;
    right: 50px;
	top: 0px;
}

#pastEvent1 
{
	padding-left:70px;
	padding-right:70px;
}

#pastEvent2 
{
	padding-left:70px;
	padding-right:70px;
}

#pastEventinfo1 {
	poistion: absolute;
	left: 100px;
	top: 0px;
	padding-left: 15px;
}

#pastEventinfo2 {
	poistion: absolute;
    right: 50px;
	top: 0px;
}

#upcomingEvent1 
{
	padding-left:70px;
	padding-right:70px;
}

#upcomingEvent2 
{
	padding-left:70px;
	padding-right:70px;
}


</style>

</head>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="../Menu.jsp"></c:import>
	
	<!-- 멤버 선택 메뉴 -->
	
	<!-- 그룹 상단메뉴 -->
	<c:import url="groupPageTopMenu.jsp"></c:import>

	<div class='container' style="padding: 20px;">

		<!--중간 메뉴들(왼쪽, 메인)  -->
		<div id='content' class='row-fluid'>

			<!-- 왼쪽 메뉴 -->
			<div>
				<c:import url="groupPageLeftBar.jsp"></c:import>
			</div>
			<!-- 왼쪽 메뉴 끝-->

			<!-- 메인메뉴  -->
			<div class='span8 main'
				style="border: 2px white solid; padding: 20px; float:right; width: 945px; background-color: white; margin-left: 15px;">
				
				<!-- 그룹소개 -->
				<div id="introduce">
					<p>${groupInfo.group_info}</p>
						
					<p style="text-align: center;"><a href="/groupintroduce.action?lGroup_id=${lGroup_id}">상세페이지로</a></p>
				</div>
				<hr>

				<!--이벤트리스트-->
				<div id="eventlist">

					<!-- 다가오는 이벤트 타이틀 -->
					<div id="title" style="color: #ef9534; display: inline-block;">
						<strong>다가오는 이벤트</strong>
					</div>
					
					<!--다가오는 이벤트  -->
					<div id="upcomingEvent" style="float: left; margin: 0px; padding: 10px;">
						
						<c:forEach var="posEventDto" items="${posEventDtos}">
						<!-- 이벤트1 -->
						

							<div id="pastEvent1"
							style="width: 840px; height: 120px; border-radius: 20px; margin-bottom: 15px;">

								<!-- 상세 정보 1 -->
								<div id="pastEventinfo1"
									style="display: inline-block; width: 500px; float: left;">
									<div id="pastEventName"
										style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
										<a href="/groupevent.action?lGroup_id=${lGroup_id}&eventId=${posEventDto.lEvent_id}">${posEventDto.event_name}</a>
									</div>
									<br> <br>
									<div id="pastEventLocation" style="margin: 0px; font-size: 17px;">${posEventDto.city_name}</div>
									<div id="pastEventLocationDetail">${posEventDto.event_place}</div>
								</div>
	
								<!-- 상세 정보 2 -->
								<div id="pastyEventinfo2"
									style="display: inline-block; position: relative; padding-top: 2%;">
									<div id="pastEventDate" style="font-size: 18px; color: #2b65c4;">
										${posEventDto.event_ymd}</div>
									<div id="pastEventTime" style="margin: 0px; font-size: 18px;">${posEventDto.event_hm}</div>
									<div id="pastEventCount">
										<p style="color: #5c95f2; font-size: 27px;">
											<span class="glyphicon glyphicon-user" aria-hidden="true"></span>${posEventDto.attend_count}/${posEventDto.event_maxAttend}
										</p>
									</div>
								</div>
								<!-- 상세 정보 2 end-->
							</div>
							<!-- 이벤트1 end-->
						</c:forEach>
						<!-- 이벤트1 end-->

					</div>
					<!--다가오는 이벤트 end -->

					<br> <br>
					<!-- 과거 이벤트 타이틀 -->
					<div id="title" style="color: #ef9534; display: inline-block;">
						<strong>과거 이벤트</strong>
					</div>

					<!--참가예정 이벤트  -->
					<div id="pastEvent" style="float: left; margin: 0px; padding: 10px;">
						<!-- 이벤트1 -->
						<c:forEach var="preEventDto" items="${preEventDtos}">
							<div id="pastEvent1"
							style="width: 840px; height: 120px; border-radius: 20px; margin-bottom: 15px;">

								<!-- 상세 정보 1 -->
								<div id="pastEventinfo1"
									style="display: inline-block; width: 500px; float: left;">
									<div id="pastEventName"
										style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
										<a href="/groupevent.action?lGroup_id=${lGroup_id}&eventId=${preEventDto.lEvent_id}">${preEventDto.event_name}</a>
									</div>
									<br> <br>
									<div id="pastEventLocation" style="margin: 0px; font-size: 17px;">${preEventDto.city_name}</div>
									<div id="pastEventLocationDetail">${preEventDto.event_place}</div>
								</div>
	
								<!-- 상세 정보 2 -->
								<div id="pastyEventinfo2"
									style="display: inline-block; position: relative; padding-top: 2%;">
									<div id="pastEventDate" style="font-size: 18px; color: #2b65c4;">
										${preEventDto.event_ymd}</div>
									<div id="pastEventTime" style="margin: 0px; font-size: 18px;">${preEventDto.event_hm}</div>
									<div id="pastEventCount">
										<p style="color: #5c95f2; font-size: 27px;">
											<span class="glyphicon glyphicon-user" aria-hidden="true"></span>${preEventDto.attend_count}/${preEventDto.event_maxAttend}
										</p>
									</div>
								</div>
								<!-- 상세 정보 2 end-->
							</div>
							<!-- 이벤트1 end-->
						
						</c:forEach>
						

					</div>
					<!--과거 이벤트 end -->


				</div>
				<!--이벤트리스트 end  -->
			</div>
			<!-- 메인메뉴 end-->
		</div>
		<!--중간 메뉴들(왼쪽, 메인)  end-->


	</div>
	<!--전체 end -->

	<!--하단바  -->
	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
	<!--하단바 end-->
</body>
<script type="text/javascript">
	
</script>
</body>
</html>