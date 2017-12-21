<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String userkey = request.getParameter("userkey");
%>
<!DOCTYPE html>
<html>
<head>

<title>나의 홈페이지</title>

<meta charset="utf-8">
<meta name="robots" content="noindex, nofollow">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://jqueryui.com/jquery-wp-content/themes/jqueryui.com/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

<!-- 나눔쏘스 -->
<link rel="stylesheet" href="css/Nwagon.css" type="text/css">
<script src="js/Nwagon.js"></script>

<style type="text/css">
#myEventinfo1 {
	poistion: absolute;
	left: 100px;
	top: 0px;
	padding-left: 15px;
}

#myEventinfo2 {
	poistion: absolute;
    right: 50px;
	top: 0px;
}

#myEvent1 
{
	padding-left:70px;
	padding-right:70px;
}

#myEvent2 
{
	padding-left:70px;
	padding-right:70px;
}

#myEvent3 
{
	padding-left:70px;
	padding-right:70px;
}
</style>

</head>
<body>
<head>
</head>
<body>
	<!--로그인바  -->
	<div>
		<c:import url="../Menu.jsp"></c:import>
	</div>

	<!-- 상단메뉴 -->
	<div>
		<c:import url="personalPageTopMenu.jsp"></c:import>
	</div>
	<!-- 상단메뉴 end -->

	<div class='container' style="padding: 20px;">

		<!--중간 메뉴들(왼쪽, 메인)  -->
		<div id='content' class='row-fluid'>

			<!-- 왼쪽 메뉴 -->
			<div>
				<c:import url="personalLeftBar.jsp"></c:import>
			</div>
			<!-- 왼쪽 메뉴 끝-->

			<!-- 메인메뉴  -->
			<div class='span8 main'
				style="border: 2px white solid; padding: 20px; width: 945px; background-color: white; margin-left: 15px;">
				
				<!-- 자기소개 -->
				<div id="introduce">
					
					
					<p>${userContent }</p>
					
					<!-- 
					<p>상아리의 자기소개입니다.상아리의 자기소개입니다.상아리의 자기소개입니다.상아리의 자기소개입니다.상아리의
						자기소개입니다.상아리의 자기소개입니다.상아리의 자기소개입니다.상아리의 자기소개입니다.상아리의 자기소개입니다.상아리의
						자기소개입니다.상아리의 자기소개입니다.상아리의 자기소개입니다.상아리의 자기소개입니다.상아리의 자기소개입니다.상아리의
						자기소개입니다.상아리의 자기소개입니다.상아리의 자기소개입니다.상아리의 자기소개입니다.상아리의 자기소개입니다.상아리의
						자기소개입니다.</p>
					 -->	
	
						
					<p style="text-align: center;"><a href="/personalintroducemyself.action?userkey=<%=userkey %>">상세페이지로</a></p>
				</div>
				<hr>

				<!--이벤트리스트-->
				<div id="eventlist">

					<!-- 내가 주최한 이벤트 타이틀 -->
					<div id="title" style="color: #ef9534; display: inline-block;">
						<strong>내가 주최한 이벤트</strong>
					</div>
					
<c:forEach var="event" items="${userEvent }">

					<!--내가 주최한 이벤트  -->
					<div id="myEvent" style="float: left; margin: 0px; padding: 10px;">
						<!-- 이벤트1 -->
						<div id="myEvent1"
							style="width: 880px; height: 120px; border-radius: 5px; margin-bottom: 15px;">

							<%-- <c:forEach var="event" items="${userEvent }"> --%>
							
								<div id="myEventinfo1"
									style="display: inline-block; width: 500px;">
									<div id="myEventName"
										style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
										<a href="/personalevent.action">${event.eventName }</a>
									</div>
									<br> <br>
									<div id="myEventLocation" style="margin: 0px; font-size: 17px;">
									${event.address }</div>
									<div id="myEventLocationDetail">${event.mainAddr }</div>
								</div>
	
							
								<div id="myEventinfo2"
									style="display: inline-block; position: relative; padding-top: 2%;">
									<div id="myEventDate" style="font-size: 18px; color: #2b65c4;">
										${event.eventDate1 }</div>
									<div id="myEventTime" style="margin: 0px; font-size: 18px;">${event.eventDate2 }</div>
									<div id="myEventCount">
										<p style="color: #5c95f2; font-size: 27px;">
											<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
											${event.guestCount }/${event.maxCount }
										</p>
									</div>
								</div>		
													
							<%-- </c:forEach> --%>





							<!-- 상세 정보 1 -->
							<!-- 
							<div id="myEventinfo1"
								style="display: inline-block; width: 500px;">
								<div id="myEventName"
									style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
									<a href="/personalevent.action">해피해피버스데이</a>
								</div>
								<br> <br>
								<div id="myEventLocation" style="margin: 0px; font-size: 17px;">경기도
									남양주 가운동</div>
								<div id="myEventLocationDetail">꿈의나라 호수공원 강산단지 305호(map)</div>
							</div>

							상세 정보 2
							<div id="myEventinfo2"
								style="display: inline-block; position: relative; padding-top: 2%;">
								<div id="myEventDate" style="font-size: 18px; color: #2b65c4;">
									12월 12일 화요일</div>
								<div id="myEventTime" style="margin: 0px; font-size: 18px;">15:00~18:00</div>
								<div id="myEventCount">
									<p style="color: #5c95f2; font-size: 27px;">
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>15/35
									</p>
								</div>
							</div>
							 -->
							<!-- 상세 정보 2 end-->
							

							
						</div>
	

						<!-- 
						<div id="myEvent2"
							style="width: 840px; height: 120px; border-radius: 20px; margin-bottom: 15px;">

		
							<div id="myEventinfo1"
								style="display: inline-block; width: 500px;">
								<div id="myEventName"
									style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
									<a href="/personalevent.action">죽을때까지 마시는 파티</a>
								</div>
								<br> <br>
								<div id="myEventLocation" style="margin: 0px; font-size: 17px;">경기도
									남양주 가운동</div>
								<div id="myEventLocationDetail">꿈의나라 호수공원 강산단지 305호(map)</div>
							</div>


							<div id="myEventinfo2"
								style="display: inline-block; position: relative; padding-top: 2%;">
								<div id="myEventDate" style="font-size: 18px; color: #2b65c4;">
									11월 12일 일요일</div>
								<div id="myEventTime" style="margin: 0px; font-size: 18px;">17:00~24:00</div>
								<div id="myEventCount">
									<p style="color: #5c95f2; font-size: 27px;">
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>9/10
									</p>
								</div>
							</div>
							
						</div>
						 -->
					

					</div>
					<!--내가 주최한 이벤트 end -->
</c:forEach>


					<br> <br>
					<div id="title" style="color: #ef9534; display: inline-block;">
						<strong>참가 예정 이벤트</strong>
					</div>



<c:forEach var="event" items="${goEvent }">

					<!--참가예정 이벤트  -->
					<div id="myEvent" style="float: left; margin: 0px; padding: 10px;">
						<!-- 이벤트1 -->
						<div id="myEvent3"
							style="width: 840px; height: 120px; border-radius: 20px; margin-bottom: 15px;">

							<!-- 상세 정보 1 -->
							<div id="myEventinfo1"
								style="display: inline-block; width: 500px;">
								<div id="myEventName"
									style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
									<a href="/personalevent.action">${event.eventName }</a>
								</div>
								<br> <br>
								<div id="myEventLocation" style="margin: 0px; font-size: 17px;">${event.address }</div>
								<div id="myEventLocationDetail">${event.mainAddr }</div>
							</div>

							<!-- 상세 정보 2 -->
							<div id="myEventinfo2"
								style="display: inline-block; position: relative; padding-top: 2%;">
								<div id="myEventDate" style="font-size: 18px; color: #2b65c4;">
									${event.eventDate1 }</div>
								<div id="myEventTime" style="margin: 0px; font-size: 18px;">${event.eventDate2 }</div>
								<div id="myEventCount">
									<p style="color: #5c95f2; font-size: 27px;">
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
										${event.guestCount }/${event.maxCount }
									</p>
								</div>
							</div>
							<!-- 상세 정보 2 end-->
						</div>
						<!-- 이벤트1 end-->


						<!--
						<div id="myEvent2"
							style="width: 840px; height: 120px; border-radius: 20px; margin-bottom: 15px;">

							
							<div id="myEventinfo1"
								style="display: inline-block; width: 500px;">
								<div id="myEventName"
									style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
									<a href="/personalevent.action">죽을때까지 마시는 파티</a>
								</div>
								<br> <br>
								<div id="myEventLocation" style="margin: 0px; font-size: 17px;">경기도
									남양주 가운동</div>
								<div id="myEventLocationDetail">꿈의나라 호수공원 강산단지 305호(map)</div>
							</div>

							
							<div id="myEventinfo2"
								style="display: inline-block; position: relative; padding-top: 2%;">
								<div id="myEventDate" style="font-size: 18px; color: #2b65c4;">
									11월 12일 일요일</div>
								<div id="myEventTime" style="margin: 0px; font-size: 18px;">17:00~24:00</div>
								<div id="myEventCount">
									<p style="color: #5c95f2; font-size: 27px;">
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>10/60
									</p>
								</div>
							</div>
						
						</div>
						-->

					</div>
					<!--내가 주최한 이벤트 end -->
</c:forEach>

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