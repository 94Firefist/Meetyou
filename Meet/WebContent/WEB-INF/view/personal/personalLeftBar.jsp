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
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 타이틀 -->
<title>왼쪽바 </title>
<link rel="stylesheet" href="<%=cp %>/css/style.css">
<!-- jQuery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 부트스트랩 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- DatePicker -->
   
<style type="text/css">
   div.ui-datepicker
   {
    font-size:8px;
   }
   
   #datepicker
   {
      padding:0px;
   }
</style>
<!-- DatePicker end -->

<script type="text/javascript">

/* 쪽지보내기 버튼을 눌렀을 때 작동되는 스크립트*/
$(function()
{
   $(".sendmsg").click(function()
   {
	   if(${keynumber!=null})
		{
      window
      .open(
            "messagesendform.action?friendId=${memberName }&friendKey=${userNumber}",
            "a",
            "width=520, height=520, left=1060, top=50, location=no, directories=no, status=no");
		}
		else
			{
				$(location).attr("href", "/loginform.action?page="+location.href);
		}
   })
   
   
   // 이미지 드롭
   $("#fileone").on("change", function()
   {
      var file = $("#fileone")[0].files[0];
      var maxSize = 5242880;
      if(file.size > maxSize)
      {
             alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
              return false;
      }
      var   reader = new FileReader();
      
      reader.onload = function (event) 
      {
         $("#dragv").attr("value", event.target.result);
         
         if(confirm("프로필 사진을 변경하시겠습니까?"))
         {
            $("#gogosing").submit();
         }
      };
      reader.readAsDataURL(file);

      return false;
   });
   
   // 이미지 클릭했을 때 파일 열기 이벤트
   $("#drags").on("click", function()
   {
      $("#fileone").click();
   });
   
})



</script>

</head>
<body>
   <div id='content' class='container-fluid'
      style="width: 170px; height: 750px; border: 1px solid white; float: left; padding: 0px;  background-color: white;">
      <div class="container" style="width: 160px; height: 170px; margin: 15px 5px 0px 0px;">
         <!-- 프로필사진 -->
         <!-- <img src="images/pp2.jpg" style="width: 129px; height: 129px; padding-bottom: 2px;"><br> -->
                  
         
         <!-- 사진주소 !@!@!@!@@#!~#%$!@% -->
         <img src="${profilePhoto }" style="width: 129px; height: 129px; padding-bottom: 2px;"><br>
         <!--  이름 -->
         <p style="font-size: 14pt; color: black; text-align: center;">${memberName }</p>
      </div>
      
      <!-- 관리하기 기능-->
      <div style="text-align: center;">
         <c:choose>
            <c:when test="${!(param.userkey eq keynumber)}">
               <button type="button" class="btn btn-info sendmsg"  id="msg">쪽지보내기</button>               
            </c:when>
            <c:when test="${ param.userkey eq keynumber}">
               <p style="font-size: 13pt; color: #639df9;" ><a href="/personalcontrol.action?userkey=${userNumber }" id="control"><small>관리하기</small></a></p><br>
                  
                  <!-- 프사바꾸기 -->
               <form id="gogosing" action="/personalPicchange.action" method="post">
               <span id="drags" class="glyphicon glyphicon-camera" aria-hidden="true" style="cursor: pointer;"></span>
               <input type=file name='fileone' id="fileone" style='display: none;'> 
               <input type="hidden" id="dragv" name="dragv" value="">
               </form>
         	
            </c:when>
         </c:choose>
      </div>
      
      <!-- 기타정보-->
      <div style="text-align: center;"><br>
         <p>친구수 : ${friendCount }</p>
         <p>과거MeetU : ${pastMeetU }</p>
      </div>
      
      <hr>
      <div>
      <c:import url="/calendar.action"></c:import>
      </div>

      <hr>
      
      <!-- 관심정보 -->
      <div style="height: 50px; text-align: center;">
         <p>관심지역</p>
         <p style="font-size: 10pt; color: blue;">
 
            <c:forEach var="city" items="${userCityList }">
               ${city.userCity }
            </c:forEach>
 
         </p>
      </div>
      
      <hr>
      
      <!-- 관심사태그 -->
      <div class='container-fluid' style="height: 50px; text-align: center;">
         <p>관심사</p>
         <p style="font-style: italic; font-size: 10pt; color: blue;">

            <c:forEach var="tag" items="${userTagList }">
               ${tag.userTag }
            </c:forEach>

         </p>
      </div>
   </div>
</body>
</html>