<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<script type="text/javascript">

/* 친구선택하기 버튼을 눌렀을 때 작동되는 스크립트*/
$(function()
{
	$(".hostpick").click(function()
	{
		
		alert("쪽지보내기ok?");
		
		showPopup($("#friendId").val());

	})
})

function showPopup(id)
{
	window
			.open(
					"/messagesendform.action?friendId="+id,
					"a",
					"width=520, height=520, left=1060, top=50, location=no, directories=no, status=no");
}

</script>

	<div id='content' class='container-fluid'
		style="width: 170px; height: 750px; border: 1px solid white; float: left; padding: 0px; background-color: white;">
		<div class="container"
			style="width: 160px; height: 170px; margin: 15px 5px 0px 0px;">
			<!-- 프로필사진 -->
			<img src="${groupInfo.group_imageUrl}"
				style="width: 129px; height: 129px; padding-bottom: 2px;"><br>
			<!--  그룹 지역 -->
			<p style="font-size: 12pt; color: blue; text-align: center;">${groupInfo.group_citypeName}
				</p>
			<!--  만들어진 날짜 -->
			<p style="font-size: 9pt; text-align: center;">만들어짐 : ${groupInfo.group_creDate}</p>
		</div>
		<br>


		<!-- 기타정보-->
		<div style="text-align: center;">
			<p>회원수 : ${groupInfo.group_memberCount}</p>
			<p>과거MeetU : ${groupInfo.group_eventCount}</p>
		</div>

		<hr>
		<!-- 캘린더 -->
		<div>
			<c:import url="/calendar.action"></c:import>
		</div>

		<hr>

		<!-- 관심정보 -->
		<div style="text-align: center; width: 100%; height: 15%;">
			<p style="float: inherit;">그룹장</p>

					<button id="${groupInfo.member_name}" class="memberBtn" value="${groupInfo.lMember_id}" tabindex="0"  data-trigger="focus" data-toggle="popover" class="text-primary" title="MeetU"
						data-content="<a class='memberPage'>개인페이지</a><a onclick='showPopup2();'> 쪽지보내기</a>" data-html="true"
						style="border: none; background-color: white;"><img src="${groupInfo.member_imageUrl}" class="img-circle" alt="Cinque Terre"
						width="70" height="70" style="padding: 5px;">${groupInfo.member_name}</button>
		</div>

		<!-- 관심사태그 -->
		<div class='container-fluid' style="width:100%; text-align: center; height: 17%; padding: 1%;">
			<div style="width: 100%; height: 100%;">
			
				<div style="float: left; width: 50%; height:100%; padding: 1%;">
					<dl style="width: 100%; height: 100%; border: 1px solid #D5D5D5;">
						<dd style="border-bottom: 1px solid #D5D5D5;">관심사</dd>
						<c:forEach var="groupCategory" items="${groupCategorys}">
							<dd>${groupCategory.category_content}</dd>
						</c:forEach>
					</dl>
				</div>
				<div style="float: left; width: 50%; height:100%; padding: 1%;">
					<dl style="width: 100%; height: 100%; border: 1px solid #D5D5D5;">
						<dd style="border-bottom: 1px solid #D5D5D5;">태그</dd>
						<c:forEach var="groupTag" items="${groupTags}">
							<dd>${groupTag.tag_name}</dd>
						</c:forEach>
					</dl>
				</div>
			</div>
		</div>
	</div>