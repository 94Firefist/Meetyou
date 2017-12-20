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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>아이디 찾기 페이지</title>
<script type="text/javascript">
	function formCheck()
	{

		//alert(document.getElementById("email").value);
		//$("#idFindForm").submit();

		var email = document.getElementById("email").value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

		if (exptext.test(email) == false)
		{

			alert("이 메일형식이 올바르지 않습니다.");
			document.addjoin.email.focus();
			return false;
			
		} else  //여기서도 한번 더 필터링을 해줘야 함. 이메일이 데이터베이스에 존재하는지 확인해야함. 그럴경우만 서밋
			$("#idFindForm").submit();

	}
</script>
<style type="text/css">
span {
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
					<form action="/idfind2.action" class="idFindForm" name="idFindForm"
						id="idFindForm">
						<div class="input-group">
							<h1>MeetU 아이디 찾기</h1>
							<br>
							<h5>가입 시 입력한 E-mail을 입력해주세요.</h5>
							<input type="text" id="email" class="form-control"
								placeholder="이메일"> <span
								style="color: red; float: left;">이메일 주소를 다시 확인하세요.<br></span>
							<br> <br style="clear: left;">
							<button type="button" class="btn btn-primary form-control"
								onclick="formCheck();">인증번호 보내기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>




</body>
</html>