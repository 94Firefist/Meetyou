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
		style="margin: 5px; height: 500px; width: 500px;">
		<div class="form-area">
			<form role="form" action="/messageRemoveChoiceform.action">
				<br style="clear: both">
				<button type="button" class="btn btn-warning" disabled="disabled">받은
					쪽지</button>
				<a href="/messagemysent.action"><button type="button"
						class="btn btn-info">보낸 쪽지</button></a> <a
					href="/messagesendform.action"><button type="button"
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
						<th>보낸 사람</th>
						<th>제목</th>
						<th>받은 날짜</th>
						<th>읽음</th>
					</tr>
					
					<c:forEach items="${receiveMsgList}" var="receiveMsg">
						<tr>
							<td><input type="checkbox" class="delete" name="delete" id="${receiveMsg.lmbtextsend_id }"
								value="${receiveMsg.lmbtextsend_id }" /></td>
							<td>${receiveMsg.limember_name}${receiveMsg.limember_realid==null?'':'('}${receiveMsg.limember_realid}${receiveMsg.limember_realid==null?'':')'}</td>
							<td><a
								href="/messagemyreceiveform.action?lmbtextsend_id=${receiveMsg.lmbtextsend_id }&redate=${receiveMsg.mbtextre_date }">${receiveMsg.mbtextsend_title }</a></td>
							<td>${receiveMsg.mbtextsend_date }</td>
							<td>${receiveMsg.mbtextre_date }</td>
						</tr>
					</c:forEach>
					
				</table>
				<div style="text-align: center;">
					<nav>
						<ul class="pagination pagination-sm">
							
							<c:if test="${startPage > 1 }">
								<li><a href="/messagemyreceive.action?page=1"><span aria-hidden="true">«</span><span
										class="sr-only">Previous</span></a></li>
							</c:if>
							
							<c:if test="${page > 1 }">
							<li><a href="/messagemyreceive.action?page=${page-1 }"><span aria-hidden="true">〈</a></li>
							</c:if>
							
							
							<c:forEach var="item" begin="${startPage }" end="${endPage }" step="1">
								<c:choose>
									<c:when test="${item == page }">
										<li class="active"><a href="/messagemyreceive.action?page=${item }">${item }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="/messagemyreceive.action?page=${item }">${item }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:if test="${page < totalPage }">
							<li><a href="/messagemyreceive.action?page=${page+1 }">
								<span aria-hidden="true">〉</span>
								<span class="sr-only">Next</span>
							</a></li>
							</c:if>
							
							<c:if test="${endPage < totalPage }">
							<li><a href="3">
								<span aria-hidden="true">»</span>
								<span class="sr-only">END</span>
							</a></li>
							</c:if>
							
						</ul>
					</nav>
				</div>
			</form>

		</div>

		<div>
			<div class="col-xs-8 col-xs-offset-2">					
				<div class="input-group">
					<select style="height:34px;">
							<option>작성자</option>
							<option>제목</option>
							<option>아이디</option>
					</select>
					<input type="text" style="height:34px; margin:0px;">
					<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search" style="padding:0px;"></span>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>