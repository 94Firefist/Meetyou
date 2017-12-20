<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function()
	{
		$(".ilsuok").hover(function()
		{
			$(this).children(".ilsuokSpan").css("display", "");
			/* $("td .ilsuokSpan").css("display", ""); */
			
		}, function()
		{
			$(".ilsuokSpan").css("display", "none");
		});
	});
</script>

<style>
/* 일수가 있을 경우 백그라운드 컬러를 핑크로 */
.ilsuok {
	background-color:  #ffe6e6;
	opacity: 0.9;
}

th{ width: 20px;
	text-align: center;}

td {
	width: 20px;
	text-align: center;
}

#year {
	width: 70px;
}

#month {
	width: 60px;
}
</style>
<script>
	function formCheck(obj)
	{
		obj.submit();
	}
</script>
</head>
<body>

	<form action="" method="get">
		<!--폼에 액션을 따로 걸어주지 않으면 자신의 페이지에 데이터를 전송하고 자신의 요청한다. -->
		<div id="calender">

			<select id="year" name="year" onchange="formCheck(this.form)">${yOptions }</select>년
			<!--onchange 선택이 바뀔 때마다 함수호출  -->
			
			<select id="month" name="month" onchange="formCheck(this.form)">${mOptions }</select>월
			<table id="myTable" style="margin-left: 10px;">
				${myTable}
			</table>

		</div>

		<div></div>

	</form>

</body>
</html>