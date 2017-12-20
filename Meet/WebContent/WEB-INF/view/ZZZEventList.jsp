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
select {
	width: 150px;
	/* padding: .8em .5em; */
	height: 30px;
	margin-top: 5%;
}
</style>


</head>
<body>

	<div class='container' style="padding: 20px;">
		<div id='content' class='row-fluid'>
			<div class='span8 main w3-row'
				style="border: 2px solid black; padding: 20px; width: 1130px; background-color: white;">


<!-- 파워링크 -->
				<div class="w3-row-padding"
					style="border: 5px solid purple; height: 300px;">
					<div style="height: 12%;">
						<a><span style="font-weight: bold; color: purple; font-size: 20px;">파워링크</span></a>
					</div>
					<div style="height: 85%;">
						<div class=" w3-third w3-row-padding" style="border: 2px solid red; height: 100%;">
							<img alt="" src="images/10.jpg" style="width: 100%; height: 100%;">
						</div>
						<div class=" w3-third w3-row-padding" style="border: 2px solid green; height: 100%;">
							<img alt="" src="images/11.jpg" style="width: 100%; height: 100%;">
						</div>
						<div class=" w3-third w3-row-padding" style="border: 2px solid orange; height: 100%;">
							<img alt="" src="images/12.jpg" style="width: 100%; height: 100%;">
						</div>
					</div>
				</div>
				
<!-- 셀렉트박스 -->
				<div class="w3-row" style="float: right; border: 5px solid black; margin-bottom: 1%;">
					<select>
						<option selected>최신순</option>
						<option>마감임박순</option>
						<option>가격순</option>
					</select>
				</div>
				
<!-- 리스트 -->
				<div class="w3-container" style="border: 5px solid red;">
					<div class="w3-row" style="border: 5px solid green; width: 100%; height: 200px;">
<!-- 사진 -->						
						<div class="w3-quarter" style="border: 5px solid orange; height: 100%;">
							<img alt="" src="images/10.jpg" style="width: 100%; height: 100%;">
						</div>
<!-- 내용 -->						
						<div class="w3-half w3-container" style="border: 5px solid gray; height: 100%;">
							<span style="font-weight: bold; font-size: 27px;">제~~~~~~~ 목(타이~~~ 틀)</span>
							<p style="font-size: 20px; text-overflow: ellipsis;">이벤트 소~~~~~~~~~~~~~~~~~~~~~ 개</p>
							<span style="color: #1DDB16; font-weight: bolder; font-style: italic; font-size: 15px;">#태그</span>
							<span style="color: #1DDB16; font-weight: bolder; font-style: italic; font-size: 15px;">#태그</span>
							<span style="color: #1DDB16; font-weight: bolder; font-style: italic; font-size: 15px;">#태그</span>
							<span style="color: #1DDB16; font-weight: bolder; font-style: italic; font-size: 15px;">#태그</span>
							<span style="color: #1DDB16; font-weight: bolder; font-style: italic; font-size: 15px;">#태그</span>
						</div>
<!-- 부가내용 -->						
						<div class="w3-quarter" style="border: 5px solid blue; height: 100%;">
							<div style="margin-top: 20%; margin-left: 15%; width: 85%; height: 72%; border: 5px solid yellow; padding: 10%;">
								
								<div>
									<div class="w3-half">
										<span style="font-weight: bold;">장소</span>
									</div>
									<div class="w3-half">
										<span>안알려줌</span>
									</div>
								</div>
								
								<div>
									<div class="w3-half">
										<span style="font-weight: bold;">날짜</span>
									</div>
									<div class="w3-half">
										<span>안알려줌</span>
									</div>
								</div>
								
								<div>
									<div class="w3-half">
										<span style="font-weight: bold;">참가자수</span>
									</div>
									<div class="w3-half">
										<span>안알려줌</span>
									</div>
								</div>
								
								<div>
									<div class="w3-half">
										<span style="font-weight: bold;">참가비</span>
									</div>
									<div class="w3-half">
										<span>안알려줌</span>
									</div>
								</div>
								
							</div>
						</div>
					
					</div>
				</div>
				
				
				

			</div>
		</div>
	</div>

</body>
</html>