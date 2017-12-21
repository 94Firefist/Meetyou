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
<title>문의</title>

<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<style type="text/css">
.lilist {
	float: left;
	list-style: none;
	margin: 1px;
}

.lilist a {
	display: block;
	width: 150px;
	height: 50px;
	background: gray;
	color: #fff;
	font-size: 15px;
	border-radius: 6px;
	text-align: center;
	padding-top: 10%;
	text-decoration: none;
}

.lilist a:hover {
	background: #000000;
}

.licheck {
	/*position: absolute;*/
	color: #FFFFFF;
}

.licheck:after {
	content: '';
	position: absolute;
	margin-left: 2%;
	border-top: 10px solid #000000;
	border-right: 10px solid transparent;
	border-left: 10px solid transparent;
}

.licheck .acheck {
	background-color: #000000;
}
</style>


<script type="text/javascript">
	$(document).ready(function()
	{
		
		$(".btnOneOne").click(function()
		{
			$(".divMonOne").attr("style", "display:inline");
		});
		
		
		/* $(".listNumber").click(function()
		{
			alert( $("#number").html() );
			
			
			
			$(".divMon").attr("style", "display:inline");
			
		}); */
		$(".lists").click(function()
		{
			//alert( $(this).eq(0).html() );
			$(".divMon").attr("style", "display:inline");
			
			//btnOneOne
			if( $(this).find(".handle").html().trim() == "처리" )
			{
				//alert("처리");
				$("#btnSpan").attr("style", "display:none");
			}
			else
			{
				$("#btnSpan").attr("style", "display:inline");	
			}
			
			//alert("");
			
			var num = $(this).find(".num").html();
			var title = $(this).find(".title").html();
			var date = $(this).find(".date").html();
			var user = $(this).find(".user").html();
			var handle = $(this).find(".handle").html();
			
			$("#setNum").html(num);
			$("#setTitle").html(title);
			$("#setDate").html(date);
			$("#setUser").html(user);
			$("#setHandle").html(handle);	
			
			//alert($("#setNum").html().trim(" ",""));

			ajaxRequest();
	
			
			// 답변
			$(".btnOneSend").click(function()
			{
				if($("#titleI").val() == "")
				{
					//alert($("#titleI").html());
					$("#contentmsg").css("display", "none");
					$("#titlemsg").css("display", "inline");
					$("#titleI").focus();
					return false;
				}
				if($("textarea#contentI").val() == "")
				{
					$("#titlemsg").css("display", "none");
					$("#contentmsg").css("display", "inline");
					$("#contentI").focus();
					return false;
				}
				
				//$("#oneForm").attr("action", "qnainsert.action?admin=" + );
				$("#oneForm").attr("action", "qnainsert.action?qnaId=" + num);
				$("#oneForm").submit();
				

			});

			//alert(num + "/" + title + "/" + date + "/" + user + "/");
			
			
			$(".btnpass").click(function()
			{
				$(".divMon").attr("style", "display:none");
			});
			
						
		});
		
		 // Ajax
		function ajaxRequest()
		{
			$.post("ajax.action", {qnaId : $("#setNum").html().trim()}, function(data)		// 넣어줄....
			{
				$("#content").html(data.trim());	
				
			});
		} 
		
	});
	

	
</script>

<style type="text/css">

	.title
	{
		cursor: pointer;
	}

</style>

</head>
<body>

<c:import url="../Menu.jsp"></c:import>

	<div class="container" style="height: 100%;">

		<div class="w3-row"
			style="height: 100%; width: 100%;">

			<div class="w3-quarter"
				style="border-right: 2px solid gray; margin-top: 10%; text-align: center; font-size: 25px; line-height: 50px; font-weight: bold; padding: 3%;">
				
				<div>
					<a href="/grouplist.action"><span>그룹 관리</span></a>
				</div>
				
				<div>
					<a href="/memberlist.action"><span>회원 관리</span></a>
				</div>
				
				<div>
					<span style="color: orange;">서비스 관리</span>
				</div>
				
				<div>
					<a href="/reportList.action"><span>운영 관리</span></a>
				</div>
				
			</div>

			<div class="w3-threequarter"
				style="margin-top: 3%;">
				<div>
					<div style="margin: 4%; margin-bottom: 3%;">
						<span
							style="padding: 2%; background-color: #000000; margin: 1%; font-size: 20px; border-radius: 6px; color: white;">미츄
							서비스 관리</span>
					</div>

					<ul>
						<li class="lilist"><a href="noticelist.action">공지사항</a></li>
						<li class="lilist licheck"><a class="acheck">문의사항</a></li>
						<li class="lilist"><a href="faqlist.action">FAQ</a></li>
						<li class="lilist"><a href="paymentlist.action">구매내역</a></li>
					</ul>

					<div style="height: 100%; margin-top: 9%;">


						<!-- 문의1 ////////////////////////////////////////////////////////////////////// -->
						<div
							style="margin: 5%; border: 2px solid black; height: 100%; margin-top: 4.7%;"
							class="w3-container">
							
							<div style="height: 100%; width: 100%;">
								<div style="height: 100%; width: 100%;">
									<dl
										style="text-align: center; background-color: gray; margin-bottom: 4%; vertical-align: bottom;">
										<dt style="float: left; width: 10%; overflow: hidden; text-overflow: ellipsis;">글번호</dt>
										<dt style="float: left; width: 40%; overflow: hidden; text-overflow: ellipsis;">제목</dt>
										<dt style="float: left; width: 20%; overflow: hidden; text-overflow: ellipsis;">작성일자</dt>
										<dt style="float: left; width: 20%; overflow: hidden; text-overflow: ellipsis;">작성자명</dt>
										<dt style="float: left; width: 10%; overflow: hidden; text-overflow: ellipsis;">처리여부</dt>
									</dl>
									<hr>
									
									<!-- QNA 리스트 -->
									<c:forEach var="qna" items="${qnaList }">
										<dl style="text-align: center;" class="lists">
											<dd style="float: left; width: 10%; overflow: hidden; text-overflow: ellipsis;" class="num">
											${qna.qnaId }
											</dd>
											<dd style="float: left; width: 40%; overflow: hidden; text-overflow: ellipsis;" class="title">
											${qna.title }
											</dd>
											<dd style="float: left; width: 20%; overflow: hidden; text-overflow: ellipsis;" class="date">
											${qna.qnaDate }
											</dd>
											<dd style="float: left; width: 20%; overflow: hidden; text-overflow: ellipsis;" class="user">
											${qna.userName }
											</dd>
											<dd style="float: left; width: 10%; text-overflow: ellipsis; 
											color: ${qna.handling == '보류' ? 'black' : 'red' };" class="handle">
											${qna.handling }
											</dd>
										</dl>
									</c:forEach>

									
									<!--  -->

									<!-- 
									<a href="javascript:moonList()">
									<dl style="text-align: center;">
										<dd style="float: left; width: 10%; text-overflow: ellipsis;">9</dd>
										<dd style="float: left; width: 40%; text-overflow: ellipsis;">마이노는
											정말 재미없나요?</dd>
										<dd style="float: left; width: 20%; text-overflow: ellipsis;">2017/12/04</dd>
										<dd style="float: left; width: 20%; text-overflow: ellipsis;">모다피</dd>
										<dd style="float: left; width: 10%; text-overflow: ellipsis;">０</dd>
									</dl>
									</a> 
									-->
									
									
									<div style="text-align: center; margin-top: 17%;">

										<nav>

											<ul class="pagination pagination-sm">
												
												<c:if test="${startPage > 1 }">
													<li><a href="/qnalist.action?page=1"><span aria-hidden="true">«</span><span
															class="sr-only">Previous</span></a></li>
												</c:if>
												
												<c:if test="${page > 1 }">
												<li><a href="/qnalist.action?page=${page-1 }"><span aria-hidden="true">〈</a></li>
												</c:if>
												
												
												<c:forEach var="item" begin="${startPage }" end="${endPage }" step="1">
													<c:choose>
														<c:when test="${item == page }">
															<li class="active"><a href="/qnalist.action?page=${item }">${item }</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="/qnalist.action?page=${item }">${item }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
												<c:if test="${page < totalPage }">
												<li><a href="/qnalist.action?page=${page+1 }">
													<span aria-hidden="true">〉</span>
													<span class="sr-only">Next</span>
												</a></li>
												</c:if>
												
												<c:if test="${endPage < totalPage }">
												<li><a href="/qnalist.action?page=${totalPage }">
													<span aria-hidden="true">»</span>
													<span class="sr-only">END</span>
												</a></li>
												</c:if>
												
											</ul>
										</nav>
									</div>
									
									
									
									
								</div>
							</div>
						</div>






						<!-- 문의2 ////////////////////////////////////////////////////////////////////// -->
<div class="divMon" style="display: none;">
						<ul class="" style="">
							<li class="lilist licheck" style="margin-top: -6%;"><a class="acheck">문의사항</a></li>
						</ul>

						<div
							style="margin: 5%; border: 2px solid black; height: 100%; margin-top: 10.8%;"
							class="w3-container">
							<div style="height: 100%; width: 100%;">
								<div style="height: 100%; width: 100%;">

									<div style="margin: 2%; margin-top: 1%; margin-bottom: 1%;">
										<dl style="text-align: center;">
											<dd
												style="float: left; width: 8%; text-overflow: ellipsis; border: 2px solid gray; margin: 1%; margin-top: 0; border-radius: 7px;" id="setNum">9</dd>
											<dd
												style="float: left; width: 38%; text-overflow: ellipsis; border: 2px solid gray; margin: 1%; margin-top: 0; border-radius: 7px;" id="setTitle">마이노는
												정말 재미없나요?</dd>
											<dd
												style="float: left; width: 18%; text-overflow: ellipsis; border: 2px solid gray; margin: 1%; margin-top: 0; border-radius: 7px;" id="setDate">2017/12/04</dd>
											<dd
												style="float: left; width: 18%; text-overflow: ellipsis; border: 2px solid gray; margin: 1%; margin-top: 0; border-radius: 7px;" id="setUser">모다피</dd>
											<dd
												style="float: left; width: 8%; text-overflow: ellipsis; border: 2px solid gray; margin: 1%; margin-top: 0; border-radius: 7px;" id="setHandle">5000</dd>
										</dl>
									</div>
									<div style="margin: 3%;">
										<textarea rows="5" cols="5"
											style="min-width: 100%; max-width: 100%; resize: none; margin-top: 1%;"
											placeholder="내용" id="content"></textarea>
									</div>

									
									<button type="button" class="btn btn-info btnpass"
										style="float: right; margin-left: 1%; margin-bottom: 2%; width: 150px;">확인</button>
									
									<span id="btnSpan">
									<button type="button" class="btn btn-default btnOneOne"
										style="float: right; margin-bottom: 2%; width: 150px;">1:1
										답변보내기</button>
									</span>
						
								</div>
							</div>
						</div>
</div>

						<!-- 문의3 ////////////////////////////////////////////////////////////////////// -->
<div class="divMonOne" style="display: none;">
<form action="qnainsert.action" method="post" id="oneForm">
						<ul class="">
							<li class="lilist licheck" style="margin-top: -6%;"><a class="acheck">1:1답변보내기</a></li>
						</ul>

						<div
							style="margin: 5%; border: 2px solid black; height: 100%; margin-top: 10.8%;"
							class="w3-container">
							<div style="height: 100%; width: 100%;">
								<div style="height: 100%; width: 100%;">

									<div style="margin: 2%; margin-top: 3%;">
										<input type="text"
											style="border: 2px solid gray; margin: 1%; margin-top: 0; width: 98%; border-radius: 7px; margin-bottom: 0;"
											placeholder="제목" id="titleI" name="titleI">
										<span id="titlemsg" style="color: red; display: none;">제목을 입력하세요</span>
									</div>
									<div style="margin: 3%; margin-top: 1%;">
										<textarea rows="5" cols="5"
											style="min-width: 100%; max-width: 100%; resize: none;"
											placeholder="내용" id="contentI" name="contentI"></textarea>
										<span id="contentmsg" style="color: red; display: none;">내용을 입력하세요</span>
									</div>

									<button type="button" class="btn btn-info btnOneSend"
										style="float: right; margin-left: 1%; width: 150px; margin-bottom: 2%;">답변보내기</button>

								</div>
							</div>
						</div>
</form>
</div>

						<!-- ////////////////////////////////////////////////////////////////////// -->

						<!-- ////////////////////////////////////////////////////////////////////// -->
					</div>


				</div>


			</div>

		</div>

	</div>


<div>
	<c:import url="../BottomBar.jsp"></c:import>
</div>


</body>
</html>






















