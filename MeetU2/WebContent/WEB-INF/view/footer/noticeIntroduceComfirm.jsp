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
<title>사이트소개</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

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
<body>
<head>
<title>FAQ ＆ 문의사항</title>
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
			
			
			
			
			
			
			<!-- 메인 메뉴 -->
			<div class='span8 main'>
				<h2>공지사항</h2>	
				<table class="table table-bordered">
					<tr style="background-color: skyblue;">
						<th colspan="3">${noticeList.title }</th>
					</tr>
					<tr>
						<td>${noticeList.adminId }</td>
						<td>${noticeList.noticeDate }</td>
						<td>신고하기 : <a><span
								class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span></a>
							</td>
					</tr>
					<tr>
						<td colspan="3">${noticeList.content }</td>
					</tr>
				</table>

		
				<form action="/noticeintroduce.action">
				<button type="submit" class="btn btn-default" >돌아가기</button>
				</form>


			</div>
			<!-- 메인 메뉴 end -->
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