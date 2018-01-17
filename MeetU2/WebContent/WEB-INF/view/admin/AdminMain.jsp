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

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 기본 CSS import -->
<c:import url="../import/head.jsp"></c:import>

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
		$('input[type="text"]').keydown(function() {
		    if (event.keyCode === 13) {
		        event.preventDefault();
		    }
		});
		
		// 검색 키워드 남기기
		if('${filterDTO.group_name}' != '')
		{
			$("#groupSearchName").val("${filterDTO.group_name}");
		}
		
		
		$("#grNameSearch").click(function()
		{
			// 공백이면 전체가 검색되도록 에러메세지 삭제
			$("#groupSearchName").val($("#groupSearchName").val().trim());
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
		$(".formSelSubmit").change(function()
		{
			$("#groupSearchForm").submit();
		})
		$(".formBtnSubmit").click(function()
		{
			if ( '${filterDTO.sort}' == $(this).val()) {
				$("#filter").val('10' + $(this).val());
			} else {
				$("#filter").val($(this).val());
			}
			$("#groupSearchForm").submit();
		});
		
		$(".formPageBtn").click(function()
		{
			$("#page").val($(this).val());
			$("#groupSearchForm").submit();
		})
		
		switch ('${filterDTO.sort}')
		{
		//    
		case '1':
			$("#groupNumber").html($("#groupNumber").html()+'▼');
			break;
		case '2':
			$("#groupName").html($("#groupName").html()+'▼');
			break;
		case '3':
			$("#groupMaster").html($("#groupMaster").html()+'▼');
			break;
		case '4':
			$("#groupMemberCount").html($("#groupMemberCount").html()+'▼');
			break;
		case '5':
			$("#groupCreateDate").html($("#groupCreateDate").html()+'▼');
			break;
		case '101':
			$("#groupNumber").html($("#groupNumber").html()+'▲');
			break;
		case '102':
			$("#groupName").html($("#groupName").html()+'▲');
			break;
		case '103':
			$("#groupMaster").html($("#groupMaster").html()+'▲');
			break;
		case '104':
			$("#groupMemberCount").html($("#groupMemberCount").html()+'▲');
			break;
		case '105':
			$("#groupCreateDate").html($("#groupCreateDate").html()+'▲');
			break;
		default:
			alert('안됨');
			break;
		}
		

	});
	
	
	
</script>


<style type="text/css">
	select
	{
		width: 100%;
		-webkit-appearance: none; 
		-moz-appearance: none; 
		appearance: none;
	}
	option
	{
		text-align:center; 
	}
</style>


</head>
<body class="background">
	
	<c:import url="../Menu.jsp"></c:import>
	
	<div class="container" style="height: 100%; width: 75%;">

		<div class="w3-row" style="height: 100%; width: 100%;">

			<div class="w3-quarter"
				style="border-right: 2px solid gray; margin-top: 10%; text-align: center; font-size: 25px; line-height: 50px; font-weight: bold; padding: 3%;">

				<div>
					<a href="/grouplist.action"><span style="color: orange;">그룹 관리</span></a>
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

			<div class="w3-threequarter" style="width: 75%; height: 100%; margin-top: 3%;">

				<div style="width: 100%; height: 100%; padding: 5%;">

					<div style="margin-bottom: 3%; height: 10%; width: 100%;">
						<span style="padding: 2%; background-color: #000000; font-size: 20px; border-radius: 6px; color: white;">미츄 그룹 관리</span>
					</div>

					<!-- 리스트 ////////////////////////////////////////////////////////////////////// -->
					<form action="/grouplist.action" method="post" id="groupSearchForm"	style="height: 80%; width: 100%;">
						<div style="border: 4px solid black; height: 100%; width: 100%; margin-top: 2%; padding: 1%;" class="w3-container">
							
							<!-- 핑크 -->
							<div class="" style="height: 10%; width: 100%; padding: 2%; margin-bottom: 2%;">
								
								<!-- 그룹명검색 -->
								 
								<div class="grNameSel" style=" float: left; height: 100%; width: 30%; display: inline; margin-top: 0.5%; margin-right: 1%;">
									<input id="groupSearchName" name="groupSearchName" class="" type="text" style="width: 60%; height:100%;" placeholder="그룹명을 입력하세요." value="${fliterDTO.group_name}">
									<button id="grNameSearch" type="button" style="width: 30%; height:100%;" class="ui-button ui-corner-all">검색</button>
								</div>
							</div> 


							<!-- 그룹인덱스 리스트 뿌릴 영역 -->
							<div class="btn-group btn-group-justified" role="group" aria-label="..." style="height: 6%; width: 100%; margin-bottom: 1%;">
								<input type="hidden" id="filter" name="filter" value="${filterDTO.sort}">
								<button type="button" class="btn btn-default formBtnSubmit" value="1" id="groupNumber" name="number" style="height: 100%; width: 5%; float: left; margin-top: 0.5%;">
									NO
								</button>
								<button type="button" class="btn btn-default formBtnSubmit" value="2" id="groupName" name="groupName" style="height: 100%; width: 18%; float: left; margin-top: 0.5%;">
									그룹명
								</button>
								<button type="button" class="btn btn-default formBtnSubmit" value="3" id="groupMaster" name="groupMaster" style="height: 100%; width: 8%; float: left; margin-top: 0.5%;">
									그룹장
								</button>
								<button type="button" class="btn btn-default formBtnSubmit" value="4" id="groupMemberCount" name="groupMemberCount" style="height: 100%; width: 7%; float: left; margin-top: 0.5%;">
									멤버수
								</button>
								<button type="button" class="btn btn-default formBtnSubmit" value="5" id="groupCreateDate" name="groupCreateDate" style="height: 100%; width: 13%; float: left; margin-top: 0.5%;">
									그룹생성날짜
								</button>
								<select class="btn btn-default formSelSubmit" id="groupCategory" name="groupCategory" style="height: 100%; width: 23%; float: left; margin-top: 0.5%;">
									<option value="">카테고리</option>
									<c:set var="options" value="${categorys}" scope="request"></c:set>
									<c:set var="optionSel" value="${filterDTO.category_code}" scope="request"></c:set>
									<c:import url="${cp}import/IPubilcOptions.jsp"></c:import>
								</select>

								<select class="btn btn-default formSelSubmit" id="groupCity" name="groupCity" style="height: 100%; width: 12%; float: left; margin-top: 0.5%;">
									<option value="">지역</option>
									<c:set var="options" value="${city_Types}" scope="request"></c:set>
									<c:set var="optionSel" value="${filterDTO.cityPe_id}" scope="request"></c:set>
									<c:import url="${cp}import/IPubilcOptions.jsp"></c:import>
								</select>
								<select class="btn btn-default formSelSubmit" id="groupPublic" name="groupPublic" style="height: 100%; width: 13%; float: left; margin-top: 0.5%; text-align: center; padding: auto;">
									<option value="">검색공개</option>
									<c:set var="options" value="${groupPublics}" scope="request"></c:set>
									<c:set var="optionSel" value="${filterDTO.grPublic_id}" scope="request"></c:set>
									<c:import url="${cp}import/IPubilcOptions.jsp"></c:import>
								</select>
							</div>

							<div class="" style=" float: left; height: 80%; width: 100%;">
								<c:import url="import/IAdmingrouplist.jsp"></c:import>	
							</div>

							


							<!-- 페이징 -->
							<div style="text-align: center; margin-top: 17%;">
								<input type="hidden" id="page" name="page">
								<nav>
									<ul class="pagination pagination-sm">
										
										<c:if test="${startPage > 1 }">
											<li>
												<button type="button" class="btn btn-link formPageBtn" value="1">
													<span aria-hidden="true">«</span>
													<span class="sr-only">Previous</span>
												</button>
											</li>
										</c:if>
										
										<c:if test="${page > 1 }">
											<li>
												
												<button type="button" class="btn btn-link formPageBtn" value="${page-1 }">
													<span aria-hidden="true">＜</span>
													<span class="sr-only">Prev</span>
												</button>
											</li>
										</c:if>
										
										
										<c:forEach var="item" begin="${startPage }" end="${endPage }" step="1">
											<c:choose>
												<c:when test="${item == page }">
													<li class="active">
														<button type="button" class="btn btn-link formPageBtn" value="${item}">
															${item }
														</button>
													</li>
												</c:when>
												<c:otherwise>
													<li>
														<button type="button" class="btn btn-link formPageBtn" value="${item }">
															${item }
														</button>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
										<c:if test="${page < totalPage }">
											<li>
												<button type="button" class="btn btn-link formPageBtn" value="${page+1 }">		
													<span aria-hidden="true">〉</span>
													<span class="sr-only">Next</span>
												</button>
											</li>
										</c:if>
										
										<c:if test="${endPage < totalPage }">
											<li>
												<button type="button" class="btn btn-link formPageBtn" value="${totalPage }">
													<span aria-hidden="true">»</span>
													<span class="sr-only">END</span>
												</button>
											</li>
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
				<div class="modal-content" style="min-height: 200px; height: 200px;">
		
					<div class="modal-header" style="height: 25%; padding: 2.5%;" >
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div style="height: 10%; padding: 0;">
			
							<div  class="modal-title" style="float: left;">
								<div style="float: left;">그룹명 : &nbsp;</div> 
								<div id="groupNameModal" style="float: left;"></div>
							</div>
							<div  style="float: left; position: relative; left: 10%;">
								<div style="float: left;">그룹장아이디 : &nbsp;</div> 
								<div id="groupLeader"  style="float: left;">&nbsp;</div>
								<button type="button" style="background-color: white;">
									<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
								</button>
							</div>
							
						</div>
					</div>
	
					
					<div class="modal-body" style="height: 50%; width:100%; padding: 1%; border: 1px solid gray; ">
					
						<div class=""style="height: 50%; width: 100%; padding: 2%; padding-bottom: 0%; border-bottom: 1px solid black; ">
								<div class=""
									style="height: 100%; width: 18%; float: left; margin-top: 0.5%; text-align: center;">과거이벤트</div>	
								<div class=""
									style="height: 100%; width: 16%; float: left; margin-top: 0.5%; text-align: center;">미래이벤트</div>
								<div class=""
									style="height: 100%; width: 22%; float: left; margin-top: 0.5%; text-align: center;">최근이벤트생성</div>
								<div class=""
									style="height: 100%; width: 22%; float: left; margin-top: 0.5%; text-align: center;">최근이벤트개최</div>
								<div class=""
									style="height: 100%; width: 20%; float: left; margin-top: 0.5%; text-align: center;">휴면여부</div>		
						</div>
						<div class="" style=" float: left; height: 50%; width: 100%; padding: 2%;">
							<div id="groupInfoLists" style=" float: left; width: 100%; height: 100%;  padding: 0.5%;">
								<div id="past_event" style=" float: left; width: 18%; height: 100%; text-align: center;"></div>
								<div id="future_event" style=" float: left; width: 16%; height: 100%; text-align: center; "></div>
								<div id="event_curdate" style=" float: left; width: 22%; height: 100%; text-align: center; "></div>
								<div id="event_holddate" style=" float: left; width: 22%; height: 100%; text-align: center; "></div>
								<div id="group_stop" style=" float: left; width: 20%; height: 100%; text-align: center; "></div>
							</div>
						</div>
					
					</div>
	
					<div class="modal-footer"
						style="width: 100%; height: 25%; padding: 1%;">
						<div
							style="text-align: right; width: 100%; height: 100%; float: left;">
							<button type="button" class="btn btn-primary" data-dismiss="modal">뒤로가기</button>
							
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




















