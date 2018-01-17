<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 이벤트</title>

<!-- 기본 CSS import -->
<c:import url="../import/head.jsp"></c:import>

<script type="text/javascript">
	$(document).ready(function()
	{
		$("#addAlbumBtn").click(function()
		{
			if(confirm("앨범을 생성하시겠습니까?"))
			{
				$(location).attr("href", "groupaddalbum.action?lGroup_id=${lGroup_id}&eventId=${eventId}");
			}
		})
		
		$(".attendBtn").click(function()
	      {
			if("${memberId}" == "0") {
        		if(confirm("로그인하시겠습니까?")){
        			$(location).attr("href", "loginform.action?page="+location.href);
        		}
        	}
			
			else if($(this).val() == "" || $(this).val() == null)
	         {
	        	
	        	
       		 if(confirm("수정하시겠습니까?")) {
 	               $("#attendBtn1").val("1").css("display", "inline");
 	               $("#attendBtn2").val("2").css("display", "inline");
 	               $("#attendBtn3").val("3").css("display", "inline");
 	              
	        	}
	           
	         } else {
	            if(confirm("설정하시겠습니까?")) {
	               $(location).attr("href", "groupseteventattend.action?lGroup_id=${lGroup_id}&eventId=${eventId}&target=" + $(this).val())
	            }
	         }
	         
	      });
		
	});
	
	
	function evupdate(id)
   {
      $(location).attr("href", "/eventupdateform.action?eventId="+id+"&lGroup_id=${lGroup_id}");
   };
	
</script>


</head>
<body>
<c:import url="../Menu.jsp"></c:import>
	<!-- 상단메뉴 -->
	<div>
		<c:import url="groupPageTopMenu.jsp"></c:import>
	</div>
	<!-- 상단메뉴 end -->
	<div class='container' style="padding: 20px;">

		<!-- 메인 메뉴 -->
		<div class='span8 main w3-row'
			style="border: 2px white solid; width: 1130px; background-color: white;">
			
			<div class="main-left"
				style="border-right: 2px solid #ccc; width: 100%; float: left; padding: 2%;">
				<div class="bottomLine" style="width: 100%; height: 250px;">
					<div id="eventImage" style="float: left; width:25%; height:100%; padding: 2%;">
						<img src="${eventInfo.event_url}" style="width: 100%; height: 100%;">
					</div>
					<div style="float: left; width:75%; height:100%; padding: 2%;">
						<div class="bottomLine" style="width: 100%; height: 40%; padding: 1%;">
							<div style="width: 80%; height: 100%; float:left; padding-left: 2%;">
								<p id="eventTitle" style="font-size: 38px;"><strong>${eventInfo.event_name}</strong></p>
							</div>
							<c:if test="${keynumber != null }">
								<div style="width: 20%; height: 100%; float:left; text-align: right;">
									<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"  style="color: blue; font-size: 15px; text-align: right;"onclick="reportPopup();">신고</span>
								</div>
							</c:if>
						</div>
						<div class="" style="width: 100%; height: 20%; padding: 2%;  position: static;">
							<div style="width: 10%; height: 100%; float: left;">
								
								<p id="eventDate" style="font-size: 23px; text-align: right;">
									<span class="glyphicon glyphicon-calendar" aria-hidden="true" style=""></span>
								</p>
							</div>
							<div style="width: 30%; height: 100%; float: left;">
								
								<p id="eventDate" style="font-size: 23px; text-align: center;">
									  ${eventInfo.event_ymd}
								</p>
							</div>
							<div style="width: 10%; height: 100%; float: left;"></div>
							
							<div style="width: 50%; height: 100%; float: left; text-align: center;">
								
								<p id="eventLocation" style="float: left; font-size: 23px; text-align: left;">
						
									<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
									<!-- 위치에 대한 맵 import -->
									<c:import url="groupPageEventMap.jsp"></c:import>
								</p>
								
							</div>
							
						</div>
						<div class="" style="width: 100%; height: 20%; padding: 2%;  position: static;">
						
							<div style="width: 10%; height: 100%; float: left;">
								
								<p id="eventDate" style="font-size: 23px; text-align: right;">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
								</p>
							</div>
							<div style="width: 30%; height: 100%; float: left;">
								
								<p id="eventDate" style="font-size: 23px; text-align: center;">
									  ${eventInfo.event_hm}
								</p>
							</div>
							<div style="width: 10%; height: 100%; float: left;"></div>
							<div style="width: 50%; height: 100%; float: left; text-align: center;">
								
								<img src="images/attendance.PNG" style="height: 23px; float: left;">
								<p id="eventAttendance" style="float: left; font-size: 23px;">&nbsp;
									${eventInfo.attend_count}/${eventInfo.event_maxAttend} 참석</p>
								
							</div>
						</div>
						<div class="" style="width: 100%; height: 20%; padding: 2%;">
						
							<div style="width: 10%; height: 100%; float: left;">
								
								<p id="eventDate" style="font-size: 23px; text-align: right;">
									<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
								</p>
							</div>
							<div style="width: 30%; height: 100%; float: left;">
								
								<p id="eventDate" style="font-size: 23px; text-align: center;">
									  ${eventInfo.public_eveName}
								</p>
							</div>
							<div style="width: 10%; height: 100%; float: left;"></div>
							<div style="width: 50%; height: 100%; float: left; text-align: center;">
								
								
							</div>
						</div>
					</div>
				</div>
				<div class="" style="width: 100%; padding-top: 3%;">
					
					<div style="width: 80%; float: left; padding: 2%;">
						<div id="eventDescription" style="min-height: 700px;">${eventInfo.event_info}</div>
						<br>
						<div>
							<c:import url="../comment.jsp"></c:import>
						</div>
					</div>
					
					<div class="" style="width: 20%; float: left; border-left: 1px solid #d5d5d5; padding: 1%;">
					<div class="container bottomLine" style="width: 100%;">
                     <c:if test="${!(attendId == null && eventUsed == 0) && bgCheck != 1}">
                        <button style="width: 100%; margin-top: 5%; margin-bottom: 5%; display: ${attendId == null || attendId == 1 ? 'inline' : 'none'};" class="btn btn-primary ${eventUsed == 0 ? '' : 'attendBtn'}" id="attendBtn1" value="${attendId == null ? '1' : ''}" ${eventUsed == 0 ? "disabled" : ""}>참석</button>
                        <button style="width: 100%; margin-top: 5%; margin-bottom: 5%; display: ${attendId == null || attendId == 2 ? 'inline' : 'none'};" class="btn btn-success ${eventUsed == 0 ? '' : 'attendBtn'}" id="attendBtn2" value="${attendId == null ? '2' : ''}" ${eventUsed == 0 ? "disabled" : ""}>관심있음</button>
                        <button style="width: 100%; margin-top: 5%; margin-bottom: 5%; display: ${attendId == null || attendId == 3 ? 'inline' : 'none'};" class="btn btn-danger  ${eventUsed == 0 ? '' : 'attendBtn'}" id="attendBtn3" value="${attendId == null ? '3' : ''}" ${eventUsed == 0 ? "disabled" : ""}>참석안함</button>
                     </c:if>
                  </div>
					
					
					
						<c:if test="${eventInfo.public_gender == 1 || (eventInfo.public_gender == 2 && groupPower != 0) || (eventInfo.public_gender == 3 && (groupPower == 1 || groupPower == 2 || groupPower == 3))}">
				
							<div>
								<p>
									<strong>성비</strong>
								</p>
								<!-- 성비 바  -->
								<div class="progress">
									<div class="progress-bar progress-bar-danger" role="progressbar"
										aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
										style="width: ${women}%">여${women}%</div>
									<div class="progress-bar progress-bar-info" role="progressbar"
										aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"
										style="width: ${men}%; float: right;">남${men}%</div>
				
								</div>
							</div>
						</c:if>
						<c:if test="${eventInfo.public_age == 1 || (eventInfo.public_age == 2 && groupPower != 0) || (eventInfo.public_age == 3 && (groupPower == 1 || groupPower == 2 || groupPower == 3))}">
						<div>
						<!-- 나이별 그래프 시작------------------>
						<p>
							<strong>연령대</strong>
						</p>
						<div id="Nwagon"></div>
						<script>
							var options = {
								'dataset' : {
									title : 'Web accessibility status',
									values : [ 
										parseInt("${age10}")
										, parseInt("${age20}")
										, parseInt("${age30}")
										, parseInt("${age40}")
										],
									colorset : [ '#2EB400', '#2BC8C9', "#666666",
											'#f09a93' ],
									fields : [ '~10s', '20s', '30s', '40s~' ],
								},
								'donut_width' : 40,
								'core_circle_radius' : 0,
								'chartDiv' : 'Nwagon',
								'chartType' : 'pie',
								'chartSize' : {
									width : 190,
									height : 120
								}
							};
							Nwagon.chart(options);
						</script>
						<!----------------- 나이별 그래프 끝 -->
						</div>
						</c:if>
						<c:if test="${eventInfo.public_attendL == 1 || (eventInfo.public_attendL == 2 && groupPower != 0) || (eventInfo.public_attendL == 3 && (groupPower == 1 || groupPower == 2 || groupPower == 3))}">
							<hr>
							
							<div>
							<!-- 참석자 리스트  -->
							<p>
								<strong>참석자 리스트</strong>
							</p>
							<div id="attendanceList">
								<!-- 팝오버 띄어주기 위한 스크립트-->
								<script type="text/javascript">
									$(function()
									{						
										$('[data-toggle="popover"]').popover();						
									})
								</script>
								<!--팝오버 띄어주기 위한 스크립트 (끝)-->
								<div class="container" style="padding: 0px;">
									<c:forEach var="attend" items="${yesAttends}">
										<div>
											<button id="${attend.member_name}" class="memberBtn" value="${attend.lMember_id}" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
									data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
									style="border: none; background-color: white;"><img src="${attend.member_imageUrl}" class="img-circle" alt="Cinque Terre"
									width="70" height="70" style="padding: 5px;">${attend.member_name}</button>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- 참석자 리스트 (끝)-->
							<!-- 불참석자 리스트  -->
							<hr>
							<p>
								<strong>불참석자 리스트</strong>
							</p>
								<div id="attendanceList">
									<div class="container" style="padding: 0px;">
										<c:forEach var="attend" items="${noAttends}">
											<div>
												<button id="${attend.member_name}" class="memberBtn" value="${attend.lMember_id}" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
										data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
										style="border: none; background-color: white;"><img src="${attend.member_imageUrl}" class="img-circle" alt="Cinque Terre"
										width="70" height="70" style="padding: 5px;">${attend.member_name}</button>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- 불참석자 리스트 (끝) -->
								<hr>
							</div>
						</c:if>
						<div id="eventTag">
							<strong>태그목록</strong>
								<br>
								<br>
							<p style="color: green;">
								
								<c:forEach var="tag" items="${tags}">
									<span>${tag}</span>
								</c:forEach>
							</p>
						</div>
						<c:if test="${eventInfo.eventUsed == 1}">
								<button type="button" class="btn btn-primary" onclick="evupdate(${eventId})" >수정하기</button>
						</c:if>
						<c:if test="${ (groupPower == 1 || groupPower == 2) && acceptAlbum != null }">
							<button type="button" class="btn btn-info" style="float: right;" id="addAlbumBtn" value="${acceptAlbum}">사진첩 추가하기</button>
						</c:if>
					</div>
				</div>
					

					
					
	
					
					
	
					
					

				<br>
				
			</div>
			
			<div class="main-right"
				style="width: 20%; padding-left: 2%; float: left;">
					
			</div>
		</div>

	</div>

<!-- 
	<c:if test="${eventInfo.eventUsed == 1}">
		<hr>
		<div class="eventOpenCheck">
			<p id="eventOpen" style="color: #518eef;">
				<strong>이벤트 공개여부 설정</strong>
			</p>
			<a href=""><img src="images/allopen.PNG" style="height: 40px;"></a>전체공개&nbsp;
			<a href=""><img src="images/friendopen.PNG"
				style="height: 40px;"></a>그룹멤버공개&nbsp; <a href=""><img
				src="images/noopen.PNG" style="height: 40px;"></a>비공개(초대된 사람만) <br>
			<br>
		</div>
	</c:if>
 -->


	<!--하단바  -->
	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
	<!--하단바 끝-->
</body>
</html>