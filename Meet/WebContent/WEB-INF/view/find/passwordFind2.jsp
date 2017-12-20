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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>아이디 찾기 페이지</title>
<script type="text/javascript">

	function formCheck()
	{
		//alert("확인");
		
		// 샘플인증번호 1234일때만 새로운 비밀번호 입력페이지로 넘어감 
		if(document.getElementById("confirmNum").value == '1234')
		{
			$("#passwordFind2Form").submit();
		}
		else
		{
			alert("인증번호가 일치하지 않습니다."); 
			
			document.getElementById("errMsg").display = inline; 
			return false;
		}
		
		
		/*
		
		if($("#confirmNum").val()=='1234')
		   {
			$("#passwordFind2Form").submit();
		   }
		   else
		   {
		      $("#errMsg").attr("style", "display:inline");
		      return false;
		   }
		*/
		
	}

</script>


<!-- 카운트다운 스크립트 -->
<script>
	cnt = 30; //몇 초?
	function countdown()
	{
		cnt--;
		if (cnt == 0) //0초일때는 다시 입력하게 세션을 끊는다거나 다른 조치가 필요~!!
		{
		 document.getElementById('dididi').innerHTML = "<p style='color:red;'>인증번호를 다시 전송하세요.</p><br><a href='passwordFind1.jsp'>뒤로 가기</a>"
	
		}
		else if (cnt > 0)
		{
			document.getElementById('dididi').innerHTML = cnt + "초 안에 입력";
			setTimeout("countdown()", 1000);
		}
	}

	$(function()
	{
		cnt--;
		if (cnt == 0) //0초일때는 다시 입력하게 세션을 끊는다거나 다른 조치가 필요~!!
		{		document.getElementById('dididi').innerHTML = "<p style='color:red;'>인증번호를 다시 전송하세요.</p>"
				
		}
		else if (cnt > 0)
		{
			document.getElementById('dididi').innerHTML = cnt + "초 안에 입력";
			setTimeout("countdown()", 1000);
		}
	});
</script>
<!-- 카운트다운 스크립트 end-->

<style type="text/css">

	#errMsg
	{
		 display: none;
	}
	
	#confirmMsg
	{
		display: none;
	}	
	
</style>

</head>
<body>

<div class="container">
		<br>
	<div class="row">
		<div class="col-md-4 col-md-offset-4 text-center">
			<div class="search-box">
				<form action="/passwordfind3.action" class="passwordFind2Form" id="passwordFind2Form" name="passwordFind2Form">
					<div class="input-group">
						<h1>MeetU 패스워드 찾기</h1>
						<br>
						<h5>인증번호를 입력해주세요</h5>
						<input type="text" id="confirmNum" class="form-control" placeholder="인증번호">
						 <br style="clear: left;">
						<button type="button" class="btn btn-primary form-control" onclick="formCheck();">확   인</button>
						<div id="dididi"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>