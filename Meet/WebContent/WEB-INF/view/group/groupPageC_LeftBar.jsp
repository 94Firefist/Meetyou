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
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 타이틀 -->
<title>왼쪽바</title>
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

</head>
<script type="text/javascript">

/* 친구선택하기 버튼을 눌렀을 때 작동되는 스크립트*/
$(function()
{
	$(".hostpick").click(function()
	{
		
		alert("쪽지보내기ok?");
		
		showPopup($("#friendId").val());

	})
})

function showPopup(id)
{
	window
			.open(
					"/messagesendform.action?friendId="+id,
					"a",
					"width=520, height=520, left=1060, top=50, location=no, directories=no, status=no");
}

</script>

<body>
	<div id='content' class='container-fluid'
		style="width: 250px; height: 750px; border: 1px solid white; float: left; padding: 0px; background-color: white;">
		
		<ul class="gLeft">
			<c:if test="${groupPower == 1}">
               	<li><a href="/groupInfo.action?groupId=${groupId}">그룹 정보 수정</a></li>
               </c:if>
			<li><a href="/groupmemberInfo.action?groupId=${groupId}">그룹·멤버 관리</a></li>
			<li><a href="/groupsingupInfo.action?groupId=${groupId}">가입승인</a></li>
			<li><a href="/groupblackListInfo.action?groupId=${groupId}">블랙리스트 관리</a></li>
			<c:if test="${groupPower == 1}">
				<li><a href="/groupopenInfo.action?groupId=${groupId}">공개 범위 설정</a></li>
			</c:if>
		</ul>

	</div>
</body>
</html>