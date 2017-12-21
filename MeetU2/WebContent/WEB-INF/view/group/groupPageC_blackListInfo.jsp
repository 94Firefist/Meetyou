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
<title>그룹회원</title>

<link rel="stylesheet" href="<%=cp%>/css/style.css">
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
.gLeft>li {
	color: gray;
	font-size: 20px;
	font-family: fantasy;
	font-weight: bold;
	line-height: 2;
}

.gLeftS {
	color: blue;
}
</style>

<script type="text/javascript">
	
	$(document).ready(function()
	{
		
		$(".removeBlack").click(function()
		{
			
			if(confirm("블랙을 해제하시겠습니까?")) {
				$(location).attr("href", "groupremoveblack.action?groupId=${groupId}&targetId=" + $(this).val());
			}
			
		});
		$(".searchId").click(function()
		{
			$(location).attr("href", "groupblackListInfo.action?groupId=${groupId}&targetId=" + $("#searchId").val());
		});
		
	});
	
</script>

</head>
<body>
<c:import url="../Menu.jsp"></c:import>
	<!-- 상단메뉴 -->
	<div>
		<c:import url="groupPageTopMenu.jsp"></c:import>
	</div>
	<!-- 상단메뉴 end -->
	<div class='container' style="padding: 20px;">
		<div id='content' class='row-fluid'>
			<!-- 메인 메뉴 -->
			<div class='span8 main w3-row'
				style="border: 2px white solid; padding: 20px; width: 1130px; background-color: white;">

				<div class="w3-quarter"
					style="border-right: 2px solid #ccc; width: 20%; height: 500px; text-align: center;">
					<ul class="gLeft">
						<c:if test="${groupPower == 1}">
		                	<li><a href="/groupInfo.action?groupId=${groupId}">그룹 정보 수정</a></li>
		                </c:if>
						<li><a href="/groupmemberInfo.action?groupId=${groupId}">멤버 관리</a></li>
						<li><a href="/groupsingupInfo.action?groupId=${groupId}">가입승인</a></li>
						<li><a href="/groupblackListInfo.action?groupId=${groupId}">블랙리스트 관리</a></li>
						<c:if test="${groupPower == 1}">
							<li><a href="/groupopenInfo.action?groupId=${groupId}">공개 범위 설정</a></li>
						</c:if>
					</ul>
				</div>

				<div class="w3-threequarter w3-container">
					<div class="">
						<div class="col-lg-6">
							<h3>블랙리스트 추가</h3>
						</div>
						<div class="col-lg-6" style="margin-top: 2%;">
						    <div class="input-group" style="text-align: center;">
							      <input type="text" id="searchId" class="form-control" placeholder="아이디를 정확히 입력">
							      <span class="input-group-btn">
							        	<button class="btn btn-default searchId" type="button">아이디검색</button>
							      </span>
						    </div><!-- /input-group -->
					    </div><!-- /.col-lg-6 -->
					    
					</div>					
					<div class="w3-row" style="width: 100%; padding: 4%; border-bottom: 1px solid gray;">
						<c:choose>
							<c:when test="${bgCheck == null}">
								회원이 존재하지 않습니다.
							</c:when>
							<c:when test="${bgCheck == 0}">
								<c:if test="${member != null}">
							    	<form action="groupblackinsert.action" method="post">
								    	<div class="w3-container">
											<!-- x -->
											<input type="hidden" id="blackMemberId" name="blackMemberId" value="${member.lmember_id}">
											<input type="hidden" id="blackGroupId" name="blackGroupId" value="${groupId}">
											<div style="padding: 2%;">
												<button id="${member.member_name}" class="memberBtn" value="${member.lmember_id}" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
													data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
													style="border: none; background-color: white; float: left;">
												<img src="${member.member_imageUrl}" class="img-circle" alt="Cinque Terre" width="70" height="70" style="padding: 5px;">
												${member.member_name}
												</button>
												<button class="btn btn-link insertBlack" style="float: right; margin-top: 2%;" type="submit">
													<span class="glyphicon glyphicon-remove" style="font-size: 30px; color: red;"></span>
												</button>
												
											</div>
											
										</div>
										<div style="width: 100%; text-align: center; padding: 5%;">
											<input style="width: 100%;" type="text" class="form-control" placeholder="사유를 입력하세요." id="blackText" name="blackText">
										</div>
									</form>
							    </c:if>
						    </c:when>
						    <c:when test="${bgCheck == 1}">
								이미 블랙리스트된 회원입니다.
							</c:when>
						</c:choose>
					</div>
				
				
					

					<div class="w3-row" style="width: 100%; padding: 4%;">
						<h3>블랙리스트</h3>
						<c:forEach var="black" items="${blacks}">
							
							<div class="w3-row">
								<button class="btn btn-link removeBlack" style="float: left; padding-top: 2.5%;" value="${black.lmember_id}">
									<span class="glyphicon glyphicon-remove" style="font-size: 30px; color: red;"></span>
								</button>
								<button id="${black.member_name}" class="memberBtn" value="${black.lmember_id}" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
											data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
											style="border: none; background-color: white;">
									<img src="${black.member_imageUrl}" class="img-circle" alt="Cinque Terre" width="70" height="70" style="padding: 5px;">
									${black.member_name}
								</button>
								<span style="float: center; margin-left: 5%;">제재 사유 : ${black.blackgr_reason}</span>
								
								
								
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</div>



	<!--하단바  -->
	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
	<!--하단바 끝-->
</body>
</html>