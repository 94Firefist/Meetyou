<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>

<title>나의 타임라인</title>
<link rel="stylesheet" href="<%=cp%>/css/style.css">
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
<link rel="stylesheet" href="<%=cp %>/css/Nwagon.css" type="text/css">
<script src="<%=cp %>/js/Nwagon.js"></script>

<style type="text/css">
#myEventinfo1 {
	poistion: absolute;
	left: 100px;
	top: 0px;
	padding-left: 15px;
}

#myEventinfo2 {
	poistion: absolute;
	left: 100px;
	top: 0px;
}
</style>
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

</head>
<body>
<head>
</head>
<body>
	<c:import url="../Menu.jsp"></c:import>


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
				style="padding: 20px; width: 945px; background-color: white; margin-left: 15px;">

				<!-- <div id="eventOpenCheck" style="text-align: right; font-size: 17px;">
					해당 이벤트 공개여부 : &nbsp;<span class="glyphicon glyphicon-eye-open"
						aria-hidden="true">open</span>&nbsp;<span
						class="glyphicon glyphicon-eye-close" aria-hidden="true">close</span>
				</div> -->

				<!--이벤트리스트-->
				<div id="eventlist">


 					<!-- 내가 주최한 이벤트 타이틀 -->
					<div id="title" style="color: #ef9534; display: inline-block;">
						<strong>내가 주최한 이벤트</strong>
					</div>
					
					
					<c:if test="${hostEventList != null }">
						<c:forEach var="myEvent" items="${hostEventList }">
							<div id="myEvent" style="float: left; margin: 0px; padding: 10px;">
								<div id="myEvent1"
									style="width: 840px; height: 120px; margin-bottom: 15px;">
		
									<div id="myEventinfo1"
										style="display: inline-block; width: 500px;">
		
										<div id="myEventgroup">
											<strong>개인</strong>
										</div>
		
										<div id="myEventName"
											style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
											<a href="/personalevent.action?userkey=${myEvent.eventHostId}&eventId=${myEvent.eventId}">${myEvent.eventName }</a>
										</div>
										<br> <br>
										<div id="myEventLocation" style="margin: 0px; font-size: 17px;">${myEvent.eventAddr }</div>
										<div id="myEventLocationDetail">${myEvent.eventPlace }</div>
									</div>
		
									<div id="myEventinfo2"
										style="display: inline-block; position: relative; padding-top: 2%;">
										<div id="myEventDate" style="font-size: 18px; color: #2b65c4;">
											${myEvent.eventDate1 }</div>
										<div id="myEventTime"
											style="margin: 0px; font-size: 18px; text-align: right">${myEvent.eventDate2 }</div>
										<div id="myEventCount">
											<p style="color: #5c95f2; font-size: 27px; text-align: right;">
												<span class="glyphicon glyphicon-user" aria-hidden="true"></span>${myEvent.guestCount }/${myEvent.maxGuestCount }
												<%-- <span class="glyphicon glyphicon-eye-open" aria-hidden="true"
													id="myEvent1" style="font-size: 20px; ${my == 1 ? 'display: inline' : 'display: none' }"></span> --%>
											</p>
										</div>
									</div>
								</div>
							</div>
						
						</c:forEach>
					</c:if>
					
					
					
					
<!--
					내가 주최한 이벤트 
					<div id="myEvent" style="float: left; margin: 0px; padding: 10px;">
						이벤트1
						<div id="myEvent1"
							style="width: 840px; height: 120px; margin-bottom: 15px;">

							상세 정보 1
							<div id="myEventinfo1"
								style="display: inline-block; width: 500px;">


								<div id="myEventgroup">
									<strong>개인</strong>
								</div>


								<div id="myEventName"
									style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
									<a href="/personalevent.action">울랄라파티</a>
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
									3월 11일 수요일</div>
								<div id="myEventTime"
									style="margin: 0px; font-size: 18px; text-align: right">07:00PM</div>
								<div id="myEventCount">
									<p style="color: #5c95f2; font-size: 27px; text-align: right">
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>3/9
										<span class="glyphicon glyphicon-eye-open" aria-hidden="true"
											id="myEvent1" style="font-size: 20px;"></span>
									</p>
								</div>
							</div>
							상세 정보 2 end
						</div>
						이벤트1 end

						이벤트2
						<div id="myEvent2"
							style="width: 840px; height: 120px; border-radius: 20px; margin-bottom: 15px;">

							상세 정보 1
							<div id="myEventinfo1"
								style="display: inline-block; width: 500px;">
								<div id="myEventgroup">
									<strong>개인</strong>
								</div>
								<div id="myEventName"
									style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
									<a href="/personalevent.action">죽을때까지 마시는 파티</a>
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
									11월 12일 일요일</div>
								<div id="myEventTime"
									style="margin: 0px; font-size: 18px; text-align: right">11:00PM</div>
								<div id="myEventCount">
									<p style="color: #5c95f2; font-size: 27px; text-align: right">
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>10/60
										<span class="glyphicon glyphicon-eye-open" aria-hidden="true"
											style="font-size: 20px;" id="myEvent2"></span>
									</p>
								</div>
							</div>
							상세 정보 2 end
						</div>
						이벤트1 end
 -->						
					</div>
					<!--내가 주최한 이벤트 end -->


					<!--참가예정 이벤트 타이틀 -->

					<br> <br>
					<div id="title" style="color: #ef9534; display: inline-block;">
						<strong>참가 예정 이벤트</strong>
					</div>
					
					
					
					
					<c:if test="${hostInEventList != null }">
						<c:forEach var="myInEvent" items="${hostInEventList }">
							<div id="myEvent" style="float: left; margin: 0px; padding: 10px;">
								<div id="myEvent1"
									style="width: 840px; height: 120px; margin-bottom: 15px;">
		
									<div id="myEventinfo1"
										style="display: inline-block; width: 500px;">
		
										<div id="myEventgroup">
											<strong>개인</strong>
										</div>
		
										<div id="myEventName"
											style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
											<a href="/personalevent.action?userkey=${myInEvent.eventHostId}&eventId=${myInEvent.eventId}">${myInEvent.eventName }</a>
										</div>
										<br> <br>
										<div id="myEventLocation" style="margin: 0px; font-size: 17px;">${myInEvent.eventAddr }</div>
										<div id="myEventLocationDetail">${myInEvent.eventPlace }</div>
									</div>
		
									<div id="myEventinfo2"
										style="display: inline-block; position: relative; padding-top: 2%;">
										<div id="myEventDate" style="font-size: 18px; color: #2b65c4;">
											${myInEvent.eventDate1 }</div>
										<div id="myEventTime"
											style="margin: 0px; font-size: 18px; text-align: right">${myInEvent.eventDate2 }</div>
										<div id="myEventCount">
											<p style="color: #5c95f2; font-size: 27px; text-align: right;">
												<span class="glyphicon glyphicon-user" aria-hidden="true"></span>${myInEvent.guestCount }/${myInEvent.maxGuestCount }
												<%-- <span class="glyphicon glyphicon-eye-open" aria-hidden="true"
													id="myEvent1" style="font-size: 20px; ${my == 1 ? 'display: inline' : 'display: none' }"></span> --%>
											</p>
										</div>
									</div>
								</div>
							</div>
						
						</c:forEach>
					</c:if>
					
					
					
					
					
					
					
					
					
					
					
					
<!-- 
					참가예정 이벤트 
					<div id="myEvent" style="float: left; margin: 0px; padding: 10px;">
						이벤트1
						<div id="myEvent1"
							style="width: 750px; height: 120px; margin-bottom: 15px;">

							상세 정보 1
							<div id="myEventinfo1"
								style="display: inline-block; width: 500px;">


								<div id="myEventgroup">
									<strong>등산을 가요 서울 클럽</strong>
								</div>


								<div id="myEventName"
									style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
									<a href="/groupevent.action">등산을 가자</a>
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
									3월 11일 수요일</div>
								<div id="myEventTime"
									style="margin: 0px; font-size: 18px; text-align: right">07:00PM</div>
								<div id="myEventCount">
									<p style="color: #5c95f2; font-size: 27px; text-align: right">
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>3/9

										<span class="glyphicon glyphicon-eye-open" aria-hidden="true"
											style="font-size: 20px;"></span>
									</p>
								</div>
							</div>
							상세 정보 2 end
						</div>
						이벤트1 end

						이벤트2
						<div id="myEvent2"
							style="width: 840px; height: 120px; border-radius: 20px; margin-bottom: 15px;">

							상세 정보 1
							<div id="myEventinfo1"
								style="display: inline-block; width: 500px;">
								<div id="myEventgroup">
									<strong>술을 먹는 칵테일 그룹</strong>
								</div>
								<div id="myEventName"
									style="position: relative; font-size: 27px; margin: 0px; float: left; padding: 0px;">
									<a href="/personalevent.jsp">죽을때까지 마시는 파티</a>
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
									11월 12일 일요일</div>
								<div id="myEventTime"
									style="margin: 0px; font-size: 18px; text-align: right">11:00PM</div>
								<div id="myEventCount">
									<p style="color: #5c95f2; font-size: 27px; text-align: right">
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>10/60
										<span class="glyphicon glyphicon-eye-open" aria-hidden="true"
											style="font-size: 20px;"></span>
									</p>
								</div>
							</div>
							상세 정보 2 end
						</div>
						이벤트1 end

					</div>
					참가예정 이벤트 end
 -->

				</div>
				<!--이벤트리스트 end  -->


			</div>
			<!-- 메인메뉴 end-->
		</div>
		<!--중간 메뉴들(왼쪽, 메인)  end-->


	
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