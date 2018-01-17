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
<title>관리자의 메인 회원 관리페이지</title>

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

<!-- 그룹검색을 위한 버튼생성 -->
<script>
	$(function()
	{
		$("button, input, .hhh").click(function(event)
		{
			event.preventDefault();
		});
	});
</script>

<script type="text/javascript">
	$('#myModal1').on('shown.bs.modal', function()
	{
		$('#myInput').focus()
	})
</script>
<script type="text/javascript">
	$('#myModal2').on('shown.bs.modal', function()
	{
		$('#myInput').focus()
	})
</script>

<!-- <!-- 셀렉 선택에 따른 -->
<!--<script>
$(document).ready(
		function()
		{
			$("#groupSearch").change(
					function()
					{
						//alert("되냐");
						//alert($("#groupSearch").val());
						if ($("#groupSearch").val() == 1)
						{
							$(".grNameSel").css("display", "inline");
							$(".grCityCatSel").css("display", "none");
						
						} else if ($("#groupSearch").val() == 2 || $("#groupSearch").val() == 3) 
						{
							$(".grgrCityCatSel").css("display", "inline");
							$(".grNameSel").css("display", "none");
						}
					})
		});
</script> -->


<!-- 회원검색시 -->
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#err").css("display", "none");
		$(".btnSearch").click(function()
		{

			if ($("#mbNameInput").val() == "")
			{
				$("#err").css("display", "inline");
				return;
			} else
			{
				$("#err").css("display", "none");
			}
			$("#memberSearchForm").submit();
		});
		
		/* 페이징 처리 */
		$(".paging").click(function()
		{
			//alert($(this).html());
			var url = "memberlist.action?pageNum=" + $(this).html();
			$(this).attr("href", url);
		});
		
		
		$(".memberDel").click(function()
		{
			//alert("그룹삭제클릭");
			
			alert(this.value);
			
		
			var con_test = confirm("정말 삭제하시겠습니까?");
			if(con_test)
			{
				$("#memberListForm").attr("action", "memberDel.action?member_id="+this.value );
	            $("#memberListForm").submit();
			}
			else	
			{
				
			}
			
		});
		
		
	})
</script>





</head>
<body>

	<c:import url="../Menu.jsp"></c:import>
	
	
	<div class="container" style="height: 100%; width: 75%;">

		<div class="w3-row" style="height: 100%; width: 100%;">

			<div class="w3-quarter"
				style="border-right: 2px solid gray; margin-top: 10%; text-align: center; font-size: 25px; line-height: 50px; font-weight: bold; padding: 3%;">

				<div>
					<a href="/grouplist.action"><span>그룹 관리</span></a>
				</div>

				<div>
					<span style="color: orange;">회원 관리</span>
				</div>

				<div>
					<a href="/noticelist.action"><span>서비스 관리</span></a>
				</div>

				<div>
					<a href="/reportList.action"><span>운영 관리</span></a>
				</div>

			</div>

			<div class="w3-threequarter"
				style="width: 75%; height: 100%; margin-top: 3%;">

				<div style="width: 100%; height: 100%; padding: 5%;">

					<div style="margin-bottom: 3%; height: 10%; width: 100%;">
						<span
							style="padding: 2%; background-color: #000000; font-size: 20px; border-radius: 6px; color: white;">미츄
							회원 관리</span>
					</div>

					<!-- 리스트 ////////////////////////////////////////////////////////////////////// -->
					<form action="/memberListForm.action" method="post" id="memberListForm"
						style="height: 80%; width: 100%;">
						<div
							style="border: 4px solid black; height: 100%; width: 100%; margin-top: 2%; padding: 1%;"
							class="w3-container">

							<%-- 
							<!-- 핑크 -->
							<div class=""
								style="height: 10%; width: 100%;  padding: 2%; margin-bottom: 2%;">
								
								<!-- 회원명검색 -->
								
								<div class="mbNameSel"
									style=" float: left; height: 100%; width: 30%; display: inline; margin-top: 0.5%; margin-right: 1%;">
									
									
									<input id="mbNameInput" name="mbNameInput" class="" type="text"
										style="width: 60%; height:100%;" placeholder="회원명을 입력하세요.">
									<button id="mbNameSearch" type="button" style="width: 30%; height:100%;"
										class="ui-button ui-corner-all">검색</button>
									<div style="width: 10%; height: 100%; float: left; padding-top: 0.5%; padding-left: 0;">
										<span id="err" class="err" style="text-align: center; color: red;">항목을 입력해야 합니다.</span>
									</div> 
									
								</div>
								
							
							</div> <!-- 핑크 -->	
							--%>


							<!--핑크  -->



							<!-- 회원인덱스 리스트 뿌릴 영역 -->
							<div class=""
								style="height: 10%; width: 100%; padding: 2%;">

								<div class=""
									style="height: 100%; width: 10%; float: left; margin-top: 0.5%; text-align: center;">회원아이디</div>	
								<div class=""
									style="height: 100%; width: 15%; float: left; margin-top: 0.5%; text-align: center;">회원명</div>
								<div class=""
									style="height: 100%; width: 10%; float: left; margin-top: 0.5%; text-align: center;">가입그룹수</div>
								<div class=""
									style="height: 100%; width: 13%; float: left; margin-top: 0.5%; text-align: center;">회원가입일</div>
								<div class=""
									style="height: 100%; width: 15%; float: left; margin-top: 0.5%; text-align: center;">참석이벤트수</div>
								<div class=""
									style="height: 100%; width: 13%; float: left; margin-top: 0.5%; text-align: center;">최근참석일</div>
								<div class=""
									style="height: 100%; width: 13%; float: left; margin-top: 0.5%; text-align: center;">최근접속일</div>
								<div class=""
									style="height: 100%; width: 8%; float: left; margin-top: 0.5%; text-align: center;">관리</div>
							</div>

							<div class="" style=" float: left; height: 80%; width: 100%; padding: 2%;">
								 
								<c:forEach var="member" items="${memberList}">
									<div 
										style=" float: left; width: 100%; height: 10%; border: 1px solid black; padding: 0.5%;">
										
										<div style=" float: left; width: 10%; height: 100%; text-align: center;">${member.lMember_id}</div>
										<div style=" float: left; width: 15%; height: 100%; text-align: center;">${member.member_realId}</div>
										<div style=" float: left; width: 10%; height: 100%; text-align: center;">${member.joinGrCount}</div>
										<div style=" float: left; width: 13%; height: 100%; text-align: center;">${member.member_join}</div>
										<div style=" float: left; width: 15%; height: 100%; text-align: center;">
											<c:choose> 
												<c:when test="${member.atEvent!=null}">${member.atEvent}</c:when>
												<c:otherwise>기록없음</c:otherwise>
											</c:choose>
										</div>
										<div style=" float: left; width: 13%; height: 100%; text-align: center;">
											<c:choose> 
												<c:when test="${member.curEveAttend!=null}">${member.curEveAttend}</c:when>
												<c:otherwise>기록없음</c:otherwise>
											</c:choose>
										</div>
										<div style=" float: left; width: 13%; height: 100%; text-align: center;">
											<c:choose> 
												<c:when test="${member.curLogIn!=null}">${member.curLogIn}</c:when>
												<c:otherwise>기록없음</c:otherwise>
											</c:choose>
										</div>
										<div style=" float: left; width: 8%; height: 100%; text-align: center;">
											<button class="memberDel" value="${member.lMember_id}" type="button" class="btn btn-warning" >
												삭제
											</button>
										</div>
									</div>
								</c:forEach> 
					
							</div>

							


							<!-- 페이징 -->
							<div style="text-align: center; margin-top: 17%;">

								<nav>

									<ul class="pagination pagination-sm">
										
										<c:if test="${startPage > 1 }">
											<li><a href="/memberlist.action?page=1"><span aria-hidden="true">«</span><span
													class="sr-only">Previous</span></a></li>
										</c:if>
										
										<c:if test="${page > 1 }">
										<li><a href="/memberlist.action?page=${page-1 }"><span aria-hidden="true">〈</span></a></li>
										</c:if>
										
										
										<c:forEach var="item" begin="${startPage }" end="${endPage }" step="1">
											<c:choose>
												<c:when test="${item == page }">
													<li class="active"><a href="/fmemberlist.action?page=${item }">${item }</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="/memberlist.action?page=${item }">${item }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
										<c:if test="${page < totalPage }">
										<li><a href="/memberlist.action?page=${page+1 }">
											<span aria-hidden="true">〉</span>
											<span class="sr-only">Next</span>
										</a></li>
										</c:if>
										
										<c:if test="${endPage < totalPage }">
										<li><a href="/memberlist.action?page=${totalPage }">
											<span aria-hidden="true">»</span>
											<span class="sr-only">END</span>
										</a></li>
										</c:if>
										
									</ul>
								</nav>
							</div>
							
							
						</div>
					</form>





				</div>
			</div>
		</div>
	</div>
	<!-- container -->
	





	<!-- Modal1 
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">[ 잠금 ]</h4>
				</div>
				<div class="modal-body">정말 잠금하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">잠금</button>
				</div>
			</div>
		</div>
	</div> -->
	<!-- Modal2 -->
	<!-- <div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">[ 삭제 ]</h4>
				</div>
				<div class="modal-body">정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">삭제</button>
				</div>
			</div>
		</div>
	</div> -->


<div>
	<c:import url="../BottomBar.jsp"></c:import>
</div>

</body>
</html>




















