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
<title>그룹회원</title>

<!-- 기본 CSS import -->
<c:import url="../import/head.jsp"></c:import>

</head>
<body>
<c:import url="../Menu.jsp"></c:import>
	<!-- 상단메뉴 -->
	<div>
		<c:import url="groupPageTopMenu.jsp"></c:import>
	</div>
	<!-- 상단메뉴 end -->
	<div class='container' style="padding: 20px;">
		<div id='content' class='row-fluid'>
			<!-- 메인 메뉴 -->
			<div class='span8 main w3-row'
				style="border: 2px white solid; padding: 20px; width: 1130px; background-color: white;">

				<div class="w3-container">
					<h3 style="font-weight: bold; color: orange">그룹 소개</h3>
					
					<div style="margin: 20%; margin-top: 2%; height: 400px; margin-bottom: 0;">
						<img alt="" src="${groupInfo.group_imageUrl}" style="width: 100%; height: 100%;">
					</div>
					
					<div style="text-align: center; margin-top: 0; padding-right: 15%; padding-left: 15%;">
						<h3>${groupInfo.group_name}</h3>
						<p>${groupInfo.group_info}</p>
					
					</div>
				</div>
					
			</div>
		</div>
	</div>



	<!--하단바  -->
	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
	<!--하단바 끝-->
</body>
</html>