<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
   
   String userkey = request.getParameter("userkey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="<%=cp%>/js/bootstrap.min.js"></script>

</head>
<body style="background-color: #f4f6f7;">
   <div style="border: 2px solid white; background-color:white; width: 1130px; height: 165px; margin: 0px auto;">
      <div style="width: 1130px; height: 100px;" >
         <h1 style="margin: 20px 50px;">${memberName}님의 홈페이지</h1>
      </div>
      
      <nav class="navbar navbar-inverse" style="width: 1130px; height: 40px; padding: 0.4%; border-top: #A6A6A6 solid 1px;">
         <div class="container" style="width: 70%; height: 100%; float: left; padding: 0px;">
            <a style="margin-top: 0px; color:white;" class="menu btn btn-link" href="/personalhome.action?userkey=${param.userkey}" role="button">
               <span class="menuText">홈</span>
            </a>
            <a style="margin-top: 0px; color:white;" class="menu btn btn-link" href="/personalintroducemyself.action?userkey=${param.userkey} " role="button">
               <span class="menuText">자기소개</span>
            </a>
            <a style="margin-top: 0px; color:white;" class="menu btn btn-link" href="/personaltimeline.action?userkey=${param.userkey}" role="button">
               <span class="menuText">타임라인</span>
            </a>
            <a style="margin-top: 0px; color:white;" class="menu btn btn-link" href="/personalfriendlist.action?userkey=${param.userkey}" role="button">
               <span class="menuText">친구목록</span>
            </a> 
            <a style="margin-top: 0px; color:white;" class="menu btn btn-link" href="/personalgrouplist.action?userkey=${param.userkey}" role="button">
               <span class="menuText">그룹목록</span>
            </a>
         </div>
         
      </nav>
      
   </div>
</body>
</html>