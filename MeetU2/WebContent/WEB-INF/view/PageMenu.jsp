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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">

	.menu
	{
		padding-top: 5px;
	}

</style>
</head>
<body>
	<div style="border: 2px solid black; width: 1130px; height: 184px; margin: 0px auto;">
		<div style="width: 1130px; height: 100px;">
			<h1 style="margin: 40px 100px;">이상아 홈페이지</h1>
		</div>
		<div style="border-top:1px solid gray;width: 1130px; height: 40px;">
			&nbsp;&nbsp;&nbsp;<a class="menu" href="#" role="button">홈</a>&nbsp;&nbsp;&nbsp;
			<a class="menu" href="personalPageIntroducemyself.jsp" role="button">자기소개</a>&nbsp;&nbsp;&nbsp;
			<a class="menu" href="#" role="button">타임라인</a>&nbsp;&nbsp;&nbsp;
			<a class="menu" href="personalPageGrouplist.jsp" role="button">그룹목록</a>&nbsp;&nbsp;&nbsp;
			<a class="menu" href="personalPageFriendlist.jsp" role="button">친구목록</a>
		</div>
	</div>
</body>
</html>