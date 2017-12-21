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
<title>메뉴</title>
<%-- <link rel="stylesheet" href="<%=cp %>/css/bootstrap.min.css"> --%>
<%-- <link rel="stylesheet" href="<%=cp %>/css/style.css"> --%>
<link href="http://bootstrapk.com/examples/sticky-footer-navbar/sticky-footer-navbar.css" rel="stylesheet">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->



</head>
<body>
	
	<footer class="footer">	
	
	<div class="container">
	
	<div class="bottombar">
		<div class="bottom">
			<ul>
				<li style="z-index: 999">
					<a href="siteintroduce.action" target="_self" class="gnb_1da">사이트 소개</a>
				</li>
				<li>
					<a>|</a>
				</li>
				<li style="z-index: 998">
					<a href="agreementintroduce.action" target="_self"class="gnb_1da">이용약관</a>
				</li>
				<li>
					<a class="hidden-xs">|</a>
				</li>
				<li class="hidden-xs" style="z-index: 997">
					<a href="noticeintroduce.action" target="_self" class="gnb_1da">공지사항</a>
				</li>
				<li>
					<a class="hidden-xs">|</a>
				</li>
				<li class="hidden-xs" style="z-index: 996">
					<a href="faqintroduce.action" target="_self" class="gnb_1da">Q&A</a>
				</li>
			</ul>
		</div>
	</div>
	</div>
	</footer>
	
	
</body>
</html>