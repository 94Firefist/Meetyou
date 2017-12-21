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
<title>MeetU 로그인페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript">
	function formCheck(obj)
	{
		
	}

</script>

<style type="text/css">

	span 
	{
		color:red;	
	}

</style>

</head>
<body>

<div class="container">
		<br>
	<div class="row">
		<div class="col-md-4 col-md-offset-4 text-center">
			<div class="search-box">
				<form action="/login.action" method="post" class="loginForm" onsubmit="formCheck(this);">
					<div class="input-group">
						<a href="/maingroup.action"><img src = "images/meetU.png"/></a>
						<br><br>
						<input type="text" id="name" name="name" class="form-control" placeholder="아이디" required="required">
						<input type="password" id="pwd" name="pwd" class="form-control" placeholder="패스워드" required="required">
						<c:if test="${param.fail!=null }">
						<span> 아이디 또는 비밀번호를 다시 확인하세요.<br>
                        등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다. </span>
                        </c:if>
						<br><br>
						 <div style="float: left;">
						 	<input type="checkbox" name="loginstatus" id="loginstatus"> 로그인 상태 유지
						 </div>
						 <br><br>
						 <input type="hidden" name="page" value="${param.page }">
						 <br style="clear: left;">
						<button type="submit" class="btn btn-primary form-control">로그인</button>
						<br><br>
						<a href="/signup.action">회원가입</a>&nbsp;
						<a href="/idfind.action">아이디 찾기</a>&nbsp;
						<a href="/passwordfind.action">비밀번호 찾기</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>

