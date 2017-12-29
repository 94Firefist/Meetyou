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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/css/style.css">
<style type="text/css">

   span.menuText
   {
      color: #F0F0F0;
   }
</style>

<script type="text/javascript">

function groupSignup()
{
   /* 그룹가입 상태 확인 후 자동 승인일 경우만 버튼 눌렀을때 가입 승인 되었습니다 메시지 출력 */
   if ($("#groupSignupStatus").val() == 'auto')
   {
      
      if(confirm("가입신청 하시겠습니까?")) {
         
         $(location).attr("href", "groupjoin.action?lGroup_id=${lGroup_id}" );
         
      } 
      
   }
   
}


$(document).ready(function()
{
   a = 0;
   b = 0;
   $("#joinwait").click(function()
   {
      if(confirm("가입신청을 취소합니까?")) {
         $(location).attr("href", "groupjoinwaitclose.action?lGroup_id=${lGroup_id}");
      };
   })
})

</script>
<style type="text/css">
   
</style>
</head>

<body style="background-color: #D5D5D5;">

   <div class="container"
      style="background-image: url('images/grouptop.png'); width: 1130px; height: 200px; margin: 0px auto; padding: 0px;">
      <div style="width: 1130px; height: 160px; text-align: center; font-weight: bolder;">
         <div style="height: 40%;"></div>
         <div style="height: 40%;">
            <p class="" style="width: auto; font-size: 50px; color: white; font-family: '맑은 고딕'; font-weight: bolder; letter-spacing: 10px;" id="subject">${groupInfo.group_name}</p><input type="text" id="groupSignupStatus" style="display: none;" value="auto">
         </div>
         <div style="height: 20%;"></div>
         
      </div>
      <nav class="navbar navbar-inverse" style="width: 1130px; height: 40px; padding: 0.4%; border-top: #A6A6A6 solid 1px;">
         <div class="container" style="width: 70%; height: 100%; float: left; padding: 0px;">
            <a style="margin-top: 0px;" class="menu btn btn-link" href="/grouphome.action?lGroup_id=${lGroup_id}" role="button">
               <span class="menuText">홈</span>
            </a>
            <a style="margin-top: 0px;" class="menu btn btn-link" href="/groupintroduce.action?lGroup_id=${lGroup_id}" role="button">
               <span class="menuText">그룹소개</span>
            </a>
            <a style="margin-top: 0px;" class="menu btn btn-link" href="/groupmemberlist.action?lGroup_id=${lGroup_id}" role="button">
               <span class="menuText">회원</span>
            </a>
            <a style="margin-top: 0px;" class="menu btn btn-link" href="/grouptimeline.action?lGroup_id=${lGroup_id}" role="button">
               <span class="menuText">타임라인</span>
            </a> 
            <a style="margin-top: 0px;" class="menu btn btn-link" href="/groupphoto.action?lGroup_id=${lGroup_id}" role="button">
               <span class="menuText">앨범</span>
            </a>
            <c:if test="${groupPower == 1 || groupPower == 2}">
               <a style="margin-top: 0px;" class="menu btn btn-link" href="/groupInfo.action?lGroup_id=${lGroup_id}" role="button">
                  <span class="menuText">관리</span>
               </a>
            </c:if>
            
         </div>
         <c:if test="${bgCheck == null || bgCheck == 0}">
            <div style="width: 30%; height: 100%; float: left; text-align: right;">
              
<%--                <c:if test="${groupPower == 1 || groupPower == 2 || groupPower == 3}"> --%>
<!--                   <button type="button" class="btn btn-success menu" style="width:40%;height: 100%; margin-top: 0px;">친구 초대하기</button> -->
<%--                </c:if> --%>
               
               <c:if test="${groupPower != 1 && groupPower != 2 && groupPower != 3 && groupPower != 6}">
                  <button type="button" class="btn btn-primary menu" style="width:40%;height: 100%; margin-top: 0px;" onclick="groupSignup();">그룹 가입하기</button>
               </c:if>
               <c:if test="${groupPower == 6}">
                  <button type="button" class="btn btn-warning menu" style="width:40%;height: 100%; margin-top: 0px;" id="joinwait">가입 신청중</button>
               </c:if>
            </div>
         </c:if>

      </nav>
   </div>
</body>
</html>