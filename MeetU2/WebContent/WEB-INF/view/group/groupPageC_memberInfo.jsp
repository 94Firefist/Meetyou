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



<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


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
</style>

<script type="text/javascript">
	$(document).ready(function()
	{
		$(".downgradeMember").click(function()
		{
			if(confirm("등급을 내리시겠습니까?"))
			{
				
				$(location).attr("href", "/groupdowngrademember.action?lGroup_id=${lGroup_id}&targetId=" + $(this).val());
			}
		});
		$(".upgradeMember").click(function()
		{
			if(confirm("등급을 올리시겠습니까?"))
			{
				$(location).attr("href", "/groupupgrademember.action?lGroup_id=${lGroup_id}&targetId=" + $(this).val());
			}
		});
		$(".removeMember").click(function()
		{
			if(confirm("회원을 추방시키겠습니까?"))
			{
				$(location).attr("href", "/groupgetoutmember.action?lGroup_id=${lGroup_id}&targetId=" + $(this).val());
			}
		});
		$(".switchMaster").click(function()
		{
			if(confirm("그룹장을 위임합니까?"))
			{
				$(location).attr("href", "/groupswitchmaster.action?lGroup_id=${lGroup_id}&targetId=" + $(this).val());
			}		
		});
	})
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
		<div id='content' class='row-fluid'>
			<!-- 메인 메뉴 -->
			<div class='span8 main w3-row'
				style="border: 2px white solid; padding: 20px; width: 1130px; background-color: white;">

				<div class="w3-quarter"
					style="border-right: 2px solid #ccc; width: 20%; height: 500px; text-align: center;">
					<ul class="gLeft">
						<c:if test="${groupPower == 1}">
		                	<li><a href="/groupInfo.action?lGroup_id=${lGroup_id}">그룹 정보 수정</a></li>
		                </c:if>
						<li><a href="/groupmemberInfo.action?lGroup_id=${lGroup_id}">멤버 관리</a></li>
						<li><a href="/groupsingupInfo.action?lGroup_id=${lGroup_id}">가입승인</a></li>
						<li><a href="/groupblackListInfo.action?lGroup_id=${lGroup_id}">블랙리스트 관리</a></li>
						<c:if test="${groupPower == 1}">
							<li><a href="/groupopenInfo.action?lGroup_id=${lGroup_id}">공개 범위 설정</a></li>
						</c:if>
					</ul>
				</div>

				<div class="w3-threequarter w3-container">
					<div>
						<h3 style="font-weight: bold;">멤버 관리</h3>
						
						<hr>
					</div>
					
					<c:if test="${groupPower == 1}">
					<div class="w3-row">
						<h4 style="font-weight: bold;">운영진</h4>
						<c:forEach var="groupMember" items="${groupAdmins}">
							<div class="w3-half">
								<div style="float: left;">
								<button id="${groupMember.member_name}" class="memberBtn" value="${groupMember.lmember_id}" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
								data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
								style="border: none; background-color: white;"><img src="${groupMember.member_imageUrl}" class="img-circle" alt="Cinque Terre"
								width="70" height="70" style="padding: 5px; ">${groupMember.member_name}</button>
								</div>
								<button class="btn btn-link downgradeMember" style="float: left; margin-top: 2%;" value="${groupMember.lmember_id}">
									<span class="glyphicon glyphicon-chevron-down" style="font-size: 30px;"></span>
								</button>
								<!-- x -->
								<button class="btn btn-link removeMember" style="float: left; margin-top: 2%;" value="${groupMember.lmember_id}">
									<span class="glyphicon glyphicon-remove" style="font-size: 30px; color: red;"></span>
								</button>
								<!-- 양도 -->
								<button type="button" class="btn btn-info switchMaster" style="float: left; margin-top: 3%;" value="${groupMember.lmember_id}">그룹 양도</button>
							</div>
						</c:forEach>
					</div>
					<hr>
					</c:if>


					<div class="w3-row">
						<h4 style="font-weight: bold;">멤버</h4>
						<c:forEach var="groupMember" items="${groupMembers}">
							<div class="w3-half">
								
									<div style="float: left;">
									<button id="${groupMember.member_name}" class="memberBtn" value="${groupMember.lmember_id}" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
									data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
									style="border: none; background-color: white;"><img src="${groupMember.member_imageUrl}" class="img-circle" alt="Cinque Terre"
									width="70" height="70" style="padding: 5px;">${groupMember.member_name}</button>
									</div>
								
								<c:if test="${groupPower == 1}">
									<button class="btn btn-link upgradeMember" style="float: left; margin-top: 2%;" value="${groupMember.lmember_id}">
										<span class="glyphicon glyphicon-chevron-up" style="font-size: 30px;"></span>
									</button>
								</c:if>
								<!-- x -->
								<button class="btn btn-link removeMember" style="float: left; margin-top: 2%;" value="${groupMember.lmember_id}">
									<span class="glyphicon glyphicon-remove" style="font-size: 30px; color: red;"></span>
								</button>
							</div>
						</c:forEach>
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