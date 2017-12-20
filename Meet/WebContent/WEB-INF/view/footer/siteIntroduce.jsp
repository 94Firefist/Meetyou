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

<title>Page with left and right sidebar - Bootsnipp.com</title>
<link rel="stylesheet" href="<%=cp%>/css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
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
					<li style="background-color: #EEEEEE;"><a href="">사이트소개</a></li>
					<li><a href='/agreementintroduce.action'>이용약관</a></li>
					<li><a href='/noticeintroduce.action'>공지사항</a></li>
					<li><a href='/faqintroduce.action'>FAQ ＆ 문의사항</a></li>
				</ul>
			</div>
			<div class='span8 main'>
				<h2>사이트소개</h2>
				<img src="images/introduce.PNG" />
				
				<c:forEach var="content" items="${siteInfoContent }">
					${content.content }
				</c:forEach>
				
				<!-- 
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
					diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
					erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci
					tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
					consequat. Duis autem vel eum iriure dolor in hendrerit in
					vulputate velit esse molestie consequat, vel illum dolore eu
					feugiat nulla facilisis at vero eros et accumsan et iusto odio
					dignissim qui blandit praesent luptatum zzril delenit augue duis
					dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis
					eleifend option congue nihil imperdiet doming id quod mazim
					placerat facer possim assum.
				<p>
				<p>Typi non habent claritatem insitam; est usus legentis in iis
					qui facit eorum claritatem. Investigationes demonstraverunt
					lectores legere me lius quod ii legunt saepius. Claritas est etiam
					processus dynamicus, qui sequitur mutationem consuetudium lectorum.
					Mirum est notare quam littera gothica, quam nunc putamus parum
					claram, anteposuerit litterarum formas humanitatis per seacula
					quarta decima et quinta decima. Eodem modo typi, qui nunc nobis
					videntur parum clari, fiant sollemnes in futurum.</p>
				 -->	
				
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