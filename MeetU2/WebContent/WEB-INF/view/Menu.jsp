<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<script type="text/javascript">

	// 로그인 버튼 클릭
	$(document).on("click", "#login", function()
	{
		/* $(".navi_wrap").append("<form id='loginform' method='post' action='loginform.action'><input type='hidden' name='page' value='"+location.href+"'/> </form>");
		$("#loginform").submit(); */
		$("#login").attr("href", "/loginform.action?page="+location.href);
	});
	
	// 로그아웃 버튼 클릭
	$(document).on("click", "#logout", function()
	{
		$("#logout").attr("href", "/logout.action?page="+location.href);
	});

	// 회원 가입 버튼 클릭
	$(document).on("click", "#signup", function()
	{
		$("#signup").attr("href", "/signup.action?page="+location.href);
	});
	
	function showPopup()
	{
	   window.open("/messagemyreceive.action", "a", "width=520, height=520, left=1060, top=50, location=no, directories=no, status=no");
	}
	
	function showPopup2(Object)
	{

		// JavaScript Object 는 값을 불러올 때 메소드 value 사용
		// JQuery Object 는 값을 불러올 때 메소드 val() 을 사용
		if("${keynumber}" !=null || "${keynumber}" != "")
			{
	  				window.open("/messagesendform.action?friendKey=" + Object.value,
	               "a",
	               "width=520, height=520, left=1060, top=50, location=no, directories=no, status=no");
			}
		else
		{
			$(location).attr("href", "/loginform.action?page="+location.href);
		}
	}
	
	$(document).ready(function()
	{
	   $(".memberBtn").click(function()
	   {
	      a = $(this).val();
	      b = $(this).attr("id");
	      $(".memberPage").attr("href", "/personalhome.action?userkey=" + a);
	   });
	   
	   
	   $('[data-toggle="popover"]').popover();  
	});
</script>
	<div class="header" style="background-color: #EEEEEE;">
		<!--logo start-->
		<div class="logo_wrap">
			<a href="/maingroup.action"> 
				<img alt="logo" src="<%=cp%>/images/meetU.png" style="height: 50px; width: 50px;">
			</a>
		</div>
		<!--logo end-->
		<!--nav start-->
		<div class="navi_wrap">
			<div class="navi">
				<ul class="uu">
				<c:choose>
					<%-- 관리자 Session 없음 --%>
					<c:when test="${sessionScope.admin==null}">
						<li class="dropdown hidden-xs" style="z-index: 999">
							<a href="" target="_self" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">MeetU 만들기 <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
			                    <li><a href="/groupform.action">그룹만들기</a></li>
			                    <li><a href="/eventform.action">이벤트 만들기</a></li>
		                  	</ul>
						</li>
						<li class="dropdown hidden-xs" style="z-index: 998">
							<a href="" target="_self" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">살펴보기 <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
			                    <li><a href="/maingroup.action">그룹별 보기</a></li>
			                    <li><a href="/mainevent.action">이벤트별 보기</a></li>
		                  	</ul>
						</li>
					</c:when>
				</c:choose>
					<%-- 로그인 Session 여부 확인 --%>
					<c:choose>
					
						<%-- 관리자 Session 있음 --%>
						<c:when test="${sessionScope.admin!=null}">
							<li class="dropdown" style="z-index: 997;">
								<img src = "${pic }" class="img-circle" alt="Cinque Terre"
                              width="45" height="45">
								<a href="" target="_self" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span style="color: skyblue">${sessionScope.name }님</span> <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu" style="left: -60%;">
				                    <li><a href="/grouplist.action">관리하기</a></li>
				                    <li><a href="/logout.action" id="logout">로그아웃</a></li>
			                  	</ul>
							</li>
						</c:when>
					
						<%-- 로그인 Session 있음 --%>
						<c:when test="${sessionScope.id!=null}">
							<li class="" style="z-index: 997">
								<a href="#" target="_self" class="gnb_1da"><button class="btn btn-primary" type="button" onclick="showPopup()">Messages</button></a>
							</li>
							<li class="dropdown" style="z-index: 996;">
								<img src = "${pic}" class="img-circle" alt="Cinque Terre" width="45" height="45">
								<a href="" target="_self" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span style="color: skyblue">${sessionScope.name }님</span> <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu" style="left: -60%;">
				                    <li><a href="/personalhome.action?userkey=${sessionScope.keynumber}">개인 페이지</a></li>
				                    <li><a href="/personalfriendlist.action?userkey=${sessionScope.keynumber}">친구목록</a></li>
				                    <li><a href="/personalgrouplist.action?userkey=${sessionScope.keynumber}">그룹목록</a></li>
				                    <li><a href="/logout.action" id="logout">로그아웃</a></li>
			                  	</ul>
							</li>
						</c:when>
						
						<%-- 로그인 Session 없음 --%>
						<c:otherwise>
							<li class="" style="z-index: 997">
								<a href="#" target="_self" class="gnb_1da" id="login">로그인</a>
							</li>
							
							<li class="" style="z-index: 996">
								<a href="#" id="signup" target="_self" class="gnb_1da">회원가입</a>
							</li>
						</c:otherwise>
						
					</c:choose>
					
				</ul>
			</div>
		</div>
	</div>