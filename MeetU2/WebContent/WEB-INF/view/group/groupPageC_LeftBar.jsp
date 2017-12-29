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
	style="width: 250px; height: 750px; border: 1px solid white; float: left; padding: 0px; background-color: white;">
	
	<ul class="gLeft">
		<c:if test="${groupPower == 1}">
              	<li><a href="/groupInfo.action?lGroup_id=${lGroup_id}">그룹 정보 수정</a></li>
              </c:if>
		<li><a href="/groupmemberInfo.action?lGroup_id=${lGroup_id}">그룹·멤버 관리</a></li>
		<li><a href="/groupsingupInfo.action?lGroup_id=${lGroup_id}">가입승인</a></li>
		<li><a href="/groupblackListInfo.action?lGroup_id=${lGroup_id}">블랙리스트 관리</a></li>
		<c:if test="${groupPower == 1}">
			<li><a href="/groupopenInfo.action?lGroup_id=${lGroup_id}">공개 범위 설정</a></li>
		</c:if>
	</ul>

</div>