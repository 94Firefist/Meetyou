<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String groupName = request.getParameter("groupName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자의 메인 그룹관리페이지</title>

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
	
	
	function groupInfo(i)
	{
		// past_event, future_event, current_create, current_hold
		//alert("되냐");
		//groupName, groupLeader
		$("#groupNameModal").html($("#groupname" +i).val() );
		$("#groupLeader"  ).html($("#groupleader"+i).html());
		
		
		$("#past_event"    ).html($("#pastevent" +i).val() );
		$("#future_event"  ).html($("#futureevent"+i).val());
		$("#event_curdate" ).html($("#eventcurdate"+i).val());
		$("#event_holddate").html($("#eventholddate"+i).val());
		$("#group_stop"    ).html($("#groupstop"+i).val());
		
	}
	
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
		// 검색 키워드 남기기
		if(<%=groupName != null%>)
		{
			$("#groupName").val("<%=groupName%>");
		}
		
		
		$("#grNameSearch").click(function()
		{
			// 공백이면 전체가 검색되도록 에러메세지 삭제
			$("#groupName").val($("#groupName").val().trim());
			$("#groupSearchForm").submit();
		});
		
		
		$(".groupDel").click(function()
		{
			//alert("그룹삭제클릭");
			
			alert(this.value);
			
		
			var con_test = confirm("정말 삭제하시겠습니까?");
			if(con_test)
			{
				$("#groupSearchForm").attr("action", "groupDel.action?group_id="+this.value );
	            $("#groupSearchForm").submit();
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
					<span style="color: orange;">그룹 관리</span>
				</div>

				<div>
					<a href="/memberlist.action"><span>회원 관리</span></a>
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
							style="padding: 2%; background-color: #000000; font-size: 20px;
							 border-radius: 6px; color: white;">미츄 그룹 관리</span>
					</div>

					<!-- 리스트 ////////////////////////////////////////////////////////////////////// -->
					<form action="/grouplist.action" method="post" id="groupSearchForm"
						style="height: 80%; width: 100%;">
						<div
							style="border: 4px solid black; height: 100%; width: 100%; margin-top: 2%; padding: 1%;"
							class="w3-container">
							
							<!-- 핑크 -->
							<div class=""
								style="height: 10%; width: 100%; padding: 2%; margin-bottom: 2%;">
								
								<!-- 그룹명검색 -->
								 
								<div class="grNameSel"
									style=" float: left; height: 100%; width: 30%; display: inline; margin-top: 0.5%; margin-right: 1%;">
					
									<input id="groupName" name="groupName" class="" type="text"
										style="width: 60%; height:100%;" placeholder="그룹명을 입력하세요.">
									<button id="grNameSearch" type="button" style="width: 30%; height:100%;"
										class="ui-button ui-corner-all">검색</button>
									
								</div>
								
							
							</div> <!-- 핑크 -->
							



							<!--핑크  -->



							<!-- 그룹인덱스 리스트 뿌릴 영역 -->
							<div class=""
								style="height: 10%; width: 100%; padding: 2%;">

								<div class=""
									style="height: 100%; width: 5%; float: left; margin-top: 0.5%; text-align: center;">NO</div>	
								<div class=""
									style="height: 100%; width: 18%; float: left; margin-top: 0.5%; text-align: center;">그룹명</div>
								<div class=""
									style="height: 100%; width: 8%; float: left; margin-top: 0.5%; text-align: center;">그룹장</div>
								<div class=""
									style="height: 100%; width: 7%; float: left; margin-top: 0.5%; text-align: center;">멤버수</div>
								<div class=""
									style="height: 100%; width: 13%; float: left; margin-top: 0.5%; text-align: center;">그룹생성날짜</div>
								<div class=""
									style="height: 100%; width: 15%; float: left; margin-top: 0.5%; text-align: center;">카테고리</div>
								<div class=""
									style="height: 100%; width: 12%; float: left; margin-top: 0.5%; text-align: center;">지역</div>
								<div class=""
									style="height: 100%; width: 13%; float: left; margin-top: 0.5%; text-align: center;">검색공개여부</div>
								<div class=""
									style="height: 100%; width: 8%; float: left; margin-top: 0.5%; text-align: center;">관리</div>
							</div>

							<div class="" style=" float: left; height: 80%; width: 100%; padding: 2%;">
								<% int i=0; %>
								<c:forEach var="groupList" items="${groupLists}">
									<div id="reportpros"
										style=" float: left; width: 100%; height: 10%; border: 1px solid black; padding: 0.5%;">
										<input id="pastevent<%=i %>" type="hidden" value="${groupList.past_event}">
										<input id="futureevent<%=i %>" type="hidden" value="${groupList.future_event}">
										<input id="eventcurdate<%=i %>" type="hidden" value="${groupList.current_create}">
										<input id="eventholddate<%=i %>" type="hidden" value="${groupList.current_hold}">
										<input id="groupstop<%=i %>" type="hidden" value="${groupList.grstatus_stop}">
										<div style=" float: left; width: 5%; height: 100%; text-align: center;">${groupList.group_id}</div>
										<div style=" float: left; width: 18%; height: 100%; text-align: center; ">
											<button  id="groupname<%=i %>" type="button" onclick="groupInfo(<%=i%>)"
													class="btn btn-link report reportContent"
													style="background-color: white; padding: 0;"
													data-toggle="modal" data-target="#groupInfoModal1"
													value="${groupList.group_name}">${groupList.group_name}</button>
										</div>
										<div id="groupleader<%=i++ %>" style=" float: left; width: 8%; height: 100%; text-align: center; ">${groupList.member_id}</div>
										<div style=" float: left; width: 7%; height: 100%; text-align: center; ">${groupList.group_memberCount}</div>
										<div style=" float: left; width: 13%; height: 100%; text-align: center; ">${groupList.group_credate}</div>
										<div style=" float: left; width: 15%; height: 100%; text-align: center; ">
											<c:choose> 
												<c:when test="${groupList.group_category!=null}">${groupList.group_category}</c:when>
												<c:otherwise>선택안함</c:otherwise>
											</c:choose>
										</div>
										<div style=" float: left; width: 12%; height: 100%; text-align: center; ">
											<c:choose> 
												<c:when test="${groupList.group_citypeName!=null}">${groupList.group_citypeName}</c:when>
												<c:otherwise>선택안함</c:otherwise>
											</c:choose>
										</div>
										<div style=" float: left; width: 13%; height: 100%; text-align: center; ">${groupList.public_gr}</div>
										<div style=" float: left; width: 8%; height: 100%; text-align: center; " >
											<button class="groupDel" value="${groupList.group_id}" type="button" class="btn btn-warning" >
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
													<li><a href="/grouplist.action?groupName=${groupName}&page=1"><span aria-hidden="true">«</span><span
															class="sr-only">Previous</span></a></li>
												</c:if>
												
												<c:if test="${page > 1 }">
												<li><a href="/grouplist.action?groupName=${groupName}&page=${page-1 }"><span aria-hidden="true">〈</a></li>
												</c:if>
												
												
												<c:forEach var="item" begin="${startPage }" end="${endPage }" step="1">
													<c:choose>
														<c:when test="${item == page }">
															<li class="active"><a href="/grouplist.action?groupName=${groupName}&page=${item }">${item }</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="/grouplist.action?groupName=${groupName}&page=${item }">${item }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
												<c:if test="${page < totalPage }">
												<li><a href="/grouplist.action?groupName=${groupName}&page=${page+1 }">
													<span aria-hidden="true">〉</span>
													<span class="sr-only">Next</span>
												</a></li>
												</c:if>
												
												<c:if test="${endPage < totalPage }">
												<li><a href="/grouplist.action?groupName=${groupName}&page=${totalPage }">
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
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
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
	</div>



	<!-- groupInfoModal11 -->
	<div class="modal" id="groupInfoModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog">
		
			<form id="optionPanForm" action="repproinsert.action" method="get">
				<div class="modal-content" style="min-height: 400px; height: 400px;">
		
					<div class="modal-header" style="height: 23%;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div style="height: 10%; padding: 0;">
			
							<div  class="modal-title" style="float: left;">
								그룹명 : <div id="groupNameModal"></div>
							</div>
							<div   style="float: left; position: relative; left: 10%;">
								그룹장 : <div id="groupLeader" ></div>
							</div>
						</div>
					</div>
	
					
					<div class="modal-body" style="height: 50%; width:100%; padding: 1%;">
					
						<div class=""
								style="height: 10%; width: 100%; padding: 2%;">
								<div class=""
									style="height: 100%; width: 13%; float: left; margin-top: 0.5%; text-align: center;">과거이벤트</div>	
								<div class=""
									style="height: 100%; width: 13%; float: left; margin-top: 0.5%; text-align: center;">미래이벤트</div>
								<div class=""
									style="height: 100%; width: 20%; float: left; margin-top: 0.5%; text-align: center;">최근이벤트생성</div>
								<div class=""
									style="height: 100%; width: 20%; float: left; margin-top: 0.5%; text-align: center;">최근이벤트개최</div>
								<div class=""
									style="height: 100%; width: 14%; float: left; margin-top: 0.5%; text-align: center;">휴면여부</div>		
						</div>
						<div class="" style=" float: left; height: 80%; width: 100%; padding: 2%;">
								
									<div id="groupInfoLists"
										style=" float: left; width: 100%; height: 10%; border: 1px solid black; padding: 0.5%;">
										<div id="past_event" style=" float: left; width: 5%; height: 100%; text-align: center;"></div>
										<div id="future_event" style=" float: left; width: 8%; height: 100%; text-align: center; "></div>
										<div id="event_curdate" style=" float: left; width: 7%; height: 100%; text-align: center; "></div>
										<div id="event_holddate" style=" float: left; width: 13%; height: 100%; text-align: center; "></div>
										<div id="group_stop" style=" float: left; width: 13%; height: 100%; text-align: center; "></div>
									</div>
						</div>
					
					</div>
	
					<div class="modal-footer"
						style="width: 100%; height: 13%; padding: 1%;">
						<div
							style="text-align: right; width: 100%; height: 100%; float: left;">
							<button type="button" class="btn btn-primary" data-dismiss="modal">뒤로가기</button>
							<button type="submit" class="btn btn-success" value="처리확인">확인</button>
						</div>
					</div>
	
				</div>
			</form>
		</div>
	</div>






<div>
	<c:import url="../BottomBar.jsp"></c:import>
</div>

</body>
</html>




















