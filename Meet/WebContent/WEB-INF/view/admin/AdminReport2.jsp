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
<title>AdminReport1.jsp (신고처리게시판)</title>
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

		
		/* 신고처리내용 클릭 */
		$(".reportproContent").click(function()
		{
// 			alert("클릭됐다2");
			
			//데이터수집
			//$(this).val() 로 처리아이디 가져옴
			//$("#Irep_type").val($("#Irep_type" + $(this).val()).html());
			
			//URL구성
			var url = "/reportproDetail2.action?reportTest2="+this.value;
			
			//XMLHttpRequest 객체 생성
			ajax = createAjax();

			ajax.open("GET", url, true);

			ajax.onreadystatechange = function()
			{
				if (ajax.readyState == 4)
				{
// 					alert(ajax.status);
					if (ajax.status == 200)
					{
						callBack();
					}
				}
			}
			ajax.send("");
		})
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
				
			var Ireppro_date = root.getElementsByTagName("Ireppro_date")[0];
			var Irep_type = root.getElementsByTagName("Irep_type")[0];
			var Irep_panalty = root.getElementsByTagName("Irep_panalty")[0];
			var reportTest2 = root.getElementsByTagName("reportTest2")[0];
			var panaltyDay = root.getElementsByTagName("panaltyDay")[0];
			var reppro_content = root.getElementsByTagName("reppro_content")[0];
			var limember_id = root.getElementsByTagName("limember_id")[0];
			
			//태그가 가지는 텍스트는 태그의 첫 번째 자식이고,
			//텍스트 노드의 값은 nodeValue로 가져온다.
			var Ireppro_dateText = Ireppro_date.firstChild.nodeValue;
			var Irep_typeText = Irep_type.firstChild.nodeValue;
			var Irep_panaltyText = Irep_panalty.firstChild.nodeValue;
			var reportTest2Text = reportTest2.firstChild.nodeValue;
			var panaltyDayText = panaltyDay.firstChild.nodeValue;
			var reppro_contentText = reppro_content.firstChild.nodeValue;
			var limemberText = limember_id.firstChild.nodeValue;
			
			//input 박스에 추가하기
			$("#Ireppro_date").val(Ireppro_dateText);
			$("#Irep_type").val(Irep_typeText);
			$("#Irep_panalty").val(Irep_panaltyText);
			$("#reportTest2").val(reportTest2Text);
			$("#panaltyDay").val(panaltyDayText);
			$("#panalty_content").val(reppro_contentText);
			$("#master").val(limemberText);

		}

		

		
		/*신고자검색 및 셀렉박스 선택에 따라 정렬 */

		/*1.신고처리 신고대상타입에 따라 정렬*/
		$("#repprosel").change(function()
		{

// 			alert("바꼈다2-1!!!");
			$("#imemberForm2").submit();
			// value 값으로 선택

		});

		/*2.신고자에 따른 검색*/
		$("#imemberSearch").click(function()
		{
// 			alert("신고자검색2");
			$("#imemberForm2").submit();
		});

		
		/*3. 신고처리 제재유형에 따라 정렬  */
		$("#repprosel2").change(function()
		{
// 			alert("바꼈다4!!!");
			$("#imemberForm2").submit();

		});
		/*셀렉박스 선택에 따라 정렬 끝*/

		
		
	});
	
	
	
	
	
</script>









</head>
<body>

	<!-- 상단메뉴 -->
	<c:import url="../Menu.jsp"></c:import>
	<!-- 상단메뉴 end -->
	
	
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

					
					<!-- 운영관리 윗부분 -->
					<div style="margin-bottom: 3%; height: 7%; width: 100%;">
					
						<span
							style="padding: 2%; background-color: #000000; font-size: 20px; border-radius: 6px; color: white; float: left;">
							<span>미츄 신고처리관리</span>
						</span>

						<div
							style="height: 100%; width: 50%; /* border: 4px solid blue; */ padding: 1%; float: left;">
							<div>
			
								<button type="button" class="btn btn-warning btn-link active"
									style="float: left; margin-right: 1%;">
									<a href="reportList.action"><span
										style="font-weight: bold; color: black;">신고접수</span></a>
								</button>
			
								<button type="button" class="btn btn-success btn-link active">
									<a href="reportList2.action"><span
										style="font-weight: bold; color: black;">신고처리</span></a>
								</button>
			
							</div>
						</div>
					</div>
					
					
					<form id="imemberForm2" style="width: 100%; height: 100%;"
					action="/reportList2.action" method="post">
					<div style="height: 98%; width: 100%; margin-top: 2%; padding: 1%;"
						class="w3-container">
						<%--
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
						--%>
						
						<!-- Tab panes -->
					<div class="tab-content"
						style="width: 100%; height: 100%; padding: 1%;">


						<!-- 처리 후 -->
						<div role="tabpanel" class="tab-pane active" id="before"
							style="width: 100%; height: 100%; padding: 1%">
							
							<!-- 신고 게시판 리스트 영역 -->

							<div
								style="width: 100%; height: 8%; padding: 0.5%; border-bottom: 2px solid gray; border-top: 2px solid gray; margin-bottom: 0.5%;">

<!-- 								<div style="float: left; width: 6%; margin-top: 0.5%; text-align: center;"> -->
<!-- 									<input type="checkbox" id="allcheck" value="선택"> -->
<!-- 								</div> -->

<!-- 								<div -->
<!-- 									style="float: left; width: 5%; margin-top: 0.5%; text-align: center;">번호</div> -->
								<div
									style="float: left; width: 12%; margin-top: 0.5%; text-align: center;">신고처리번호</div>
								<div
									style="float: left; width: 12%; margin-top: 0.5%; text-align: center;">신고자아이디</div>
								<div
									style="height: 75%; float: left; width: 15%; margin-top: 0.5%; text-align: center;">
									신고대상타입
									<!-- 
									<select name="repprosel" id="repprosel" style="height: 100%;">
										<option selected='selected' value="0"
											${repprosel == 0 ? "selected" : ""}>신고대상타입</option>
										<c:forEach var="option1" items="${optionList1 }">
											<option value="${option1.leadertype_id }"
												${repprosel == option1.leadertype_id ? "selected" : ""}>${option1.leadertype_info}</option>
										</c:forEach>
									</select>
									 -->
									
								</div>
								<div
									style="height: 75%; float: left; width: 15%; margin-top: 0.5%; text-align: center;">
									<!-- 
										<select name="repprosel2" id="repprosel2"
											style="height: 100%;">
											<option selected='selected' value="0"
												${repprosel2 == 0 ? "selected" : ""}>제재처리</option>
											<c:forEach var="option3" items="${optionList3 }">
												<option value="${option3.rep_panalty }"
													${repprosel2 == option3.rep_panalty ? "selected" : ""}>${option3.rep_panaltypol }</option>
											</c:forEach>
										</select>	
									 -->
									 	제재처리				
								</div>
								<div
									style="float: left; width: 18%; margin-top: 0.5%; text-align: center;">신고처리내용</div>
								<div
									style="float: left; width: 13%; margin-top: 0.5%; text-align: center;">신고접수일자</div>
								<div
									style="float: left; width: 13%; margin-top: 0.5%; text-align: center;">신고처리일자</div>

							</div>


							<!-- 게시판 내용 -->
							<div class="reportContents"
								style="width: 100%; height: 70%; padding: 0.5%;">
								
								<% int b = 0;%>
								
								<c:forEach var="reportpro" items="${reportproList}">

									<div id="reportpros"
										style="width: 100%; height: 8%; border: 1px solid black; padding: 0.5%;">

<!-- 										<div -->
<!-- 											style="float: left; width: 5%; margin-top: 0.5%; text-align: center;"> -->
<!-- 											<input type="checkbox"> -->
<!-- 										</div> -->

<!-- 										<div -->
<!-- 											style="float: left; width: 5%; margin-top: 0.5%; text-align: center;" -->
<%-- 											class="reportpro">${b = b + 1}</div> --%>
										<div
											style="float: left; width: 12%; margin-top: 0.5%; text-align: center;"
											class="reportpro" id="Ireppro_id${reportpro.reppro_id}">${reportpro.reppro_id}</div>
										<div
											style="float: left; width: 12%; margin-top: 0.5%; text-align: center;"
											class="reportpro">${reportpro.limember_id}</div>
										<div
											style="float: left; width: 15%; margin-top: 0.5%; text-align: center;"
											class="reportpro">${reportpro.leadertype_id}</div>

										<div
											style="float: left; width: 15%; margin-top: 0.5%; text-align: center;"
											class="reportpro" id="Ireppanalty${reportpro.report_id}">${reportpro.rep_panalty}</div>

										<div
											style="float: left; width: 18%; margin-top: 0.5%; text-align: center;"
											class="reportpro">

											<button type="button" id="reportproContent"
												class="btn btn-link reportpro reportproContent"
												style="background-color: white; padding: 0;"
												data-toggle="modal" data-target="#reportModal2"
												value="${reportpro.reppro_id}">처리내용보기</button>
										</div>

										<div
											style="float: left; width: 13%; margin-top: 0.5%; text-align: center;"
											class="reportpro" id="Irep_date${reportpro.reppro_id}">${reportpro.rep_date}</div>
										<div
											style="float: left; width: 13%; margin-top: 0.5%; text-align: center;"
											class="reportpro" id="Ireppro_date${reportpro.reppro_id}">${reportpro.reppro_date}</div>
									</div>

								</c:forEach>
							</div>

						

						<%--
						<!-- 페이징처리 -->
						<div
							style="width: 100%; height: 12%; padding: 0; ">
							<div style="height: 100%; text-align: center; margin: 0;">
								<ul class="pagination">
									<li class="disabled"><a href="#">«</a></li>
									<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">»</a></li>
								</ul>
							</div>
						</div>
						<!-- 페이징처리 끝 -->
						 --%>
						
						
					</div>
						</div>
						
					</div>
					</form>
					
					
					
				</div>
			</div>
		</div>
	</div>
				



	<!-- Modal2 -->
	<div class="modal" id="reportModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog">

			<div class="modal-content"
				style="width:400px; min-height: 300px; height: 450px; float: left;">

				<div class="modal-header" style="height: 11%;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div style="height: 10%; padding: 0;">
						<h4>다음의 신고내용이 처리 되었습니다.</h4>
					</div>
				</div>

				<div class="modal-body"
					style="height: 70%; padding: 0.5%; float: left;">
					<div class="modal-title" style="padding: 1%; float: left; width: 100%">
						신고처리일자 : <input id="Ireppro_date"  type="text" readonly="readonly" value="">
					</div>
					<div class="modal-title" style="padding: 1%; float: left; width: 100%">
						신고유형 : <input id="Irep_type" type="text" readonly="readonly" value="">
					</div>
					<div class="modal-title" style="padding: 1%; float: left; width: 100%">
						제재유형 : <input id="Irep_panalty" type="text" readonly="readonly" value="">
					</div>
					<div class="modal-title" style="padding: 1%; float: left; width: 100%">
						처리내용 :
						<textarea id="panalty_content" readonly="readonly"
						rows="5" cols="50" style="resize: none;"></textarea>
					</div>
					<div class="modal-title" style="padding: 1%; float: left; width: 100%">
						처리관리자 : <input id="master" type="text" readonly="readonly" value="">
					</div>
					<div style="padding: 1%;">
						<h5 style="float: left;">신고처리제재내용 :</h5>
						<input id="reportTest2" name="reportTest2"readonly="readonly" value="">
						<input id="panaltyDay" name="panaltyDay" readonly="readonly" style="width: 30px;">일
					</div>
				</div>

				<div class="modal-footer" style="height: 8%; padding: 1;">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>

			</div>

		</div>

	</div>


<div style="clear: both; position: relative;">
	<c:import url="../BottomBar.jsp"></c:import>
</div>

</body>
</html>