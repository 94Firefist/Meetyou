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
<title>관리자페이지 회원활동관리(추가) 페이지</title>

<!-- 기본 CSS import -->
<c:import url="../import/head.jsp"></c:import>

<link rel="stylesheet" href="<%=cp%>/css/AdminMemberMain.css">


<!-- 회원검색시 -->
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#err").css("display", "none");
		$(".btnSearch").click(function()
		{

			if ($("#memberVal").val() == "")
			{
				$("#err").css("display", "inline");
				return;
			} else
			{
				$("#err").css("display", "none");
			}
			$("#memberForm").submit();
		});
	});
</script>

<!-- 전체선택 및 해제 -->
<script type="text/javascript">
	$(function()
	{ //전체선택 체크박스 클릭 
		$("#allcheck").click(function()
		{ //만약 전체 선택 체크박스가 체크된상태일경우 
			
			//alert($("#allcheck").is(":checked"));
			if($("#allcheck").is(":checked")) 
			{ //해당화면에 전체 checkbox들을 체크해준다 
				$("input[type=checkbox]").prop("checked",true); 
			// 전체선택 체크박스가 해제된 경우 
			} 
			else 
			{ //해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked",false); 
			} }) }); 
</script>

</head>
<body>
	<div>
		<c:import url="AdminLeftBar.jsp"></c:import>
	</div>
	<div id="mainContent" class="container">

		<div class="adminMenuName container00">
			<h1>[ 회 원 관 리 ]</h1>
			<div style="height: 20px;"></div>

			<form action="" method="post" id="memberSearchForm">
				<div class="container1">
					<div style="float: left; height: 100%; width: 100%;">
						<div style="float: left;; height: 100%; margin-right: 1%;">
							<select id="memberSearch" style="height: 100%;">
								<option value="회원아이디" selected>회원아이디</option>
								<option value="회원명">회원명</option>
							</select>
						</div>
						<div style="float: left; height: 100%; width: 17%;">
							<input type="text" id="memberVal" name="memberVal"
								style="float: left; height: 100%;">
						</div>
						<div style="float: left; width: 10%;">
							<button type="button" class="btn btn-default btnSearch"
								style="height: 98%; float:left;">회원검색</button>
						</div>
						<div
							style="width: 20%; height: 100%; float: left; padding-top: 0.5%; padding-left: 0;">
							<span id="err" class="err"
								style="text-align: center; color: red;">항목을 입력해야 합니다.</span>
						</div>
						<div
							style="float: left; height: 100%; width: 42%; text-align: right; height: 100%;">
							<button type="button" class="btn btn-default btnHold"
								style="height: 98%;">선택잠금</button>
							<button type="button" class="btn btn-default btnDelete"
								style="height: 98%;">선택삭제</button>
						</div>
					</div>


				</div>

			</form>


		</div>

		<div style="height: 20px;"></div>

		<!-- 회원관리(활동관리 메뉴) -->
		<div
			style="border-bottom: 1px solid red; border-top: 1px solid red; height: 5%; padding: 0.8%; margin-bottom: 1%;">
			<div class="" style="font-size: larger; font-weight: bold;">
				<div class="" style="float: left; margin-right: 35px; ">
					<p style="float:left;margin-right: 1px;">
					선택</p>
					<input type="checkbox" id="allcheck" class="btn btnAllCheck" >
				</div>
				<div class="" style="float: left; margin-right: 35px;">번호</div>
				<div class="" style="float: left; margin-right: 35px;">회원명</div>
				<div class="" style="float: left; margin-right: 35px;">회원아이디</div>
				<div class="" style="float: left; margin-right: 35px;">회원가입일</div>
				<div class="" style="float: left; margin-right: 35px;">가입그룹수</div>
				<div class="" style="float: left; margin-right: 35px;">참석이벤트수</div>
				<div class="" style="float: left; margin-right: 35px;">최근참석일</div>
				<div class="" style="float: left; margin-right: 35px;">최근접속일</div>
			</div>
		</div>

		<!-- 회원관리(활동관리 데이터) -->
		<div
			style="border: 5px solid gray; height: 50%; padding: 0.8%; margin-bottom: 1%;">
			<div>
				<article>
					<%-- <!-- EL, JSTL 표현에 의한 회원 명단 출력부분 구성 -->
					<c:forEach var="member" items="${memberList}">
						<div style="float: left; margin-right: 70px; margin-left: 50px;">
							<input type="checkbox">
						</div>
						<div>
							<!-- memberList 객체의 get()메소드를 호출하는 EL 표현 사용 -->
							<div>${member.mid }</div>
							<div>${member.name }</div>
							<div>${member.id }</div>
							<div>${member.join }</div>
							<div>${member.grCount }</div>
							<div>${member.eveAttend }</div>
							<div>${member.curAttend }</div>
							<div>${member.curLogin }</div>
						</div>
					</c:forEach> --%>
					<div style="float: left; margin-right: 70px; margin-left: 50px;">
						<input type="checkbox" >
					</div>
					<div style="float: left; margin-right: 40px;">1</div>
					<div style="float: left; margin-right: 50px;">
						<a href="">민지영</a>
					</div>
					<div style="float: left; margin-right: 5px;">민자</div>
					<div style="float: left; margin-right: 45px;">
						<button type="button" class="btn link"
							style="background-color: white;">
							<span class="glyphicon glyphicon-envelope"></span>
						</button>
					</div>
					<div style="float: left; margin-right: 70px;">2017/11/08</div>
					<div style="float: left; margin-right: 110px;">7</div>
					<div style="float: left; margin-right: 100px;">100</div>
					<div style="float: left; margin-right: 50px;">2017/11/24</div>
					<div style="float: left; margin-right: 50px;">2017/11/24</div>


					<div style="float: left;">

						<div style="float: left; margin-right: 70px; margin-left: 50px;">
							<input type="checkbox">
						</div>
						<div style="float: left; margin-right: 40px;">2</div>
						<div style="float: left; margin-right: 40px;">
							<a href="">김민호</a>
						</div>
						<div style="float: left; margin-right: 5px;">마이노</div>
						<div style="float: left; margin-right: 45px;">
							<button type="button" class="btn link"
								style="background-color: white;">
								<span class="glyphicon glyphicon-envelope"></span>
							</button>
						</div>
						<div style="float: left; margin-right: 70px;">2017/11/08</div>
						<div style="float: left; margin-right: 115px;">50</div>
						<div style="float: left; margin-right: 100px;">1</div>
						<div style="float: left; margin-right: 50px;">2017/11/24</div>
						<div style="float: left; margin-right: 50px;">2017/11/24</div>
					</div>
					<p style="float: left; font-size: 60pt;">회원리스트 뿌릴곳</p>
				</article>
			</div>
		</div>
	</div>

	<div style="height: 5%; width: 100%;"></div>

	<!-- 회원상세정보 -->

	<div
		style="height: 50%; width: 100%; float: left; border: 5px solid gray;">
	</div>



	<!-- 페이징처리 -->


	</div>

</body>
</html>