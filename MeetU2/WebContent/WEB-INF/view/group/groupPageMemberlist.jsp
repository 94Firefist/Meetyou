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
<title>그룹회원</title>

<style type="text/css">
.gLeft>li {
	color: gray;
	font-size: 20px;
	font-family: fantasy;
	font-weight: bold;
	line-height: 2;
}

.gLeftS {
	color: blue;
}

.w3-row {
	margin-top: 1%;
	margin-bottom: 1.5%;
	padding: 0.5%;
	border-top: #DCDCDC solid 2px;
}


</style>

<link rel="stylesheet" href="<%=cp%>/css/style.css">
<!-- jQuery -->
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 부트스트랩 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 나눔쏘스 -->
<link rel="stylesheet" href="<%=cp %>/css/Nwagon.css" type="text/css">
<script src="<%=cp %>/js/Nwagon.js"></script>

</head>
<body>
<c:import url="../Menu.jsp"></c:import>
	<!-- 상단메뉴 -->
	<div>
		<c:import url="groupPageTopMenu.jsp"></c:import>
	</div>
	<!-- 상단메뉴 end -->
	<div class='container' style="padding: 20px;">
		<div id='content' class='row-fluid'>
			<!-- 메인 메뉴 -->
			<div class='span8 main w3-row'
				style="border: 2px white solid; padding: 20px; width: 1130px; background-color: white;">

				<div class="w3-threequarter w3-container">
					<div>
						<h3 style="font-weight: bold; color: orange">그룹 멤버리스트</h3>
					</div>

					<div class="w3-row" style="padding: 2%;">
						<h4 style="font-weight: bold;">그룹장</h4>
						<div class="w3-container">
							<c:forEach var="groupMember" items="${groupMaster}">
								<div class="w3-half">

											<button id="${groupMember.member_name}" class="memberBtn" value="${groupMember.lmember_id}" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
											data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
											style="border: none; background-color: white;"><img src="${groupMember.member_imageUrl}" class="img-circle" alt="Cinque Terre"
											width="70" height="70" style="padding: 5px;">${groupMember.member_name}</button>

								</div>
							</c:forEach>
						</div>
					</div>


					<div class="w3-row" style="padding: 2%;">
						<h4 style="font-weight: bold;">운영진</h4>
						<div class="w3-container">
							<c:forEach var="groupMember" items="${groupAdmins}">

											<button id="${groupMember.member_name}" class="memberBtn" value="${groupMember.lmember_id}" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
											data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
											style="border: none; background-color: white;"><img src="${groupMember.member_imageUrl}" class="img-circle" alt="Cinque Terre"
											width="70" height="70" style="padding: 5px;">${groupMember.member_name}</button>
							</c:forEach>
						</div>
					</div>


					<div class="w3-row" style="padding: 2%;">
						<h4 style="font-weight: bold;">멤버</h4>
						<div class="w3-container">
							<c:forEach var="groupMember" items="${groupMembers}">

											<button id="${groupMember.member_name}" class="memberBtn" value="${groupMember.lmember_id}" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
											data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
											style="border: none; background-color: white;"><img src="${groupMember.member_imageUrl}" class="img-circle" alt="Cinque Terre"
											width="70" height="70" style="padding: 5px;">${groupMember.member_name}</button>

							</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>



	<!--하단바  -->
	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
	<!--하단바 끝-->
</body>
</html>