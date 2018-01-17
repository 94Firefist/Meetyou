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

<title>나의 소개페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<style type="text/css">
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://jqueryui.com/jquery-wp-content/themes/jqueryui.com/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-
ui.js"></script>
<script	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

<!-- 나눔쏘스 -->
<link rel="stylesheet" href="Nwagon/Nwagon.css" type="text/css">
<script src="Nwagon/Nwagon.js"></script>

<script type="text/javascript">

$(document).ready(function()
{
  	//전화번호 공개 
	if($("#telOpen").val()== 4)  // 비공개일 경우 무조건 안보임 
	{
		if($("#keynumber").val() != $("#ownernumber").val())
		{	
		   $("#tel").attr("style", "display: none");
		}  
	}
	else if($("#telOpen").val()== 3 && $("#friendChk").val() == 0)  //친구공개이고 친구가 아닐경우 안보임 
	{
		if($("#keynumber").val() != $("#ownernumber").val())
		{
		  $("#tel").attr("style", "display: none");
		}
	}
	else if($("#telOpen").val()== 2 && $("#keynumber").val() == null )  //회원공개이고 로그인키넘이 널인 경우 
	{
		if($("#keynumber").val() != $("#ownernumber").val())
		{
		 $("#tel").attr("style", "display: none");
		}
	}
	
  	//이메일 공개
	if($("#emailOpen").val() == 4)  //비공개
	{
		if($("#keynumber").val() != $("#ownernumber").val())
		{
		 $("#email").attr("style", "display: none");
		}
	}
	else if($("#emailOpen").val() == 3 && $("#friendChk").val() == 0) //친구공개이고 친구 아닌 경우 
	{
		if($("#keynumber").val() != $("#ownernumber").val())
		{
		  $("#email").attr("style", "display: none");
		}
	}
	else if($("emailOpen").val() ==2 && $("#keynumber").val() == null) //회원공개이고 로그인키넘이 널인경우
	{
		if($("#keynumber").val() != $("#ownernumber").val())
		{
		 $("#email").attr("style", "display: none");
		}	
	}
  	
  	//수정 가능 여부 
  	if($("#keynumber").val() == $("#ownernumber").val())
  	{
  		
  		$("#modify").attr("style", "display: ");
  	}	
	
});



</script>

</head>
<body>
<head>
<title>Twitter Bootstrap Tutorial - A responsive layout tutorial</title>
</head>
<body>
	<!--로그인바  -->
	<div>
		<c:import url="../Menu.jsp"></c:import>
	</div>
	
	<!-- 상단메뉴 -->
	<div>
		<c:import url="personalPageTopMenu.jsp"></c:import>
	</div>
	<!-- 상단메뉴 end -->
	<div class='container' style="padding: 20px; ">
		<div id='content' class='row-fluid'>
			<!-- 왼쪽 메뉴 -->
			<div>
    			<c:import url="personalLeftBar.jsp"></c:import>
    		</div>
			<!-- 왼쪽 메뉴 끝-->
			
			<!-- 메인 메뉴 -->
			<div class='span8 main' style="border: 2px white solid; padding: 20px; width: 945px; background-color: white; margin-left:15px;">
				<div id="title" style="color: #ef9534;"><strong>기본정보</strong></div><br>
				<div id="basicInfo">
					<!-- <img src="images/introducemyself.PNG"><br><br> -->
					<div id="name" style="font-size: 20px;">이름 : ${userInfo.userName } </div>
					<div id="birth">생년월일 : ${userInfo.userBir }</div>
					<div id="place">관심지역 : 
						<c:forEach var="city" items="${userCityList }">
							${city.userCity }
						</c:forEach>
					</div>
					<div id="tel">연락처 : ${userInfo.userTel }</div>
					<div id="email">이메일 : ${userInfo.userEmail }</div>	
					
				</div>		
				
				<!--  친구 여부 -->
				<input type="hidden" id="friendChk" value="${friendcheck }">
				<!-- 전화번호 공개여부   -->
				<input type="hidden" id="telOpen" value="${hostpublic.telPublic }">
				<!-- 친구 리스트 공개 여부 -->
				<input type="hidden" id="fListOpen" value="${hostpublic.friendPublic }">
				<!-- 그룹 리스트 공개 여부 -->
				<input type="hidden" id="gListOpen" value="${hostpublic.groupPublic }">
				<!-- 이메일 공개 여부 -->
				<input type="hidden" id="emailOpen" value="${hostpublic.emailPublic }">
				<!-- 생년월일 공개 여부 -->		
				<input type="hidden" id="birthOpen" value="${hostpublic.birPublic }">			
				<!-- 회원인지 여부 판단 및 자긴 여부 판단하기 위해 로그인한 사람 번호 받음 -->
				<input type="hidden" id="keynumber" value="${keynumber }">
				<!-- 홈주인님의 번호 -->
				<input type="hidden" id="ownernumber" value="${userNumber }">
		
				<hr>
				<div id="title" style="color: #ef9534;"><strong>자기소개</strong></div><br>
				<div id="basicInfo">
					<p>${userInfo.userContent }</p>
					
					<!-- 수정하기 버튼은 일단 안보이게 해놓다가. keynumber랑 주인이랑 같으면..  -->
					<div style="text-align: center;" >
						<a href="/personalcontrol.action?userkey=${keynumber }"><button type="button" class="btn btn-info" id="modify" name="modify" style="display: none;">수정하기</button></a>
					</div>
					
				</div>
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