<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<script>
	function closeLayer( obj ) {
		$(obj).parent().parent().hide();
	}

	$(function(){
	
		/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
		$('.memberSelect').click(function(e)
		{
			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;
	
			var oWidth = $('.popupLayer').width();
			var oHeight = $('.popupLayer').height();
	
			// 레이어가 나타날 위치를 셋팅한다.
			var divLeft = e.clientX + 10;
			var divTop = e.clientY + 5;
	
			// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
			if( divTop + oHeight > sHeight ) divTop -= oHeight;
	
			// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
			if( divLeft < 0 ) divLeft = 0;
			if( divTop < 0 ) divTop = 0;
	
			$('.popupLayer').css({
				"top": divTop,
				"left": divLeft,
				"position": "absolute"
			}).show();
		});
	
	});
</script>
<style type="text/css">
	
	.ClickDiv
	{
		
	}
	.ClickBtn
	{
		width:100%;
		height:50%;
		display: inline-block; 
		vertical-align: middle; 
		float: none; 
		padding-left: 3%; 
		text-align: left;
		color: #000000;
	}
	.ClickBtn:hover
	{
		text-decoration:none;
		background: #E7E7E7;
	}
</style>
<div style="width: 120px; height: 60px; border: 1px solid black;">
	<button class="btn btn-link ClickBtn">
		개인 페이지
	</button>
	<button class="btn btn-link ClickBtn">
		쪽지 보내기
	</button>
</div>