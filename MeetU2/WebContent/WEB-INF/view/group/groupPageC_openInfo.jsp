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

<style type="text/css">
.gLeft>li {
   color: gray;
   font-size: 20px;
   font-family: fantasy;
   font-weight: bold;
   line-height: 2;
}

.gLeftS {
   color: blue;
}
</style>


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

            <div class="w3-quarter"
               style="border-right: 2px solid #ccc; width: 20%; height: 500px; text-align: center;">
               <ul class="gLeft">
               		<c:if test="${groupPower == 1}">
	                	<li><a href="/groupInfo.action?lGroup_id=${lGroup_id}">그룹 정보 수정</a></li>
	                </c:if>
					<li><a href="/groupmemberInfo.action?lGroup_id=${lGroup_id}">멤버 관리</a></li>
					<li><a href="/groupsingupInfo.action?lGroup_id=${lGroup_id}">가입승인</a></li>
					<li><a href="/groupblackListInfo.action?lGroup_id=${lGroup_id}">블랙리스트 관리</a></li>
					<c:if test="${groupPower == 1}">
						<li><a href="/groupopenInfo.action?lGroup_id=${lGroup_id}">공개 범위 설정</a></li>
					</c:if>
               </ul>
            </div>

            <div class="w3-threequarter w3-container">
               <h3 style="font-weight: bold;">공개범위 설정</h3>
               <hr>
				
				<!--그룹관련 공개  -->
				<form action="groupoptionchange.action" method="post">
	               	<div style="border: 2px solid white;">
	               		<input type="hidden" id="lGroup_id" name="lGroup_id" value="${lGroup_id}">
	                  	<div id=groupOpen
	                     style="border: 2px solid white; margin-top: 1%; margin-left: 2%; width: 90%; height: 120%;">
							<p>
								<strong>그룹공개</strong>
							</p>
							
							<c:forEach var="option" items="${options}">
								<div class="radio">
									  <label>
									    <input type="radio" name="groupOpen" id="groupOpen${option.id}" value="${option.id}" ${option.id==groupInfo.public_gr ? "checked" : ""}>
									    ${option.name}
									  </label>
								</div>
							</c:forEach>
		                    
	                  	</div>
	                  
	                   	<div id=photoOpen
	                     style="border: 2px solid white; margin-top: 1%; margin-left: 2%; width: 90%; height: 120%;">
							<p>
								<strong>사진첩 공개</strong>
							</p>
							<c:forEach var="option" items="${options}">
							
								<div class="radio">
									  <label>
									    <input type="radio" name="photoOpen" id="photoOpen${option.id}" value="${option.id}" ${option.id==groupInfo.public_grA ? "checked" : ""}>
									    ${option.name}
									  </label>
								</div>
							</c:forEach>
	                  	</div>
	
	                   	<div id=memberListOpen style="border: 2px solid white; margin-top: 1%; margin-left: 2%; width: 90%; height: 120%;">
							<p>
								<strong>멤버리스트 공개</strong>
							</p>
							<c:forEach var="option" items="${options}">
								<div class="radio">
									  <label>
									    <input type="radio" name="memberListOpen" id="memberListOpen${option.id}" value="${option.id}" ${option.id==groupInfo.public_grL ? "checked" : ""}>
									    ${option.name}
									  </label>
								</div>
							</c:forEach>
	                  	</div>
					  	<hr>
					  	<button type="submit" class="btn btn-primary">수정</button>
	
	               	</div>
           		</form>
               <!--그룹관련 공개  end-->
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