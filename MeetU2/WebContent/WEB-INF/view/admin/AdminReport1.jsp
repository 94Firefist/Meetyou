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
<title>AdminReport1.jsp (신고접수게시판)</title>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="<%=cp%>/css/AdminReport.css">

<script src="<%=cp%>/js/ajax/ajax.js"></script>

<script type="text/javascript">
	$(function()
	{

		/* 신고상세내용 클릭 */
		$(".reportContent").click(function()
		{
			//alert("클릭됐다1");
			//데이터 수집 (접수번호 얻어옴)
			//$("#reportTest1").val($(this).val());

// 			alert(this.value);
			$("#Irep_type").val($("#Irep_type" + $(this).val()).html());
			$("#Irep_date").val($("#Irep_date" + $(this).val()).html());
			$("#Irep_id").val($("#Irep_id" + $(this).val()).html());
			
			
			//URL구성
			var url = "reportDetail.action?reportTest1=" + this.value; //접수번호를 get방식으로 reportDetail으로 보냄

			//XMLHttpRequest 객체 생성
			ajax = createAjax();

			ajax.open("GET", url, true);

			ajax.onreadystatechange = function()
			{
				if (ajax.readyState == 4)
				{
					//alert(ajax.status);
					if (ajax.status == 200)
					{
						callBack();
					}
				}
			}
			ajax.send("");

		});

		//AJAX 요청이 완료된 후 호출되는 최종 함수(콜백함수)
		function callBack()
		{
			
// 			alert("콜백22");
			//검색버튼을 클릭하여 이 함수의 결과를 보기 전에
			//브라우저에 직접 다음과 같이 입력하여 XML문서라 어떻게 나오는지 확인한다.
			
			//XML 문서 전체의 참조 객체, 흔히 XML문서 객체라고 한다.
			var doc = ajax.responseXML;
			
			//XML문서의 최상위 엘리먼트, 현재문서에는 <list>태그가 최상위 엘리멘트이다.
			var root = doc.documentElement;

			
			//------------------------------------입력 완료
			
				
			//검색결과가 있으면 돌면서 각 정보 가져오기
				
			var rep_type = root.getElementsByTagName("rep_type")[0];
			var rep_content = root.getElementsByTagName("rep_content")[0];
			var rep_date = root.getElementsByTagName("rep_date")[0];
			
			//태그가 가지는 텍스트는 태그의 첫 번째 자식이고,
			//텍스트 노드의 값은 nodeValue로 가져온다.
			var reptype_nameText = rep_type.firstChild.nodeValue;
			var panaltypol_contentText = rep_content.firstChild.nodeValue;
			//var panaltyty_contentText = panaltyty_content.firstChild.nodeValue;
			//var panaltydayText = panaltyday.firstChild.nodeValue;
			var rep_dateText = rep_date.firstChild.nodeValue;
			//var reppro_dateText = reppro_date.firstChild.nodeValue;
			
			//input 박스에 추가하기
			$("#Irep_type").val(reptype_nameText);
			$("#Irep_panalty").val(panaltypol_contentText);
			//$("#reportTest2").val(panaltyty_contentText);
			$//("#panaltyDay").val(panaltydayText);
			$("#Irep_date").val(rep_dateText);
			//$("#Ireppro_date").val(reppro_dateText);
					


		}

		/*=== 셀렉박스 선택에 따라 정렬 */

		/*1.신고접수 신고대상타입에 따라 정렬*/
		$("#repsel").change(function()
		{

// 			alert("바꼈다1!!!");
			$("#imemberForm").submit();
			/* // value 값으로 선택
			$(this).val("1").prop("selected", true);
			
			// OR option 순서값으로 선택
			$(this).find("option:eq(0)").prop("selected", true); */

		});

		/*2.신고자에 따른 검색*/
		$("#imemberSearch").click(function()
		{
// 			alert("신고자검색");
			$("#imemberForm").submit();
		});

		
		/*모달1 제재처리 옵션 뿌려주기*/
		$("#repprosel2").change(function()
		{
// 			alert("모달1 제재처리선택");
// 			alert(this.value); //처리코드

			/* $("#optionPanForm").submit(); */
		
			
		});
		
	});

	/* 전체선택 및 해제 */
	$("#allcheck").click(function()
		{ //만약 전체 선택 체크박스가 체크된상태일경우 

			//alert($("#allcheck").is(":checked"));
			if ($("#allcheck").is(":checked"))
			{ //해당화면에 전체 checkbox들을 체크해준다

				$("input[type=checkbox]").prop("checked", true);
				// 전체선택 체크박스가 해제된 경우 
			} else
			{ //해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked", false);
			}
		});
</script>


</head>
<body>

	<c:import url="../Menu.jsp"></c:import>
	
	<div class="container" style="width: 75%; height: 100%;">

		<div class="w3-row" style="width: 100%; height: 100%" >

			<div class="w3-quarter"
				style="border-right: 2px solid gray; margin-top: 10%; text-align: center; font-size: 25px; line-height: 50px; font-weight: bold; padding: 3%;">

				<div>
					<a href="/grouplist.action"><span>그룹 관리</span></a>
				</div>

				<div>
					<a href="/memberlist.action"><span>회원 관리</span></a>
				</div>

				<div>
					<a href="/noticelist.action"><span>서비스 관리</span></a>
				</div>

				<div>
					<span style="color: orange;">운영 관리</span>
				</div>

			</div>

			<div class="w3-threequarter"
				style="width: 75%; height:100%; margin-top: 3%;">
				
				<div style="width: 100%; height:90%; padding: 5%;">

					<div style="margin-bottom: 3%; height: 7%; width: 100%;">
					
						<span
							style="padding: 2%; background-color: #000000; font-size: 20px; border-radius: 6px; color: white; float: left">
							<span>미츄 신고접수관리</span>
						</span>
						<div style="height: 100%; width: 50%; /* border: 4px solid blue; */ padding: 1%; float: left;">
							<div>
								<a href="/reportList.action">
									<button type="button" class="btn btn-warning btn-link active" style="float: left; margin-right: 1%;">
										<span style="font-weight: bold; color: black;">신고접수</span>
									</button>
								</a>
								<a href="/reportList2.action">
								<button type="button" class="btn btn-success btn-link active">
									<span style="font-weight: bold; color: black;">신고처리</span>
								</button>
								</a>
							</div>
						</div>
					</div>
					<form id="imemberForm" style="width: 100%; height: 100%;"
				action="imemberSearch.action" method="post">
				<div style="height: 98%; width: 100%; margin-top: 2%; padding: 1%;"
					class="w3-container">

					<div
						style="width: 100%; height: 40px; padding: 1%;">


						<div
							style="width: 60%; height: 100%; float: left; padding-left: 1%;">
							<input id="imember_id" name="imember_id" class="" type="text"
								style="width: 30%;" placeholder="신고자 아이디를 입력하세요.">
							<button id="imemberSearch" type="button"
								class="ui-button ui-corner-all">신고자 검색</button>
						</div>
<!-- 						<div -->
<!-- 							style="width: 40%; height: 100%; float: left; text-align: right; padding-right: 1%;"> -->
<!-- 							<button id="selDel1" type="button" -->
<!-- 								class="ui-button ui-corner-all" data-toggle="modal" -->
<!-- 								data-target="#reportModal0">선택신고처리</button> -->
<!-- 						</div> -->


					</div>



					<!-- Tab panes -->
					<div class="tab-content"
						style="width: 100%; height: 100%; padding: 1%;">

						<!-- 처리 전 -->
						<div role="tabpanel" class="tab-pane active" id="before"
							style="width: 100%; height: 100%; padding: 1%">

							<!-- 신고 게시판 리스트 영역 -->
							<div
								style="width: 100%; height: 8%; padding: 0.5%; border-bottom: 2px solid gray; border-top: 2px solid gray; margin-bottom: 0.5%;">

<!-- 								<div -->
<!-- 									style="float: left; width: 6%; margin-top: 0.5%; text-align: center;"> -->
<!-- 									<input type="checkbox" id="allcheck"> -->
<!-- 								</div> -->

<!-- 								<div -->
<!-- 									style="float: left; width: 5%; margin-top: 0.5%; text-align: center;">번호</div> -->
								<div
									style="float: left; width: 12%; margin-top: 0.5%; text-align: center;">신고접수번호</div>
								<div
									style="float: left; width: 12%; margin-top: 0.5%; text-align: center;">신고자아이디</div>
								<div
									style="float: left; width: 13%; margin-top: 0.5%; text-align: center;">신고대상아이디</div>
								<div
									style="height: 75%; float: left; width: 15%; margin-top: 0.5%; text-align: center;">
									<select id="repsel" name="repsel" style="height: 100%;">
										<option selected='selected' value="0"
											${repsel == 0 ? "selected" : ""}>신고대상타입</option>
										<c:forEach var="option1" items="${optionList1 }">
											<option value="${option1.leaderType_id }"
												${repsel == option1.leaderType_id ? "selected" : ""}>${option1.leaderType_info}</option>
										</c:forEach>
									</select>
								</div>
								<div
									style="height: 75%; float: left; width: 15%; margin-top: 0.5%; text-align: center;">
									신고유형
								</div>
								<div
									style="float: left; width: 17%; margin-top: 0.5%; text-align: center;">신고접수상세내용</div>
								<div
									style="float: left; width: 12%; margin-top: 0.5%; text-align: center;">신고접수일자</div>

							</div>

							<!-- 게시판 번호, 신고접수아이디, 신고자아이디, 신고대상아이디, 신고유형,신고대상타입, 신고내용, 신고일자-->
							<!-- 게시판 내용 -->
							<%-- ${reportList["0"].lUMember_id} --%>
							<div class="reportContents"
								style="width: 100%; height: 70%; padding: 0.5%;">
								<%	int a = 0;	%>
								<c:forEach var="report" items="${reportList}">

									<div id="reports"
										style="width: 100%; height: 8%; border: 1px solid black; padding: 0.5%; overflow: hidden;">

<!-- 										<div -->
<!-- 											style="float: left; width: 5%; margin-top: 0.5%; text-align: center;"> -->
<%-- 											<input id="chkBox${report.report_id}" name="chkBox" --%>
<%-- 												value="${report.report_id}" type="checkbox"> --%>
<!-- 										</div> -->

<!-- 										<div -->
<!-- 											style="float: left; width: 5%; margin-top: 0.5%; text-align: center;" -->
<%-- 											class="report">${a = a + 1}</div> --%>
										<div style="float: left; width: 12%; margin-top: 0.5%; text-align: center;" class="report" id="Irep_id${report.report_id}" >
											${report.report_id}
										</div>
										<div style="float: left; width: 12%; margin-top: 0.5%; text-align: center;" class="report">
											${report.lIMember_id}
										</div>
										<div style="float: left; width: 13%; margin-top: 0.5%; text-align: center;" class="report">
											${report.lUMember_id}
										</div>
										<div style="float: left; width: 15%; margin-top: 0.5%; text-align: center;" class="report">
											${report.leaderType_info}
										</div>
										<div style="float: left; width: 15%; margin-top: 0.5%; text-align: center;" class="report" id="Irep_type${report.report_id}">
											${report.repType_name}
										</div>
										<div style="float: left; width: 17%; margin-top: 0.5%; text-align: center;" class="report">
											<button type="button" id="reportContent" class="btn btn-link report reportContent" value="${report.report_id}"
												style="background-color: white; padding: 0;" data-toggle="modal" data-target="#reportModal1">
												상세내용보기
											</button>
										</div>

										<div
											style="float: left; width: 12%; margin-top: 0.5%; text-align: center;"
											class="report" id="Irep_date${report.report_id}">${report.report_date}</div>
									</div>
								</c:forEach>

							</div>
							
							<%--
							<!-- 페이징처리 -->
							<div
								style="width: 100%; height: 12%; padding: 0;">
								<div style="height: 100%; text-align: center; margin: 0;">
									<ul class="pagination">
										<li class="disabled"><a href="#">«</a></li>
										<li class="active"><a href="#">1 <span
												class="sr-only">(current)</span></a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">»</a></li>
									</ul>
								</div>
							</div>
 							--%>
 							<!-- 페이징처리 끝 -->
 							
 							
							</div>
					</div>
						
				</div>
			</form>



			
			</div>
			
		</div>
	</div>
	</div>

	




	<!-- Modal0 -->
	<%-- 
	<div class="modal" id="reportModal0" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content"
				style="min-height: 500px; height: 500px; border: 2px solid red;">

				<div class="modal-header" style="height: 10%; padding: 0.5%;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" style="padding: 1.5%; font-weight: bold;">선택된
						신고접수(을)를 일괄처리하시겠습니까?</h4>
				</div>

				<!-- 선택된 신고접수 리스트 뿌려줄곳 -->
				<div class="modal-body"
					style="height: 80%; width: 100%; border: 2px solid red; padding: 0.5%;">
					<div style="width: 100%; height: 100%; padding: 1.5%;">
						<%
							int c = 0;
						%>
						<div style="width: 100%; height: 10;">
							<c:forEach var="repNum" items="${repNumList }">
								<div class="repNums">
									<div class="repNum"
										style="width: 33%; height: 100%; float: left; text-align: center;">
										번호 : ${a = a + 1}</div>
									<div id="repNumId" class="repNum"
										style="width: 33%; height: 100%; float: left; text-align: center;">
										신고접수번호 :</div>
									<div class="repNum"
										style="width: 33%; height: 100%; float: left; text-align: center;">
										신고접수일자 :</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="modal-footer"
					style="height: 10%; border: 2px solid red; padding: 0.5%;">
					<button type="button" class="btn btn-default" data-dismiss="modal">뒤로가기</button>
					<button type="button" class="btn btn-primary">확인</button>
				</div>
			</div>
		</div>

	</div>
 	--%>

	<!-- Modal1 -->
	<div class="modal" id="reportModal1" tabindex="-1" role="dialog"
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
							<h4>다음의 신고내용이 접수 되었습니다.</h4>
							<div class="modal-title" style="float: left;">
								신고유형 : <input type="text" readonly="readonly" id="Irep_type">
							</div>
							<div style="float: left; position: relative; left: 10%;">
								신고일자 : <input type="text" readonly="readonly" id="Irep_date" name="Irep_date">
							</div>
						</div>
					</div>
	
					
					<div class="modal-body" style="height: 64%; width:100%; padding: 1%;">
						<div style="height: 80%; width:100%; padding: 2.5%; text-align: center;" >
							<div style="border:red solid 2px; padding: 1.5%; height: 100%; width:47%; float:left; margin-right:20px; ">
								<h5><strong>※ 신고접수상세내용</strong></h5>
								<textarea rows="5" cols="30" style="overflow-y: scroll;" readonly="readonly"
									id="Irep_panalty"></textarea>
							</div>
							<div style="border:red solid 2px; padding: 1.5%; height: 100%; width:47%; float:left;">
								<h5><strong>※ 신고처리상세내용</strong></h5>
								<textarea rows="5" cols="30" style="overflow-y: scroll;"
									id="reportTest2" name="reportTest2"></textarea>
							</div>
						</div>
						<div style="height: 10%; width:100%; padding: 0.5%;">
							<div style="padding: 1.5%; hight: 100%; float:left;">
								<select name="repprosel2" id="repprosel2" style="height: 100%;">
<!-- 									<option selected='selected' value="0" -->
<%-- 										${repprosel == 0 ? "selected" : ""}>제재처리</option> --%>
									<c:forEach var="option3" items="${optionList3}">
										<option value="${option3.panalty_id }" 
											${repprosel == option3.panalty_id ? "selected" : ""}>${option3.panaltyPol_id }
										</option>
									</c:forEach>
								</select>
							</div>
							<!-- (REPPRO_ID, LMEMBER_ID, REPORT_ID, PANALTYPOL_ID(repprosel2), REPPRO_CONTENT(reportTest2), REPPRO_DATE(Irep_date) -->
							<input id="Irep_id"  name="report_id" type="text" readonly="readonly" hidden="hidden"> 
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



<div style="clear: both; position: relative;">
	<c:import url="../BottomBar.jsp"></c:import>
</div>



</body>
</html>