<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="robots" content="noindex, nofollow">

<title>그룹 사진</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
<link rel="stylesheet" href="<%=cp%>/css/style.css">	
	
<script type="text/javascript">

	$(document).on("click", ".glyphicon-eye-open", function()
	{
		$(this).attr("class", "glyphicon glyphicon-eye-close");
	});

	$(document).on("click", ".glyphicon-eye-close", function()
	{
		$(this).attr("class", "glyphicon glyphicon-eye-open");
	});
	
</script>


<style type="text/css">

</style>



</head>
<body>
<c:import url="../Menu.jsp"></c:import>

	<!-- 상단메뉴 -->
	<div>
		<c:import url="groupPageTopMenu.jsp"></c:import>
	</div>
	<!-- 상단메뉴 end -->

	<div class='container' style="padding: 20px; ">
		<c:choose>
			<c:when test="${fn:length(groupEvents) > 5}">
				<c:set var="heightA" value="${(fn:length(groupEvents) - 5) * 120 + 1000}"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="heightA" value="1000"></c:set>
			</c:otherwise>
		</c:choose>
		<!-- 메인메뉴  -->
		<div class='span8 main'
			style="border: 2px white solid; padding: 20px; width: 1130px; height:${heightA}px; background-color: white;">
				
<!-- 			<div id="eventOpenCheck" style="text-align: right; font-size: 17px;"> -->
<!-- 				이벤트공개여부&nbsp;<span class="glyphicon glyphicon-eye-open" -->
<!-- 					aria-hidden="true">open</span>&nbsp;<span class="glyphicon glyphicon-eye-close" -->
<!-- 					aria-hidden="true">close</span> -->
<!-- 			</div> -->
			
			<!--이벤트리스트-->
			<div id="eventlist" style="padding-left: 2%; padding-top: 2%;">
				
				<!-- 다가오는 이벤트 타이틀 -->
				<div id="title" style="color: #ef9534; float: left;">
					<strong>이벤트 타임라인</strong>
				</div>


				<!-- 다가오는 이벤트  -->
				<div id="upcomingEvent"
					style="float: left; margin: 0px; padding: 10px;">

					<c:forEach var="groupEvent" items="${groupEvents}">
					<!-- 이벤트1 -->
					<div id="upcoming1"
						style="width: 880px; height: 120px; margin-bottom: 15px;">

						<!-- 상세 정보 1 -->
						<div id="upcomingEventinfo1"
							style="display: inline-block; width: 500px;">
							<div id="upcomingEventName"
								style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
								<a href="/groupevent.action?groupId=${groupId}&eventId=${groupEvent.levent_id}"><span>${groupEvent.event_name}</span></a>
							</div>
							<br> <br>
							<div id="upcomingEventLocation"
								style="margin: 0px; font-size: 17px;">${groupEvent.city_name}</div>
							<div id="upcomingEventLocationDetail">${groupEvent.event_place}</div>
						</div>

						<!-- 상세 정보 2 -->
						<div id="upcomingEventinfo2"
							style="display: inline-block; position: relative; padding-top: 2%;">
							<div id="upcomingEventDate"
								style="font-size: 18px; color: #2b65c4;">${groupEvent.event_ymd}</div>
							<div id="upcomingEventTime"
								style="margin: 0px; font-size: 18px; text-align: right">${groupEvent.event_hm}</div>
							<div id="upcomingEventCount">
								<p style="color: #5c95f2; font-size: 27px;">
									<span class="glyphicon glyphicon-user" aria-hidden="true"></span>${groupEvent.attend_count}/${groupEvent.event_maxattend}
									

								</p>
							</div>
						</div>
						<!-- 상세 정보 2 end-->
						
					</div>
					</c:forEach>
					<!-- 이벤트1 end -->


				</div>
				<!-- 다가오는 이벤트 end-->


			</div>
			<!--이벤트 리스트 end  -->



		</div>
		<!-- 메인메뉴 end-->
	</div>

	<!--하단바-->
	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
	<!--하단바 끝-->
</body>
</html>