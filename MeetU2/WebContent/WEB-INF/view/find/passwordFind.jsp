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
<title>패스워드 찾기 페이지</title>
<script type="text/javascript">

	function formCheck()
	{
		alert("확인");
		$("#passwordFindForm").submit();
	}
</script>
<style type="text/css">

	#errMsg{
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
			<a href="/maingroup.action"><img src = "images/meetU.png"/></a>
				<form action="/passwordfind2.action" class="passwordFindForm" name="passwordFindForm" id="passwordFindForm">
					<div class="form-group">
					  <div class="input-group">
						<h1>MeetU 패스워드 찾기</h1>
						<br>
						<div style="float: left;">
						  <h5>가입 시 입력한 Id을 입력해주세요.</h5>
						</div>
						<input type="text" id="userId" class="form-control" placeholder="아이디">
						<span id="errMsg" style="color:red; float: left;" >아이디를 다시 확인하세요.</span><br><br>
						<div style="float: left;">
						  <h5>가입 시 입력한 E-mail을 입력해주세요.</h5>
						</div>
						<input type="text" id="email" class="form-control" placeholder="이메일">
						<span id="errMsg" style="color:red; float: left;" >이메일 주소를 다시 확인하세요.<br></span>
						<br>
						 <br style="clear: left;">
						<button type="button" class="btn btn-primary form-control" onclick="formCheck();">인증번호 보내기</button>
					  </div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>



</body>
</html>