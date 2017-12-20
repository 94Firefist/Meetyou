<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="robots" content="noindex, nofollow">

<title>나의 친구리스트</title>
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
<link rel="stylesheet" href="Nwagon/Nwagon.css" type="text/css">
<script src="Nwagon/Nwagon.js"></script>

<script type="text/javascript">

	$(document).ready(function()
	{
		// 신청거절
		$(".btnSendNO").click(function()	
		{
			//alert( $(this).val() );
			location.href = "friendnosend.action?friendNo=" + $(this).val();
		});
		
		// 요청거절
		$(".btnReceiveNO").click(function()	
		{
			//alert( $(this).val() );
			location.href = "friendnoreceive.action?friendNo=" + $(this).val();
		});
		
		// 친구 추가(승낙)
		$(".btnFriendYes").click(function()	
		{
			//alert( $(this).val() );
			location.href = "friendadd.action?friendNo=" + $(this).val();
		});
		
		// 친구 삭제(절교)
		$(".btnFriendBye").click(function()	
		{
// 			alert( $(this).val() );
			location.href = "friendremove.action?friendNo=" + $(this).val();
		});
		
		// 블랙리스트 추가
		$(".btnBlackYes").click(function()	
		{
// 			alert( $(this).val() );
			location.href = "blackadd.action?friendNo=" + $(this).val();
		});
		
		// 블랙리스트 삭제
		$(".btnBlackNo").click(function()	
		{
// 			alert( $(this).val() );
			location.href = "blackremove.action?friendNo=" + $(this).val();
		});
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

		<!--중간 메뉴들(왼쪽 메인)  -->
		<div id='content' class='row-fluid'>
			<!-- 왼쪽 메뉴 -->
			<div>
				<c:import url="personalLeftBar.jsp"></c:import>
			</div>
			<!-- 왼쪽 메뉴 끝-->

			<!-- 메인메뉴 -->
			<div class='span8 main'
				style="border: 2px white solid; padding: 20px; width: 945px; background-color: white; margin-left: 15px;">
				<!-- 제목 -->
				<div id="title" style="color: #ef9534;">
					<strong>친구리스트</strong>
				</div>
				<br>

				<!-- 친구 리스트 -->
				<div id="friendlist">

					<!--검색기능  -->
					<!-- <div id="custom-search-input">
						<div class="col-md-8"></div>
						<div class="input-group col-md-4">
							<input type="text" class="search-query form-control"
								placeholder="Search" style="height: 33px;" /> <span
								class="input-group-btn">
								<button class="btn btn-danger " type="button">
									<span class=" glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div> -->
					<!--검색기능 end -->

					<!-- 대기중 친구리스트 -->
					<div id="notyetfriendlist">
						<div id="pp1">
							<!-- 요청 -->
							<c:if test="${friendReceive != null }" >
								<c:forEach var="receive" items="${friendReceive }">
									<button id="${receive.friendName }" class="memberBtn" value="${receive.friendNo }" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
											data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
											style="border: none; background-color: white;"><img src="${receive.friendPic }" class="img-circle" alt="Cinque Terre"
											width="70" height="70" style="padding: 5px;">${receive.friendName }</button>
									<button type="button" class="btn btn-primary btnFriendYes" value="${receive.friendNo }">친구승낙</button>
									<button type="button" class="btn btn-default btnReceiveNO" value="">요청삭제</button>
									<span style="font-size: 6px;">${receive.friendName }님이 친구신청을 하였습니다.</span>
								</c:forEach>
							</c:if>
							<!-- <img src="images/pp1.jpg" class="img-circle" alt="Cinque Terre"
								width="70" height="70" style="padding: 5px;"> <a href="">황광희</a>
							<button type="button" class="btn btn-primary">친구승낙</button>
							<button type="button" class="btn btn-default">요청삭제</button>
							<span style="font-size: 6px;">황광희님이 친구신청을 하였습니다.</span> -->
							
							
							
						</div>
						
							<!-- 신청 -->
							<c:if test="${friendSend != null }" >
								<c:forEach var="send" items="${friendSend }">
									<div id="pp2">
										<button id="${send.friendName }" class="memberBtn" value="${send.friendNo }" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
											data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
											style="border: none; background-color: white;"><img src="${send.friendPic }" class="img-circle" alt="Cinque Terre"
											width="70" height="70" style="padding: 5px;">${send.friendName }</button>
										<button type="button" class="btn btn-primary"
											style="width: 81.97px;">${send.sendState == '1' ? '대기중' : '친구거절' }</button>
										<button type="button" class="btn btn-default btnSendNO" value="${send.friendNo }">요청삭제</button>
										<span style="font-size: 6px;">${send.friendName }님에게 요청한 친구신청이 대기중입니다.</span>
									</div>					
								</c:forEach>
							</c:if>
							
							
							<!-- <img src="images/pp2.jpg" class="img-circle" alt="Cinque Terre"
								width="70" height="70" style="padding: 5px;"> <a href="">민동기</a>
							<button type="button" class="btn btn-primary"
								style="width: 81.97px;">대기중</button>
							<button type="button" class="btn btn-default">요청삭제</button>
							<span style="font-size: 6px;">민동기님에게 요청한 친구신청이 대기중입니다.</span> -->
							
						
					</div>
					<hr>
					<!-- 대기중 친구리스트 end -->
					<!-- 실제 친구리스트 -->
					
					
					<div id="notyetfriendlist">
						<c:if test="${friendList != null }" >
							<c:forEach var="friend" items="${friendList }">
									<div id="">
										<button id="${friend.friendName }" class="memberBtn" value="${friend.friendNo }" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
											data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
											style="border: none; background-color: white;"><img src="${friend.friendPic }" class="img-circle" alt="Cinque Terre"
											width="70" height="70" style="padding: 5px;">${friend.friendName }</button>
										<c:if test="${my == 1 }">
										<button type="button" class="btn btn-default btnFriendBye" value="${friend.friendNo }">친구삭제</button>
										<button type="button" class="btn btn-info btnBlackYes" value="${friend.friendId }">블랙리스트등록</button>
										</c:if>
									</div>
							</c:forEach>
						</c:if>
						
					</div>

					
					
					<!-- 
					<div id="notyetfriendlist">
						<div id="pp3">
							<img src="images/pp3.jpg" class="img-circle" alt="Cinque Terre"
								width="70" height="70" style="padding: 5px;"> <a href="">민지영</a>
							<button type="button" class="btn btn-default">친구삭제</button>
							<button type="button" class="btn btn-info">블랙리스트등록</button>
						</div>
						<div id="pp4">
							<img src="images/pp4.jpg" class="img-circle" alt="Cinque Terre"
								width="70" height="70" style="padding: 5px;"> <a href="">김민호</a>
							<button type="button" class="btn btn-default">친구삭제</button>
							<button type="button" class="btn btn-info">블랙리스트등록</button>
						</div>
						<div id="pp5">
							<img src="images/pp5.jpg" class="img-circle" alt="Cinque Terre"
								width="70" height="70" style="padding: 5px;"> <a href="">동그리</a>
							<button type="button" class="btn btn-default">친구삭제</button>
							<button type="button" class="btn btn-info">블랙리스트등록</button>
						</div>
					</div> 
					-->
					<hr>
					<!-- 실제 친구리스트 end -->
				</div>
				<!-- 친구 리스트 end-->
				
				
				<!-- 블랙리스트 -->
				<div id="title" style="color: #ef9534;">
					<strong>블랙리스트</strong>
				</div>
					
				<br>
				<p style="font-size: 7px;">블랙리스트 회원은 당신의 정보를 볼 수 없습니다.</p>
				
				<div id=blacklist>
				<c:if test="${blackList != null }" >
					<c:forEach var="black" items="${blackList }">				
							<img src="${black.blackPic }" class="img-circle" alt="Cinque Terre"
										width="70" height="70" style="padding: 5px;"><a href="">${black.blackName }</a>
							<button type="button" class="btn btn-info btnBlackNo" value="${black.blackId }" id="btnBlackNo" name="btnBlackNo">블랙리스트해제</button>
	
					</c:forEach>
				</c:if>
					
					
					<!-- <div>
						<img src="images/pp6.jpg" class="img-circle" alt="Cinque Terre"
									width="70" height="70" style="padding: 5px;"> 
						<a href="">김길중</a>
						<button type="button" class="btn btn-info">블랙리스트해제</button>
					</div> -->
				</div>
				<!-- 블랙리스트 end -->
			</div>
			<!-- 메인메뉴 end -->
			<hr>

			

			

		</div>
		<!--중간 메뉴들(왼쪽 메인)  -->

	</div>



	<!-- 하단바 -->
	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
	<!-- 하단바 end-->
</body>
<script type="text/javascript">
	
</script>
</body>
</html>