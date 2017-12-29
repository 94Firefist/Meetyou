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
<title>쪽지 보내기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 체크박스 선택에 따른 -->

<script>
	
	function div_OnOff(v, id)
	{
		// 라디오 버튼 value 값 조건 비교
		if (v == "1")
		{
			document.getElementById(id).style.display = ""; // 보여줌
			document.getElementById("con2").style.display="none";
		} 
		else if (v == "2")
		{
			
			document.getElementById(id).style.display = ""; // 숨김
			document.getElementById("con1").style.display="none";
		}

	}
	
	$(document).ready(function()
	{
		$("#sendmsg").click(function()
		{
			
			if($("input:radio[name=chk_info]:checked").val()== "1")
			{
			
			 $("#sendMemberMsg").attr("action", "messagesendtofriend.action" );
			 $("#sendMemberMsg").submit();
			
			}
			else
			{
				$("#sendMemberMsg").attr("action", "messagesendtogroup.action" );
				$("#sendMemberMsg").submit();
			};		
		});
	});
	

</script>


</head>
<body>

	<div class="container"
		style="border: 1px solid black; margin: 5px; height: 500px; width: 500px;">
		<!-- <div class="col-md-5"> -->
		<div class="form-area">
			<form role="form" id="sendMemberMsg" action="messagesendtofriend.action">
				<br style="clear: both">
				<a href="messagemyreceive.action">
					<button type="button" class="btn btn-info">
						받은 쪽지
					</button>
				</a> 
				<a href="messagemysent.action">
					<button type="button" class="btn btn-info">
						보낸 쪽지
					</button>
				</a>
				<button type="button" class="btn btn-warning" disabled="disabled">
					쪽지보내기
				</button>
				<h3 style="margin-bottom: 25px; text-align: center;">
					MeetU Message
				</h3>

				<div class="form-group">
					<input type="radio" name="chk_info" id="chk_info" value="1"
						onclick="div_OnOff(this.value,'con1');" ${param.friendId==null?'':'checked=checked;'} >친구 <input
						type="radio" name="chk_info" id="chk_info" value="2"
						onclick="div_OnOff(this.value,'con2');" > 그룹
				</div>
										<!-- 친구 아이디의 값이 null이 아닐때만 이 섹션을 보인다 -->
				<div id="con1" style=${param.friendId==null?'display:none;':'display:inline;'}>

					<div class="form-group" id="friendSelect">
						<input type="text" class="" id="userId" name="userId" value="${param.friendId }"
							placeholder="받는이 ID" required style="width: 150px;">
						<input type="text" id="F_keynumber" name="F_keynumber" value="${param.friendKey }"
						style="width: 50px;"
						>	
						<c:import url="friendListSearchSample.jsp"></c:import> 
					</div>
				</div>

				<div id="con2" style="display: none">

					<div class="form-group" id="groupSelect">
						<select id="groupid" name="groupid" class="form-control" style="width: 200px;">
							
							<c:forEach items="${msgGrouplist}" var="msg">
								<option value="${msg.lGroup_id }">${msg.group_name }</option>
							</c:forEach>
							
						</select>
					</div>


				</div>


				<div class="form-group">
					<input type="text" class="form-control" id="subject" name="subject"
						placeholder="제목" required>
				</div>
				<div class="form-group">
					<textarea class="form-control" id="message" name="message" placeholder="내용"
						maxlength="140" rows="7"></textarea>
					<span class="help-block">최대 140까지만 허용됩니다.</span>
					<button type="button" id="sendmsg"
							name="sendmsg" class="btn btn-primary pull-right">메시지 보내기</button>
					<br>
					<br>
				</div>
			</form>
		</div>
		<!-- </div> -->
	</div>

</body>
</html>