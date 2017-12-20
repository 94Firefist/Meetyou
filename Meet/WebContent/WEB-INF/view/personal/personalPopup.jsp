<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>친구초대하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
</head>
<body>
	<!-- 팝업상자전체 -->	
    <div id="personalPopup" style="width:160px;">
		<!--검색기능  -->
		<div id="custom-search-input">
             <div class="input-group">
                 <input type="text" class="search-query form-control" placeholder="Search" style="height:33px;"/>
                 <span class="input-group-btn">
                     <button class="btn btn-info " type="button">
                         <span class=" glyphicon glyphicon-search"></span>
                     </button>
                 </span>
             </div>
         </div><br>
		<!--검색기능 end -->
		
		<!-- 친구리스트 -->
		<div id="friendlist">
			<div id="pp1">
				<div id="profilePic">
					<img src="images/pp1.jpg" class="img-circle" alt="Cinque Terre" width="70" height="70" style="padding: 5px; float: left;">
				</div>
				
				<div id="profileName">
					<p style="text-align: left; color:#4286f4;;"><strong>이상아</strong></p>
				</div>
				
				<div id="profileButton" style="align-items: center;">
				<button type="button" class="btn btn-success btn-xs">친구초대하기</button>
				</div>
			</div><br>
			<div id="pp2">
				<div id="profilePic">
					<img src="images/pp2.jpg" class="img-circle" alt="Cinque Terre" width="70" height="70" style="padding: 5px; float: left;">
				</div>
				
				<div id="profileName">
					<p style="text-align: left; color:#4286f4;;"><strong>민동기</strong></p>
				</div>
				
				<div id="profileButton" style="align-items: center;">
				<button type="button" class="btn btn-success btn-xs">친구초대하기</button>
				</div>
			</div><br>
			<div id="pp3">
				<div id="profilePic">
					<img src="images/pp3.jpg" class="img-circle" alt="Cinque Terre" width="70" height="70" style="padding: 5px; float: left;">
				</div>
				
				<div id="profileName">
					<p style="text-align: left; color:#4286f4;;"><strong>민동기</strong></p>
				</div>
				
				<div id="profileButton" style="align-items: center;">
				<button type="button" class="btn btn-success btn-xs">친구초대하기</button>
				</div>
			</div><br>
			<div id="pp4">
				<div id="profilePic">
					<img src="images/pp4.jpg" class="img-circle" alt="Cinque Terre" width="70" height="70" style="padding: 5px; float: left;">
				</div>
				
				<div id="profileName">
					<p style="text-align: left; color:#4286f4;;"><strong>김민호</strong></p>
				</div>
				
				<div id="profileButton" style="align-items: center;">
				<button type="button" class="btn btn-success btn-xs">친구초대하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>