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
<title>Insert title here</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!--부트스트랩  -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">

$(function()
{

	$("#friendList").click(function()
	{
		$("#myModal").modal();
	});
	$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').focus()
		})
		
	
});
	
</script>



</head>
<body>

 <button type="button" id="friendList" class="btn btn-default btn">친구찾기</button>

	<!-- Modal -->
	<div class="modal fade bs-example-modal-sm" id="myModal" role="dialog">

		<div class="modal-dialog modal-sm">

			<!-- Modal content-->
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">친구리스트</h4>
				</div>

				<div class="modal-body">
						<!--검색기능  -->
						<div id="custom-search-input">
							<div class="input-group">
								<input type="text" class="search-query form-control"
									placeholder="Search" style="width: 230px; height: 33px;" /> <span
									class="input-group-btn">
									<button class="btn btn-info " type="button">
										<span class=" glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
						<br>
						<!--검색기능 end -->

						<!-- 친구리스트 -->
						<div id="friendlist">
							<div id="pp1">
								<div id="profilePic">
									<img src="images/pp1.jpg" class="img-circle" alt="Cinque Terre"
										width="70" height="70" style="padding: 5px; float: left;">
								</div>

								<div id="profileName">
									<p style="text-align: left; color: #4286f4;">
										<strong>이상아</strong>
									</p>
								</div>

								<div id="profileButton" style="align-items: center;">
									<button type="button" class="btn btn-success btn-xs">선택하기</button>
								</div>
							</div>
							<br>
							<div id="pp2">
								<div id="profilePic">
									<img src="images/pp2.jpg" class="img-circle" alt="Cinque Terre"
										width="70" height="70" style="padding: 5px; float: left;">
								</div>

								<div id="profileName">
									<p style="text-align: left; color: #4286f4;">
										<strong>민동기</strong>
									</p>
								</div>

								<div id="profileButton" style="align-items: center;">
									<button type="button" class="btn btn-success btn-xs">선택하기</button>
								</div>
							</div>
							<br>
							<div id="pp3">
								<div id="profilePic">
									<img src="images/pp3.jpg" class="img-circle" alt="Cinque Terre"
										width="70" height="70" style="padding: 5px; float: left;">
								</div>

								<div id="profileName">
									<p style="text-align: left; color: #4286f4;">
										<strong>민동기</strong>
									</p>
								</div>

								<div id="profileButton" style="align-items: center;">
									<button type="button" class="btn btn-success btn-xs">선택하기</button>
								</div>
							</div>
							<br>
							<div id="pp4">
								<div id="profilePic">
									<img src="images/pp4.jpg" class="img-circle" alt="Cinque Terre"
										width="70" height="70" style="padding: 5px; float: left;">
								</div>

								<div id="profileName">
									<p style="text-align: left; color: #4286f4;">
										<strong>김민호</strong>
									</p>
								</div>

								<div id="profileButton" style="align-items: center;">
									<button type="button" class="btn btn-success btn-xs">선택하기</button>
								</div>
							</div>
						</div>
						<!-- 친구리스트 end-->
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>

			</div>

		</div>

	</div>
	<!-- Modal end -->


</body>
</html>