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
<title>보낸 쪽지함</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>
<body>


	<div class="container"
		style="border: 1px solid black; margin: 5px; height: 500px; width: 500px;">
		<!-- <div class="col-md-5"> -->
		<div class="form-area">
			<form role="form">
				<br style="clear: both"> <a href="/messagemyreceive.action"><button
						type="button" class="btn btn-info" disabled="disabled">받은
						쪽지</button></a> <a href="/messagemysent.action"><button type="button"
						class="btn btn-warning">보낸 쪽지</button></a> <a
					href="/messagesendform.action"><button type="button"
						class="btn btn-info">쪽지 보내기</button></a>
				<h3 style="margin-bottom: 25px; text-align: center;">MeetU
					Message</h3>

				<div class="form-group">
					받는이 : <input type="text" class="" id="userId" name="userId"
						placeholder="받는이(ID)" required style="width: 110px;" disabled
						value="${sendMsg.lumember_name }(${sendMsg.lumember_realid })">&nbsp;
					보낸 시간 : <input type="text" class="" id="sentime" name="sentTime"
						placeholder="보낸 시간" required disabled="disabled"
						style="width: 200px;" value="${sendMsg.mbtextsend_date }">
				</div>
				<div class="form-group">
					제목 : <input type="text" class="" id="subject" name="subject"
						placeholder="제목" required disabled="disabled"
						style="width: 400px;" value="${sendMsg.mbtextsend_title }">
				</div>


				<div class="form-group">
					<textarea class="form-control" id="message" placeholder="내용"
						maxlength="140" rows="7" >${sendMsg.mbtextsend_content }</textarea>
					<br><a href="/messagesendRemoveform.action?lmbtextsend_id=${sendMsg.lmbtextsend_id }"><button type="button" id="comfirm"
							name="confirm" class="btn btn-success pull-right">메시지삭제</button></a>
					<a href="/messagemysent.action"><button type="button"
							id="comfirm" name="confirm" class="btn btn-success pull-right">확인</button></a>


					<br>
					<br>
				</div>
			</form>
		</div>
		<!-- </div> -->
	</div>





</body>
</html>