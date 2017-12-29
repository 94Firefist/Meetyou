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

/* 스위치 */
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: #ccc;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background: white;
	transition: .4s;
}

input:checked+.slider {
	background: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 3px #2196F3;
}

input:checked+.slider:before {
	transform: translateX(26px);
}

.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>
<script type="text/javascript">

$(document).ready(function()
{
	$("#autoCheck").click(function()
	{
		$(location).attr("href", "groupsingupchange.action?lGroup_id=${lGroup_id}");
	})
	
	$(".join").click(function()
	{
		if(confirm("수락하시겠습니까?")) {
			
			$(location).attr("href", "groupapprovesingup.action?lGroup_id=${lGroup_id}&targetId=" + $(this).val());
		}
		$(this).val()
	})
	$(".remove").click(function()
	{
		if(confirm("거절하시겠습니까?")) {
			
			$(location).attr("href", "groupremovesingup.action?lGroup_id=${lGroup_id}&targetId=" + $(this).val());
			
		}
	})
});


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

				<div class="w3-threequarter w3-container w3-row">
					<h3 style="font-weight: bold;">가입승인 관리</h3>
					<c:if test="${groupPower == 1}">
						<div class="w3-container">
							<h4 style="font-weight: bold; float: left;">자동 승인</h4>
							<div>
								<label class="switch"> 
									<input type="checkbox" ${groupInfo.grauto_accept == 1 ? "checked" : ""}> 
									<span class="slider round" id="autoCheck"></span>
								</label>
							</div>
						</div>
					</c:if>
					<c:forEach var="member" items="${groupMember}">
					<div style="width: 100%; height: 50px;">
						<div style="width: 30%; float: left;">

							<div style="float: left;">
								<img src="${member.member_imageUrl}" width="70" height="70" style="padding: 5px;" class="img-circle">
							</div>
							<div style="margin-top: 5%;">${member.member_name}</div>
							<div>
								<span style="font-size: 12px;">${member.grjoin_day}</span>
							</div>

						</div>

						<div style="float: left; margin-top: 2%; margin-left: 20%;">
							<span class="glyphicon glyphicon-user" style="font-size: 40px;"></span>
						</div>
						<div style="float: left; margin-top: 3%; margin-left: 1%;">
							<span style="">${member.member_gender eq F ? "여" : "남"} ${member.member_age}</span>
						</div>
						<!-- x -->
						<!-- v -->
						<div style="float: right; float: right; margin-top: 1%">
							<button class="btn btn-link remove" value="${member.lmember_id}">
								<span class="glyphicon glyphicon-remove"
									style="font-size: 30px; color: red;"></span>
							</button>
							<button class="btn btn-link join" value="${member.lmember_id}">
								<span class="glyphicon glyphicon-ok"
									style="font-size: 30px; color: green;"></span>
							</button>
						</div>

					</div>
					<hr>
					</c:forEach>
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