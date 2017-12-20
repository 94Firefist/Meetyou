<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="robots" content="noindex, nofollow">

<title>나의 관리페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<style type="text/css">
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://jqueryui.com/jquery-wp-content/themes/jqueryui.com/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-
ui.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

<!-- 나눔쏘스 -->
<link rel="stylesheet" href="<%=cp%>/css/Nwagon.css" type="text/css">
<script src="<%=cp%>/js/Nwagon.js"></script>


<!-- 스위치 넣기 위한 소스 -->
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<script type="text/javascript">
	function interestRemove(id)
	{
		$(location).attr("href",
				"/personalInterestRemove.action?mbcategory_id=" + id);
	}

	function interestModify(id)
	{

		$(location).attr(
				"href",
				"/personalInterestModity.action?mbcategory_id=" + id
						+ "&category_code=" + $("#sel" + id).val());
	}

	function interestInsert()
	{
		if ($("#myinterestCount").val() >= 2)
		{
			alert("관심사는 최대 2개까지 설정가능합니다.");
		} else
		{
			$(location).attr(
					"href",
					"/personalInterestInsert.action?category_code="
							+ $("#insertChoice").val());
		}

	}

	$(document).ready(function()
	{
		
		//수정 가능 여부 
		if ($("#keynumber").val() == $("#ownernumber").val())
		{

			$("#maincontent").attr("style", "display: ");
		}
		else
		{
			alert("잘못된 접근입니다.");
		}

	});
</script>

</head>
<body>
	<!--로그인바  -->
	<div>
		<c:import url="../Menu.jsp"></c:import>
	</div>

	<!-- 상단메뉴 -->
	<div>
		<c:import url="personalPageTopMenu.jsp"></c:import>
	</div>
	<!-- 상단메뉴 end -->
	<div class='container' style="padding: 20px;">
		<div id='content' class='row-fluid'>
			<!-- 왼쪽 메뉴 -->
			<div>
				<c:import url="personalLeftBar.jsp"></c:import>
			</div>
			<!-- 왼쪽 메뉴 끝-->

			<!-- 메인 메뉴 -->
			<div  class='span8 main'
				style="border: 2px white solid; padding: 20px; width: 945px; background-color: white; margin-left: 15px;">
				<div id="title" style="color: #ef9534;">
					<p style="font-size: 19px;">
						<strong>관리하기</strong>
					</p>
				</div>
		
			<div id="maincontent" style="display:none;">
				<!-- 회원인지 여부 판단 및 자긴 여부 판단하기 위해 로그인한 사람 번호 받음 -->
				<input type="hidden" id="keynumber" value="${keynumber }">
				<!-- 홈주인님의 번호 -->
				<input type="hidden" id="ownernumber" value="${userNumber }">


				<!-- 페이지 관리
				<div id="PageControl">

					<p style="font-size: 15px;">
						<strong>[페이지 관리]</strong>
					</p>
					<p>자기소개, 타임라인 페이지는 off 설정을 할 수 없습니다.</p>
					<div>
						그룹목록 <input type="checkbox" checked data-toggle="toggle"
							data-size="small">
					</div>
					<div>
						친구목록 <input type="checkbox" checked data-toggle="toggle"
							data-size="small">
					</div>

				</div>
				 end-->
				<hr>
				<!-- 개인정보 관리 -->
				<form action="/controlMyinfo.action" method="get">
					<div id="PersonalInfoControl">
						<p style="font-size: 15px;">
							<strong style="color: skyblue">[개인정보 관리]</strong>
						</p>
						<p>생년월일은 공개여부만 변경이 가능합니다.</p>
						<div id="myBirth">
							<strong>생년월일</strong> <input type="text" disabled="disabled"
								id="birth" name="birth" style="height: 32px; width: 90px;"
								value="${conList.member_birth }">
							<!--생년월일 공개여부  -->
							<input type="radio" ${conList.public_br == 1?'checked':''}
								value="1" name="birthOpen">전체공개 <input type="radio"
								${conList.public_br == 2?'checked':''} value="2"
								name="birthOpen">회원공개 <input type="radio"
								${conList.public_br == 3?'checked':''} value="3"
								name="birthOpen">친구공개 <input type="radio"
								${conList.public_br == 4?'checked':''} value="4"
								name="birthOpen">비공개
						</div>
						<div id="myTel">
							<strong>연락처&nbsp;&nbsp;&nbsp;</strong> <input type="text"
								id="tel" name="tel" style="height: 32px; margin: 0px;"
								value="${conList.member_tel }"> <input type="radio"
								${conList.public_tel == 1?'checked':''} value="1" name="telOpen">전체공개
							<input type="radio" ${conList.public_tel == 2?'checked':''}
								value="2" name="telOpen">회원공개 <input type="radio"
								${conList.public_tel == 3?'checked':''} value="3" name="telOpen">친구공개
							<input type="radio" ${conList.public_tel == 4?'checked':''}
								value="4" name="telOpen">비공개
						</div>
						<div id="myEmail" style="padding-top: 7px;">
							<strong>이메일&nbsp;&nbsp;&nbsp;</strong> <input type="text"
								id="email" name="email" style="height: 32px; margin: 0px;"
								value="${conList.member_email }"> <input type="radio"
								${conList.public_email == 1?'checked':''} value="1"
								name="emailOpen">전체공개 <input type="radio"
								${conList.public_email == 2?'checked':''} value="2"
								name="emailOpen">회원공개 <input type="radio"
								${conList.public_email == 3?'checked':''} value="3"
								name="emailOpen">친구공개 <input type="radio"
								${conList.public_email == 4?'checked':''} value="4"
								name="emailOpen">비공개
						</div>

						<div id="myLocation" style="padding-top: 7px;">
							<strong>관심지역</strong> <select id="location" name="location">
								<c:forEach items="${cityList }" var="city">
									<c:choose>
										<c:when test="${conList.city_name eq city.city_name}">
											<option selected="selected" value="${city.citype_id}">${city.city_name }</option>
										</c:when>
										<c:otherwise>
											<option value="${city.citype_id}">${city.city_name }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>

						</div>

						<div id="myInterest" style="width: 550px;">
							<div class="form-group"
								style="margin-bottom: 7px; margin-top: 7px;">
								<strong>관심사</strong>
							</div>
							<c:forEach items="${conInterestList}" var="dto">
								<select style="width: 100px;" id="sel${dto.mbcategory_id}">
									<c:forEach items="${totalInterestList}" var="interest">
										<c:choose>
											<c:when
												test="${dto.category_content eq interest.category_content}">
												<option selected="selected"
													value="${interest.category_code }">${interest.category_content}</option>
											</c:when>
											<c:otherwise>
												<option value="${interest.category_code }">${interest.category_content}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="interestRemove('${dto.mbcategory_id }')">삭제</button>
								<button type="button" class="btn btn-default btn-xs"
									onclick="interestModify('${dto.mbcategory_id}')">변경</button>
							</c:forEach>

							<!-- 전체카테고리리스트 -->
							<select style="width: 120px;" id="insertChoice">
								<option value="">--추가하기--</option>
								<c:forEach items="${totalInterestList}" var="interest">
									<option value="${interest.category_code }">${interest.category_content }</option>
								</c:forEach>
							</select>
							<!-- 추가시 인풋박스 생성  -->
							<button type="button" onclick="interestInsert()">+</button>

							<!-- 나의 관심사의 숫자 (맨위에 functions 구현한 후 됨요~싱기싱기)  -->
							<input type="hidden" id="myinterestCount"
								value="${fn:length(conInterestList)}">

						</div>
						<div>
							<div class="form-group"
								style="margin-bottom: 7px; margin-top: 7px;">
								<strong>자기소개</strong>
							</div>
							<textarea style="width: 500px;" id="introduce" name="introduce">${conList.member_info }</textarea>
						</div>

					</div>
					<!-- 개인정보 관리 end-->

					<!-- 버튼 -->
					<br>
					<div id="functionButton" style="text-align: center;">
						<button type="submit" class="btn btn-info">수정</button>
						<button type="button" class="btn btn-default">취소</button>
					</div>
					<!-- 버튼 end-->
				</form>
			   </div>	
			</div>
		</div>
	</div>

	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
</body>
<script type="text/javascript">
	
</script>
</body>
</html>