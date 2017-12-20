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


<!-- 제이쿼리 -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- 부트스트랩 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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

 
   <!-- 상단메뉴 end -->
   <div class='container' style="padding: 20px;">
      <div id='content' class='row-fluid'>
         <!-- 메인 메뉴 -->
         <div class='span8 main w3-row'
            style="border: 2px white solid; padding: 20px; width: 1130px; background-color: white;">

            <div class="w3-quarter"
               style="border-right: 2px solid #ccc; width: 20%; height: 500px; text-align: center;">
               <ul class="gLeft">
                  <li><a href="#">그룹 정보 수정</a></li>
                  <li><a href="#" >그룹·멤버 관리</a></li>
                  <li><a href="#">가입 승인</a></li>
                  <li><a href="#">블랙리스트 관리</a></li>
                  <li><a href="#" class="gLeftS">공개 범위 설정</a></li>
               </ul>
            </div>

            <div class="w3-threequarter w3-container">
               <h3 style="font-weight: bold;">공개범위 설정</h3>
               <hr>
				
				<!--그룹관련 공개  -->
               <div style="border: 2px solid white;">
                  <h4 style="font-weight: bold;">그룹</h4>
                  <div id=groupOpen
                     style="border: 2px solid white; margin-top: 1%; margin-left: 2%; width: 90%; height: 120%;">
					<p><strong>그룹공개</strong></p>
                    <input type="radio" name="groupOpen" value="groupmember">그룹 멤버
					<input type="radio" name="groupOpen" value="sitemember">사이트 회원만
					<input type="radio" name="groupOpen" value="non-sitemember" checked="checked">전체공개
                  </div>
                  
                   <div id=photoOpen
                     style="border: 2px solid white; margin-top: 1%; margin-left: 2%; width: 90%; height: 120%;">
					<p><strong>사진첩 공개</strong></p>
                    <input type="radio" name="photoOpen" value="groupmember">그룹 멤버
					<input type="radio" name="photoOpen" value="sitemember">사이트 회원만
					<input type="radio" name="photoOpen" value="non-sitemember" checked="checked">전체공개
                  </div>

                   <div id=memberListOpen
                     style="border: 2px solid white; margin-top: 1%; margin-left: 2%; width: 90%; height: 120%;">
					<p><strong>멤버리스트 공개</strong></p>
                    <input type="radio" name="memberListOpen" value="groupmember">그룹 멤버
					<input type="radio" name="memberListOpen" value="sitemember">사이트 회원만
					<input type="radio" name="memberListOpen" value="non-sitemember" checked="checked">전체공개
                  </div>
				  <hr>

               </div>
               <!--그룹관련 공개  end-->
               
               <!--이벤트관련 공개  -->
               <div style="border: 2px solid white;">
                  <h4 style="font-weight: bold;">이벤트</h4>
                  <div id=eventOpen
                     style="border: 2px solid white; margin-top: 1%; margin-left: 2%; margin-bottom: 2%; width: 90%; height: 120%;">
					<p><strong>이벤트 개설 시 공개여부</strong></p>
                    <input type="radio" name="eventOpen" value="groupmember">그룹 멤버
					<input type="radio" name="eventOpen" value="sitemember">사이트 회원만
					<input type="radio" name="eventOpen" value="non-sitemember" checked="checked">전체공개
                  </div>
               </div>
               <!--이벤트관련 공개  end-->
				
				<div>
					<button type="button" class="btn btn-default">취소</button>
					<button type="button" class="btn btn-primary">수정</button>
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