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
<link rel="stylesheet" href="<%=cp%>/css/style.css">
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<style type="text/css">
</style>
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	window.alert = function()
	{
	};
	var defaultCSS = document.getElementById('bootstrap-css');
	function changeCSS(css)
	{
		if (css)
			$('head > link')
					.filter(':first')
					.replaceWith(
							'<link rel="stylesheet" href="'+ css +'" type="text/css" />');
		else
			$('head > link').filter(':first').replaceWith(defaultCSS);
	}
	$(document).ready(function()
	{
		var iframe_height = parseInt($('html').height());
		window.parent.postMessage(iframe_height, 'https://bootsnipp.com');
	});
</script>
</head>
<body>
<head>
<title>Twitter Bootstrap Tutorial - A responsive layout tutorial</title>
</head>
<body>
	<c:import url="../Menu.jsp"></c:import>
	<div class='container'>
		<div id='content' class='row-fluid'>
			<div class='span2 sidebar'>
				<ul class="nav nav-tabs nav-stacked">
					<li><a href="/siteintroduce.action">사이트소개</a></li>
					<li><a href='/agreementintroduce.action'>이용약관</a></li>
					<li style="background-color: #EEEEEE;"><a href="">공지사항</a></li>
					<li><a href='/faqintroduce.action'>FAQ ＆ 문의사항</a></li>
				</ul>
			</div>
			<div class='span8 main'>
				<h2>공지사항</h2>
				<table class="table table-bordered">
					<tr class="info">
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					
					
					<c:forEach var="notice" items="${noticeAll }">
						<tr>
							<td>${notice.no }</td>
							<td><a href="/noticeintroducecomfirm.action?noticeId=${notice.no }">${notice.title }</a></td>
							<td>${notice.noticeDate }</td>
							<td>${notice.count }</td>
						</tr>
					</c:forEach>
					
					<!-- 
					<tr>
						<td>2</td>
						<td><a href="/noticeintroducecomfirm.action">미츄 서비스 점검</a></td>
						<td>2017-11-18</td>
						<td>38</td>
					</tr>
					<tr>
						<td>1</td>
						<td><a>미츄 오픈 기념 이벤트</a></td>
						<td>2017-11-17</td>
						<td>34</td>
					</tr>
					 -->
				</table>
			</div>
		</div>
	</div>





	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
</body>
<script type="text/javascript">
	
</script>
</body>
</html>