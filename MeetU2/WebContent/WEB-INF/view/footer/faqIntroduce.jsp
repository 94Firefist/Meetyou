<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="robots" content="noindex, nofollow">
<link rel="stylesheet" href="<%=cp%>/css/style.css">
<title>사이트소개</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

<!-- 모달을 위한 스크립트 -->
<script type="text/javascript">

	$(document).ready(function() 
	{
		
		$("#btnModal").click(function()
		{
			$("#myModal").modal("show");
			
			$("#submit").click(function()
			{
				if($("#subject").val() == "")
				{
					//alert($("#titleI").html());
					$("#contentmsg").css("display", "none");
					$("#titlemsg").css("display", "inline");
					$("#subject").focus();
					return false;
				}
				if($("textarea#message").val() == "")
				{
					$("#titlemsg").css("display", "none");
					$("#contentmsg").css("display", "inline");
					$("#message").focus();
					return false;
				}

				
			});
		});

		
		
		
		
		
	});

</script>

</head>
<body>
<head>
<title>FAQ ＆ 문의사항</title>
</head>
<body>
	<c:import url="../Menu.jsp"></c:import>
	<div class='container'>
		<div id='content' class='row-fluid'>
			<div class='span2 sidebar'>
				<ul class="nav nav-tabs nav-stacked">
					<li><a href="/siteintroduce.action">사이트소개</a></li>
					<li><a href='/agreementintroduce.action'>이용약관</a></li>
					<li><a href="/noticeintroduce.action">공지사항</a></li>
					<li style="background-color: #EEEEEE;"><a href="">FAQ ＆
							문의사항</a></li>
				</ul>
			</div>
			<div class='span8 main'>
				<h2>FAQ</h2>
				<table class="table table-bordered">
					<tr class="info">
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
						
					</tr>
					
					
					<!-- FAQ 리스트 -->
					<c:forEach var="faq" items="${faqAll }">
						<tr>
							<td>${faq.no }</td>
							<td><a href="/faqintroducecomfirm.action?faqId=${faq.no }">${faq.title }</a></td>
							<td>${faq.faqDate }</td>
							<td>${faq.adminId }</td>
							<td>${faq.count }</td>
						</tr>
					</c:forEach>
					
					
				</table>
			</div>
		</div>
	</div>

<!-- 	<a href="onefaq.jsp"><button type="button" class="btn btn-default"
			style="position: relative; left: 55%;">1:1 문의하기</button></a> -->

	<!-- Modal -->
	<div class="modal fade bs-example-modal-sm" id="myModal" role="dialog">

		<div class="modal-dialog modal-sm">

			<!-- Modal content-->
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">1:1문의하기</h4>
				</div>

				<div class="modal-body">
						<!-- <div class="col-md-5"> -->
						<div class="form-area">
							<form role="form" action="/qnaadd.action" method="post" id="oneInsertForm">
								<div class="form-group">
									<input type="text" class="form-control" id="subject"
										name="subject" placeholder="제목" required style="width: 500px;">
									<span id="titlemsg" style="color: red; display: none;">제목을 입력하세요</span>
								</div>
								<div class="form-group">
									<textarea class="form-control" id="message" name="message" placeholder="내용"
										maxlength="140" rows="7" style="width: 500px; height:250px;"></textarea>
									<span id="contentmsg" style="color: red; display: none;">내용을 입력하세요</span>
									<span class="help-block">※ 답변은 메일로 전송됩니다.</span>
									<button type="submit" id="submit" name="submit"
										class="btn btn-primary pull-right">메세지 보내기</button>
									<br>
									<br>
								</div>
							</form>

						<!-- </div> -->
					</div>
				</div>
				<!-- modal body end -->

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	<!-- Modal end -->
	
	<c:if test="${userkey!=null }">
	<div style="position: relative; left: 30%; ">
	<button type="button" class="btn btn-default"
		data-target="#myModal" id="btnModal" >1:1 문의하기</button></div>
	</c:if>
	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
</body>
<script type="text/javascript">
	
</script>
</body>
</html>