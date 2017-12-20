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
<title>결제</title>

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


</head>
<body>

<div class="container" style="height: 100%;">
	<div class="w3-row" style="height: 100%; width: 100%; margin-bottom: 5%; margin-top: 0;">
		<div style="width: 82%;height: 300px; margin: 10%; padding-left: 10%; padding-right: 10%; margin-bottom: 8%; margin-top: 0%;">
			<img alt="" src="images/1.png" style="width: 100%; height: 100%;">
		</div>

		<div style="margin: 5%; margin-top: 0; height: 150px; text-align: center; background-color: #ff525d; margin-bottom: 0;">
			<div style="border: 2px solid orange; width: 100%; height: 100%;">
			<span style="font-size: 80px; font-weight: bold;">태 그 #</span>
			<p style="font-size: 20px; font-weight: bold; color: white;">※ 이벤트 생성 1회 (최대20개)</p>
			</div>
		</div>
		<div style="border: 2px solid green; margin-left: 5%; width: 90%; height: 200px; text-align: center;">	
			<div class="w3-third" style="border: 2px solid black; height: 100%;">
				<div style="height: 30%; margin: 1%;">
					<span style="font-size: 20px; font-weight: bold; line-height: 60px;">기본료</span>
				</div>
				<div style="height: 30%; margin: 1%;">
					<span style="font-size: 40px;">1 회 1,000 원</span>
				</div>
				<div style="height: 30%; margin: 3%;">
					<button type="button" class="btn btn-info btn-lg">구매하기</button>
				</div>
			</div>
			
			<div class="w3-third" style="border: 2px solid black; height: 100%;">
				<div style="height: 30%; margin: 1%;">
					<span style="font-size: 20px; font-weight: bold; line-height: 60px;">구매시 <span style="font-size: 30px; font-weight: bold;color: red;">10% sale</span></span>
				</div>
				<div style="height: 30%; margin: 1%;">
					<span style="font-size: 40px;">10 회 9,000 원</span>
				</div>
				<div style="height: 30%; margin: 3%;">
					<button type="button" class="btn btn-info btn-lg">구매하기</button>
				</div>
			</div>
			
			<div class="w3-third" style="border: 2px solid black; height: 100%;">
				<div style="height: 30%; margin: 1%;">
					<span style="font-size: 20px; font-weight: bold; line-height: 60px;">구매시 <span style="font-size: 30px; font-weight: bold;color: red;">15% sale</span></span>
				</div>
				<div style="height: 30%; margin: 1%;">
					<span style="font-size: 40px;">20 회 17,000 원</span>
				</div>
				<div style="height: 30%; margin: 3%;">
					<button type="button" class="btn btn-info btn-lg">구매하기</button>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		<div style="margin: 5%; margin-top: 3%; height: 150px; text-align: center; background-color: #05b5e5; margin-bottom: 0;">
			<div style="border: 2px solid orange; width: 100%; height: 100%;">
			<span style="font-size: 80px; font-weight: bold;">파워 링크</span>
			<p style="font-size: 20px; font-weight: bold; color: white;">※ 1일 (00:00 ~ 24:00)</p>
			</div>
		</div>
		<div style="border: 2px solid green; margin-left: 5%; width: 90%; height: 200px; text-align: center;">	
			<div class="" style="border: 2px solid black; height: 100%;">
				
				
				<div style="height: 30%;">
					<span style="font-size: 20px; font-weight: bold; line-height: 60px;">기본료</span>
				</div>
				<div style="height: 30%;">
					<span style="font-size: 40px;">1 일 10,000 원</span>
				</div>
				<div style="height: 30%; margin:1.3%;">
					<button type="button" class="btn btn-info btn-lg">구매하기</button>
				</div>
				
				
			</div>
			
			
		</div>
		

	</div>
</div>

</body>
</html>