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
<title>카운트다운</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>


<script>
	cnt = 30; //몇 초?
	function countdown()
	{
		cnt--;
		if (cnt == 0) //0초일때는 다시 입력하게 세션을 끊는다거나 다른 조치가 필요~!!
			document.getElementById('dididi').innerHTML = "<p style='color:red;'>인증번호를 다시 전송하세요.</p>"
		else if (cnt > 0)
		{
			document.getElementById('dididi').innerHTML = cnt + "초 안에 입력";
			setTimeout("countdown()", 1000);
		}
	}

	$(function()
	{
		cnt--;
		if (cnt == 0) //0초일때는 다시 입력하게 세션을 끊는다거나 다른 조치가 필요~!!
			document.getElementById('dididi').innerHTML = "<p style='color:red;'>인증번호를 다시 전송하세요.</p>"
		else if (cnt > 0)
		{
			document.getElementById('dididi').innerHTML = cnt + "초 안에 입력";
			setTimeout("countdown()", 1000);
		}
	});
</script>



<body>

	<div id="dididi"></div>

</body>
</html>