<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!--부트스트랩  -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- 팝업 띄우기 위한 스크립트 -->
<script type="text/javascript">
	function showPopup()
	{
		window.open(
						"Report_popup_content.jsp",
						"a",
						"width=515 height=515, left=1060, top=50, location=no, directories=no, status=no,toolbar=no,scrollbars=no ");
	}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="#"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" style="color: blue;"onclick="showPopup();"><small>신고</small></span></a>
</body>
</html>