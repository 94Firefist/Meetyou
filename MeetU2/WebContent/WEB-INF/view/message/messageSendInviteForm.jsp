<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	System.out.println(request.getParameter("friendId"));
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
	
	
	
</script>

</head>
<body>

	<div id=msg500></div>

	<div class="container"
		style="border: 1px solid black; margin: 5px; height: 500px; width: 500px;">
		<!-- <div class="col-md-5"> -->
		<div class="form-area">
			<form role="form">
				<br style="clear: both"> <a href="/messagemyreceive.action"><button
						type="button" class="btn btn-info">받은 쪽지</button></a> <a
					href="/messagemysent.action"><button type="button"
						class="btn btn-info">보낸 쪽지</button></a>
				<button type="button" class="btn btn-warning" disabled="disabled">쪽지
					보내기</button>
				<h3 style="margin-bottom: 25px; text-align: center;">MeetU
					Message</h3>

				<div class="form-group">
					<input type="radio" name="chk_info" value="1"
						onclick="div_OnOff(this.value,'con1');" ${param.friendId==null?'':'checked=checked;'} >친구 <input
						type="radio" name="chk_info" value="2"
						onclick="div_OnOff(this.value,'con2');" > 그룹
				</div>
										<!-- 친구 아이디의 값이 null이 아닐때만 이 섹션을 보인다 -->
				<div id="con1" style=${param.friendId==null?'display:none;':'display:inline;'}>

					<div class="form-group" id="friendSelect">
						<input type="text" class="" id="userId" name="userId" value="${param.friendId }"
							placeholder="받는이 ID" required style="width: 200px;">
						<c:import url="friendListSearchSample.jsp"></c:import>
					</div>
				</div>

				<div id="con2" style="display: none">

					<div class="form-group" id="groupSelect">
						<select class="form-control" style="width: 200px;">
							<option>그룹1</option>
							<option>그룹2</option>
							<option>그룹3</option>
						</select>
					</div>


				</div>


				<div class="form-group">
					<input type="text" class="form-control" id="subject" name="subject"
						placeholder="제목" required value="${param.friendId }님을 이벤트에 초대합니다.">
					
				</div>
				<div class="form-group">
					<textarea class="form-control" id="message" placeholder="내용"
						maxlength="140" rows="7">이벤트 상세 정보 : ${param.nowUrl }</textarea>
						
					<span class="help-block">최대 140까지만 허용됩니다.</span> <a
						href="/messagemysent.action"><button type="button" id="submit"
							name="submit" class="btn btn-primary pull-right">메시지 보내기</button></a>
					<br>
					<br>
				</div>
			</form>
		</div>
		<!-- </div> -->
	</div>

</body>
</html>