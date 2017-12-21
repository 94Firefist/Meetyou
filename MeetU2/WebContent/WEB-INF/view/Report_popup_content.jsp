<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String senderkey = request.getParameter("senderKey");
%>
<!DOCTYPE html>
<html>
<head>
<title>신고하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
</head>
<body>
	<!-- 팝업상자전체 -->
	<div id="reportPopup" style="width: 160px;">

		<div class="container"
			style="border: 1px solid white; margin: 5px; height: 500px; width: 500px;">
			<div class="form-area">
				<form role="form" action="/reportMsg.action">

					<h3 style="margin-bottom: 25px; text-align: center;">MeetU
						신고하기</h3>

					<div class="form-group">
						신고대상 : <input type="text" id="reportedPerson" name="reportedPerson"
							style="width: 100px;" placeholder="senderkey" readonly="readonly" value="<%=senderkey %>">&nbsp;
				        신고자 : <input type="text" id='reportPerson' style="width: 100px;"
							placeholder="myId" readonly="readonly" value="${keynumber }">

					</div>

					<div class="form-group">
						<select class="form-control" id="reportType" name="reportType"
							style="width: 200px;">
							<c:forEach items="${ msgReportlist}" var="msgR">
								<option value="${msgR.reptype_id}">${msgR.reptype_name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<textarea class="form-control" id="reportDetail" name="reportDetail" placeholder="상세내용"
							maxlength="140" rows="7"></textarea>
						<span class="help-block">최대 140까지만 허용됩니다.</span> <span
							style="color: red">신고사유와 내용은 접수 후 수정이 불가능하므로 다시 확인하시고 신청해
							주시기 바랍니다. 신청된 신고는 담당자가 내용 확인 후 처리됩니다.</span> <br>
						<br>
						<a href="/messagemyreceive.action"><button type="button" id="cancel" name="cancel"
							class="btn btn-default pull-right" style="margin-left:5px;">취소</button></a>
						<button type="submit" id="ok" name="ok"
							class="btn btn-primary pull-right">신고요청하기</button>
						<br>
					</div>
				</form>
			</div>

		</div>



	</div>
</body>
</html>