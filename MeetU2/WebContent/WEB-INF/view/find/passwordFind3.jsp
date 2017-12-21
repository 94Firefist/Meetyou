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
		alert("확인");
	}

</script>
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
				<form action="" class="passwordFind2Form">
					<div class="input-group">
						<h1>MeetU 패스워드 찾기</h1>
						<br>
						<h5>새로운 비밀번호를 입력해주세요</h5>
						<input type="text" id="newPassword" class="form-control" placeholder="새로운 비밀번호">
						<input type="text" id="newPassword2" class="form-control" placeholder="비밀번호 재확인">
						<span id="errMsg" style="color:red; float: left;" >필수 입력 정보입니다.<br></span>
						<span id="errMsg" style="color:red; float: left;" >비밀번호가 일치하지 않습니다<br></span>
						<br>
						 <br style="clear: left;">
						<button type="button" class="btn btn-primary form-control" onclick="formCheck();">확   인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>