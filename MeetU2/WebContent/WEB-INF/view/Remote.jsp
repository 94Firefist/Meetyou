<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remote.jsp</title>
<style type="text/css">
.remote .h_area 
{
	padding: 8px 0;
	background:
		no-repeat;
	border-bottom: 1px solid silver;
	background: #ffffff; /* Old browsers */
	background: -moz-linear-gradient(top, #ffffff 0%, #e5e5e5 100%); /* FF3.6-15 */
	background: -webkit-linear-gradient(top, #ffffff 0%,#e5e5e5 100%); /* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(to bottom, #ffffff 0%,#e5e5e5 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#e5e5e5',GradientType=0 ); /* IE6-9 */
}
.remote
{
	display: none;
	position: relative;
	width: 119px;
	background:
		no-repeat 0 100%;
	text-align: center;
	border: 1px solid silver;
}

.cro, .cro:hover, .cro:active, .cro:link, .cro:visited
{
	text-decoration: none;
	color: black;
	font-size: 13px;
}

.remote_area .remote .btn_clse {
    overflow: hidden;
    position: absolute;
    top: 0;
    right: 0;
    width: 10px;
    height: 9px;
    padding: 10px;
    background-position: -35px 10px;
    text-indent: -999px;
}

.h_area .h_a
{
    display: inline-block;
    overflow: hidden;
    position : absolute;
    top: 0;
    right: 0px;
    text-decoration: none;
    background: url(<%=cp%>/images/close.png) no-repeat;
}
</style>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#comicRemocon").draggable();
	});

	function btn_close()
	{
		$("#comicRemocon").attr('style', "display:none;");
	}
</script>
</head>
<body>
	<div id="comicRemocon" class="_remoteControl remote"
		style="display: block; position: fixed; top: 451px; left: 1502px; z-index: 150; cursor: move;">

		<div class="h_area">
			<strong>리모콘</strong>
			<a class="h_a" href="#" onclick="btn_close()" title="닫기">&nbsp;&nbsp;&nbsp;</a>
		</div>
		
		<div class="remote_cont">
			<button type="button" style="width: 100%; background-color: red;
			background: #f3c5bd; /* Old browsers */
			background: -moz-linear-gradient(top, #f3c5bd 0%, #e86c57 50%, #ea2803 51%, #ff6600 75%, #c72200 100%); /* FF3.6-15 */
			background: -webkit-linear-gradient(top, #f3c5bd 0%,#e86c57 50%,#ea2803 51%,#ff6600 75%,#c72200 100%); /* Chrome10-25,Safari5.1-6 */
			background: linear-gradient(to bottom, #f3c5bd 0%,#e86c57 50%,#ea2803 51%,#ff6600 75%,#c72200 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
			filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f3c5bd', endColorstr='#c72200',GradientType=0 ">
			참여해보세요</button>
			
			<div class="h_area">
				<a href="#" class="cro">맨위로</a>
				<a href="#" class="cro">아래로</a>
				<a href="#" class="cro">목록</a>
			</div>
		</div>
		
	</div>
</body>
</html>