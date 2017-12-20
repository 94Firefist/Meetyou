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
<title>받은 쪽지함</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 팝업 띄우기 위한 스크립트 -->
<script type="text/javascript">
	function reportPopup()
	{
		window.open("reportpopup.action?senderKey=" + $("#senderKey").text(),
					"a",
					"width=515 height=515, left=1060, top=50, location=no, directories=no, status=no,toolbar=no,scrollbars=no ");
	}
</script>


</head>
<body>


	<div class="container"
		style="border: 1px solid black; margin: 5px; height: 500px; width: 500px;">
		<!-- <div class="col-md-5"> -->
		<div class="form-area">
			<form role="form">
				<br style="clear: both"> <a href="/messagemyreceive.action"><button
						type="button" class="btn btn-warning" disabled="disabled">받은
						쪽지</button></a> <a href="/messagemysent.action"><button type="button"
						class="btn btn-info">보낸 쪽지</button></a> <a
					href="/messagesendform.action"><button type="button"
						class="btn btn-info">쪽지 보내기</button></a>
				<h3 style="margin-bottom: 25px; text-align: center;">MeetU
					Message</h3>

				<div class="form-group">
					보낸이 : <input type="text" class="" id="SenderName" name="SenderName"
						placeholder="보낸이" required style="width: 110px;" disabled
						value="${receiveMsg.limember_name}${receiveMsg.limember_realid==null?'':'('}${receiveMsg.limember_realid}${receiveMsg.limember_realid==null?'':')'}"> &nbsp;<span
						class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"
						style="color: red;" onclick="reportPopup();"><span id="senderKey" style="display: none;">${receiveMsg.lmbtextsend_id }</span><small>신고</small></span>
					받은 시간 : <input type="text" class="" id="receiveTime"
						name="receiveTime" placeholder="받은 시간" required
						disabled="disabled" style="width: 150px;"
						value="${receiveMsg.mbtextsend_date }">
				</div>
				<div class="form-group">
					제목 : <input type="text" class="" id="subject" name="subject"
						placeholder="제목" required disabled="disabled"
						style="width: 400px;" value="${receiveMsg.mbtextsend_title }">
				</div>


				<div class="form-group">
					<textarea class="form-control" id="message" placeholder="내용"
						maxlength="140" rows="7" >${receiveMsg.mbtextsend_content }</textarea>
					<br> <a href="/messagesendform.action"><button
							type="button" id="comfirm" name="confirm"
							class="btn btn-success pull-right">답장하기</button></a> 
							<a href="/messageRemoveform.action?lmbtextsend_id=${receiveMsg.lmbtextsend_id }"><button
							type="button" id="comfirm" name="confirm"
							class="btn btn-success pull-right">메시지삭제</button></a> <a
						href="/messagemyreceive.action"><button type="button"
							id="comfirm" name="confirm" class="btn btn-success pull-right">확인</button></a>

					<br> <br>
				</div>
				
			</form>
		</div>
		<!-- </div> -->
	</div>





</body>
</html>