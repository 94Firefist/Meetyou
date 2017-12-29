<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="robots" content="noindex, nofollow">

<title>그룹 사진</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>





<style type="text/css">

/* 사진 추가 */
.img-upload-btn {
	position: relative;
	overflow: hidden;
	padding-top: 95%;
}

.img-upload-btn input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}

.img-upload-btn i {
	position: absolute;
	height: 16px;
	width: 16px;
	top: 50%;
	left: 50%;
	margin-top: -8px;
	margin-left: -8px;
}

.btn-radio {
	position: relative;
	overflow: hidden;
}

.btn-radio input[type=radio] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
/* 사진 추가 */
</style>

<script type="text/javascript">
	$(document).ready(function()
	{
		$(".albumBtn").click(function()
		{
			$(location).attr("href", "grouppageeventpicture.action?lGroup_id=${lGroup_id}&eventId=" + $(this).val());
		});
	})
</script>

</head>
<body>
<c:import url="../Menu.jsp"></c:import>

	<!--///////////////////////////////////////////////////////////-->

	<!--///////////////////////////////////////////////////////////-->





	<!-- 상단메뉴 -->
	<div>
		<c:import url="groupPageTopMenu.jsp"></c:import>
	</div>
	<!-- 상단메뉴 end -->

	<div class='container' style="padding: 20px;">
		<!--중간 메뉴들(왼쪽, 메인)  -->
		<div id='content' class='row-fluid'>

			<!-- 메인메뉴  -->
			<div class='span8 main'
				style="border: 2px white solid; padding: 20px; width: 1130px; background-color: white;">
				<div id="title" style="color: #ef9534; height: 90px;">
					<h3 style="font-weight: bold; color: orange; float: left;">앨범</h3>
				</div>

				

				<div id="grouplist" class="row" style="padding: 1%;">
					<c:choose>
						<c:when test="${fn:length(albums) == 0}">
							등록된 앨범이 없습니다.
						</c:when>
						<c:otherwise>
							<c:forEach var="album" items="${albums}">
								<button class="btn btn-link albumBtn" id="" style="float: left; width: 25%; height: 220px;" value="${album.levent_id}">
			
									<!-- 그룹 이미지 -->
									<img src="${album.eveprofile_url}" style="width: 100%; height: 100%;"
										data-toggle="modal" data-target=".bs-example-modal-lg">
									<!-- 그룹 이름 -->
									<div id="grouplistText"
										style="position: relative; left: 10px; top: -70px; color: lime; font-size: 15px; font-weight: 900;">
										<p>${album.event_name}</p>
									</div>
								</button>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>


			</div>
			<!-- 메인메뉴 end-->
		</div>
		<!--중간 메뉴들(왼쪽, 메인)  end-->
	</div>
	<!--하단바  -->
	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
	<!--하단바 끝-->

	

</body>
</html>