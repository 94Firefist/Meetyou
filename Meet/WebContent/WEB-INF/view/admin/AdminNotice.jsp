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
<title>공지</title>

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
		
		// Ajax 요청 및 응답 처리
		//ajaxRequest();
		
		$(".btnGJupdate").click(function()
		{
			//alert("수정");
			
			//alert($(this).attr('value'));
			//alert($(this).val());
			// Ajax 요청 및 응답 처리
			ajaxRequest(this);
			
			//$(".btnupdateC").attr("onclick", "location.href='noticeupdate.action?noticeId=" + $(this).val() + "'");			
			//$(".btnupdateC").attr("value", $(this).val());
			
			
			$("#updateform").attr("action", "noticeupdate.action?noticeId=" + $(this).val());
			
			$(".divGongSS").attr("style", "display:none");
			$(".divGongSJ").attr("style", "display:inline");
			
		});
		
		$(".btnGJwrite").click(function()
		{
			//alert("글쓰기");
			
			
			
			//$("#insertform").attr("action", "noticeinsert.action?admin=" + );
			// 세션으로가져와
			
			$(".divGongSJ").attr("style", "display:none");
			$(".divGongSS").attr("style", "display:inline");
			
			$(".btnAdd").click(function()
			{
				
				//alert($("#titleI").val());
				
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
				
				$("#insertform").submit();
				
			});
		});
		
		$(".btnGJdelete").click(function()
		{
			//alert($(this).attr('value'));
			alert("삭제");
			$(location).attr("href", "noticedelete.action?noticeId=" + $(this).val());			
		});
		
	});
	
	// Ajax
	function ajaxRequest(obj)
	{
		
		
		$.post("ajax.action", {noticeId : $(obj).val()}, function(data)		// 넣어줄....
		{
			
			var doc = data;
			var root = doc.documentElement;
			
			var titleT = root.getElementsByTagName("zipcode");
			var contentT = root.getElementsByTagName("address");
			
			var title = titleT[0].firstChild.nodeValue;
			var content = contentT[0].firstChild.nodeValue;

			$("#title").val(title);
			$("#content").html(content);	
			
		}); 
		
	}
	
</script>



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
						<li class="lilist licheck"><a class="acheck">공지사항</a></li>
						<li class="lilist"><a href="qnalist.action">문의사항</a></li>
						<li class="lilist"><a href="faqlist.action">FAQ</a></li>
						<li class="lilist"><a href="paymentlist.action">구매내역</a></li>
					</ul>

					<div style="height: 100%; margin-top: 9%;">


						<!-- 공지리스트 ////////////////////////////////////////////////////////////////////// -->
						<div
							style="margin: 5%; border: 2px solid black; height: 100%; margin-top: 4.7%;"
							class="w3-container">
							
							<div style="margin: 2%; height: 100%; margin-bottom: 9%; margin-right: 0;">
							<button type="button" class="btn btn-info btnGJwrite" style="width: 150px; float: right;">글쓰기</button>
							</div>
							
							<div style="height: 100%; width: 100%;">
								<div style="height: 100%; width: 100%;">
									<dl
										style="text-align: center; background-color: gray; margin-bottom: 4%; vertical-align: bottom;">
										<dt style="float: left; width: 7%; overflow: hidden; text-overflow: ellipsis;">글번호</dt>
										<dt style="float: left; width: 35%; overflow: hidden; text-overflow: ellipsis;">제목</dt>
										<dt style="float: left; width: 15%; overflow: hidden; text-overflow: ellipsis;">작성일자</dt>
										<dt style="float: left; width: 15%; overflow: hidden; text-overflow: ellipsis;">작성자명</dt>
										<dt style="float: left; width: 8%; overflow: hidden; text-overflow: ellipsis;">조회수</dt>
										<dt style="float: left; width: 20%; overflow: hidden; text-overflow: ellipsis;">수정 / 삭제</dt>
									</dl>
									<hr>
									
									
									<!-- notice 리스트 -->
									<c:forEach var="notice" items="${noticeList }">
										<dl style="text-align: center;">
											<dd style="float: left; width: 7%; overflow: hidden; text-overflow: ellipsis; height: 33px; padding-top: 0.9%;">
											${notice.noticeId }</dd>
											<dd style="float: left; width: 35%; overflow: hidden; text-overflow: ellipsis; height: 33px; padding-top: 0.9%;">
											${notice.title }</dd>
											<dd style="float: left; width: 15%; text-overflow: ellipsis; height: 33px; padding-top: 0.9%;">
											${notice.noticedate }</dd>
											<dd style="float: left; width: 15%; overflow: hidden; text-overflow: ellipsis; height: 33px; padding-top: 0.9%;">
											${notice.adminid }</dd>
											<dd style="float: left; width: 8%; overflow: hidden; text-overflow: ellipsis; height: 33px; padding-top: 0.9%;">
											${notice.hitcount }</dd>
											<dd style="float: left; width: 20%; overflow: hidden; text-overflow: ellipsis; height: 33px; padding-top: 0.3%;">
												
												<button type="button" style="width: 40%;" class="btnGJupdate btn-xs btn btn-info" value="${notice.noticeId }">수정</button>
												<button type="button" style="width: 40%;" class="btnGJdelete btn-xs btn btn-warning" value="${notice.noticeId }">삭제</button>	
																						
											</dd>
										</dl>
									</c:forEach>
									


									<!-- 페이징 -->
									<div style="text-align: center; margin-top: 17%;">

										<nav>

											<ul class="pagination pagination-sm">
												
												<c:if test="${startPage > 1 }">
													<li><a href="/noticelist.action?page=1"><span aria-hidden="true">«</span><span
															class="sr-only">Previous</span></a></li>
												</c:if>
												
												<c:if test="${page > 1 }">
												<li><a href="/noticelist.action?page=${page-1 }"><span aria-hidden="true">〈</a></li>
												</c:if>
												
												
												<c:forEach var="item" begin="${startPage }" end="${endPage }" step="1">
													<c:choose>
														<c:when test="${item == page }">
															<li class="active"><a href="/noticelist.action?page=${item }">${item }</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="/noticelist.action?page=${item }">${item }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
												<c:if test="${page < totalPage }">
												<li><a href="/noticelist.action?page=${page+1 }">
													<span aria-hidden="true">〉</span>
													<span class="sr-only">Next</span>
												</a></li>
												</c:if>
												
												<c:if test="${endPage < totalPage }">
												<li><a href="/noticelist.action?page=${totalPage }">
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



 					 	
 					 	<!-- 생성 ////////////////////////////////////////////////////////////////////// -->
<div class="divGongSS" style=" display: none;">
<form action="noticeinsert.action" method="post" id="insertform">
						<ul class="">
							<li class="lilist licheck" style="margin-top: -6%;"><a class="acheck">공지사항 생성</a></li>
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

									<button type="button" class="btn btn-info btnAdd"
										style="float: right; margin-left: 1%; width: 150px; margin-bottom: 2%;">올리기</button>
										<!-- onclick="location.href='noticeinsert.action'" -->

								</div>
							</div>
						</div>
</form>
</div>

						<!-- 수정 ////////////////////////////////////////////////////////////////////// -->
<div class="divGongSJ" style="display: none;">
<form action="noticeupdate.action" method="post" id="updateform">
						<ul class="">
							<li class="lilist licheck" style="margin-top: -6%;"><a class="acheck">공지사항 수정</a></li>
						</ul>

						<div
							style="margin: 5%; border: 2px solid black; height: 100%; margin-top: 10.8%;"
							class="w3-container">
							<div style="height: 100%; width: 100%;">
								<div style="height: 100%; width: 100%;">

									<div style="margin: 2%; margin-top: 3%;">
										<input type="text"
											style="border: 2px solid gray; margin: 1%; margin-top: 0; width: 98%; border-radius: 7px; margin-bottom: 0;"
											placeholder="전에있던내용 뿌려주자~" id="title" name="title">
									</div>
									<div style="margin: 3%; margin-top: 1%;">
										<textarea rows="5" cols="5"
											style="min-width: 100%; max-width: 100%; resize: none;"
											placeholder="전에있던내용 뿌려주자~" id="content" name="content"></textarea>
									</div>

									<button type="submit" class="btn btn-info btnupdateC"
										style="float: right; margin-left: 1%; width: 150px; margin-bottom: 2%;">수정</button>
										<!-- onclick="location.href='noticeupdate.action?'" -->
										

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






















