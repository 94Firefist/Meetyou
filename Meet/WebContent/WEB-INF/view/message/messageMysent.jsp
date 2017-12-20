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

<!-- 전체선택 체크박스시 체크박스 올체크 -->
<script type="text/javascript">
	$(function()
	{
		$("#allCheck").click(function()
		{
			if ($("#allCheck").prop("checked"))
			{
				$("input[type=checkbox]").prop("checked", true);
			} else
			{
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	})

	$(function()
	{
		$("#allCheckButton").click(function()
		{

			$("input[type=checkbox]").prop("checked", true);

		})
	})

	$(function()
	{
		$("#allNoCheckButton").click(function()
		{

			$("input[type=checkbox]").prop("checked", false);

		})
	})
</script>
<!-- 전체선택 체크박스시 체크박스 올체크 end -->


</head>
<body>

	<div class="container"
		style="border: 1px solid black; margin: 5px; height: 500px; width: 500px;">
		<!-- <div class="col-md-5"> -->
		<div class="form-area">
			<form role="form" action="/messageRemovesendChoiceform.action">
				<br style="clear: both"> <a href="messagemyreceive.action"><button
						type="button" class="btn btn-info">받은 쪽지</button></a> <a
					href="messagemysent.action"><button type="button"
						class="btn btn-warning" disabled="disabled">보낸 쪽지</button></a> <a
					href="messagesendform.action"><button type="button"
						class="btn btn-info">쪽지 보내기</button></a>
				<h3 style="margin-bottom: 25px; text-align: center;">MeetU
					Message</h3>
				<button type="button" class="btn btn-warning btn-xs"
					id="allCheckButton">전체선택</button>
				<button type="button" class="btn btn-warning btn-xs"
					id="allNoCheckButton">전체해제</button>
				<button type="submit" class="btn btn-primary btn-xs" id="choiceDel">선택삭제</button>
				<table class="table table-bordered">
					<tr class="info">
						<th><input type="checkbox" name="allcheck" id="allCheck" /></th>
						<th>받은 사람</th>
						<th>제목</th>
						<th>보낸 날짜</th>
						<th>수신여부</th>

					</tr>
					
					<c:forEach items="${sendMsgList}" var="sendMsg">
						<tr>                                   
							<td><input type="checkbox" name="delete" value="${sendMsg.lmbtextsend_id }" /></td>
							<td>${sendMsg.lumember_name }(${sendMsg.lumember_realid })</td>
							<td><a href="/messagemysentform.action?lmbtextsend_id=${sendMsg.lmbtextsend_id }">${sendMsg.mbtextsend_title }</a></td>
							<td>${sendMsg.mbtextsend_date }</td>
							<td>${sendMsg.mbtextre_date }</td>
						</tr>
					</c:forEach>
					
				</table>
			</form>


		</div>

		<div>
			<div class="col-xs-8 col-xs-offset-2">
				<div class="input-group">
					<div class="input-group-btn search-panel">
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown">
							<span id="search_concept">제목</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#contains">작성자</a></li>
							<li><a href="#less_than">제목</a></li>
						</ul>
					</div>
					<input type="hidden" name="search_param" value="all"
						id="search_param"> <input type="text" class="form-control"
						name="x" placeholder="검색어를 입력하세요"> <span
						class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>
		</div>

		<!-- </div> -->
	</div>






</body>
</html>