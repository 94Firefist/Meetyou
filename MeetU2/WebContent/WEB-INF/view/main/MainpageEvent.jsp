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
<title>main</title>
<link rel="stylesheet" href="<%=cp %>/css/GroupList.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=cp %>/css/style.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<%=cp%>/js/jquery-ui.js"></script>

<script type="text/javascript">

	$(document).on("click", ".event", function()
	{
		$(location).attr("href","/whoevent.action?id="+this.id);
	});
	
	$(document).on("click", ".powerList", function()
	{
		$(location).attr("href","/whoevent.action?id="+this.id);
	});
	
	
	
	$(document).ready(function()
	{
		$("#radio-1").attr("checked", "checked");
		$("#searchCheckBoxDiv").css("display", "inline");
		
	});
		
	
</script>

<style type="text/css">

	.mar
	{
		width: 1170px;
		margin: auto;
		padding-top: 20px;
		margin-bottom: 100px;
		overflow: hidden;
	}
	
	
	.disfooter
	{
		padding-top: -60px;
	}
	
	.eventList
	{
		border: 1px solid black;
		width: 500px;
		height: 160px;
		padding: 5px;
	}

	.glyphicon
	{
		position: static;
		line-height: 0;
	}
	
	.event
	{
		cursor: pointer;
	}
	
	
	select 
	{
		width: 150px;
		height: 30px;
		margin-top: 5%;
	}
	
	.powerList:after, .powerList:before, .emptypowerList:after, ..emptypowerList:before
	{
		content:"";
		display:table;
		clear:both
	}
	
	.powerList
	{
		width: 25%;
		float:left;
		cursor: pointer;
	}
	
	.emptypowerList
	{
		width: 25%;
		float:left;
	}
	
	.contentt
	{
		width: 1170px;
		margin: 0 auto;
	}
	
</style>
</head>
<body>


<c:import url="../Menu.jsp"></c:import>

<div class="main_img" style="background-image: url('images/group1.jpg'); width: 100%; height: 500px; background-size: 100%">

</div>


<div class="contentt">
	<div class="disfooter">
		<c:import url="search.jsp"></c:import>
	</div>

	<!-- 파워링크가 없을 때 보여주지 않는다. -->
	<c:if test="${powerSize!=0}">
	
	
	<!-- 파워링크 -->
	<div style="width: 1170px; margin: auto;">
		<div class='span8 main w3-row'
			style="padding: 10px; width: 1170px; background-color: white; overflow: hidden;">
			<div class="w3-row-padding"	style="height: 260px;">
				<div style="height: 12%;">
					<span style="font-weight: bold; color: purple; font-size: 20px;">파워링크</span>
				</div>
				<div style="height: 85%;">
					
					
			
			<c:forEach var="dto" items="${powerList}">
				<div class="powerList" id="${dto.levent_id}" style="height: 100%;">
					<div class="grouplist_itemform" style="background-size: 100% 100%; background-image: url(${dto.eveprofile_url});">
																						
						<div class="grouplist_itemInfoTextForm" style="width: 80%; height: 100%;">
							<div class="grouplist_itemInfoEmpty1"></div>
							<div class="grouplist_itemInfoEmpty2"></div>
							<div class="grouplist_itemInfoSubjectForm">
								<p class="grouplist_itemInfoSubject">${dto.event_name}</p>
							</div>
							<div class="grouplist_itemInfoEmpty3"></div>
							<div class="grouplist_itemInfoTagForm">
								<p class="grouplist_itemInfoTag">${dto.tag}</p>
							</div>
							<div class="grouplist_itemInfoEmpty4"></div>
						</div>
						<div class="grouplist_itemInfoButtonForm">
							<div class="grouplist_itemInfoButtonEmpty1"></div>
							<div class="grouplist_itemInfoButtonEmpty2"></div>
							<div class="grouplist_itemInfoButtonForm">
							</div>
						</div>
					</div>
				</div>
				
				</c:forEach>
				
				<c:if test="${powerSize<4}">
				<c:forEach begin="1" end="${4-powerSize}" >
					<div class="emptypowerList" id="" style="height: 100%;">
					<div class="grouplist_itemform" style="width: 100%; height: 100%; padding: 80px 100px 80px 100px">
					<div style="background-image: url('images/plus_icon.png'); width: 100%; height: 100%; background-size: 100% 100%;">
																						
						<div class="grouplist_itemInfoTextForm" style="width: 80%; height: 100%;">
							<div class="grouplist_itemInfoEmpty1"></div>
							<div class="grouplist_itemInfoEmpty2"></div>
							<div class="grouplist_itemInfoSubjectForm">
								<p class="grouplist_itemInfoSubject"></p>
							</div>
							<div class="grouplist_itemInfoEmpty3"></div>
							<div class="grouplist_itemInfoTagForm">
								<p class="grouplist_itemInfoTag"></p>
							</div>
							<div class="grouplist_itemInfoEmpty4"></div>
						</div>
						<div class="grouplist_itemInfoButtonForm">
							<div class="grouplist_itemInfoButtonEmpty1"></div>
							<div class="grouplist_itemInfoButtonEmpty2"></div>
							<div class="grouplist_itemInfoButtonForm">
							</div>
						</div>
					</div>
					</div>
				</div>
				</c:forEach>
				</c:if>
				
				</div>
			</div>
					
	
		</div>
	</div>
	</c:if>
	
	
	
	
	<div class="mar" style="min-height: 200px;">
		
		<c:choose>
			<c:when test="${size!=0}">
			<c:forEach var="dto" items="${list}">
				<c:if test="${dto.lockcheck.equals('0')}">
				<div class="container event" id="${dto.levent_id}"
				style="width: 700px; height: 120px; border-radius: 8px; margin-bottom: 15px; border: 1px solid #646464; ">
					<div style="width: 100%; padding: 2% 6% 0% 4%;">
						<!-- 이벤트 제목 -->
						<p style="font-size: 20pt; font-weight: bolder;">${dto.event_name}</p>
					</div>
					<div style="width: 100%; padding: 0% 4% 0% 6%; line-height: 100%;">
						<div style="float: left; width: 70%;">
							<!-- 이벤트 장소 -->
							<p style="font-size: 13pt; color: #2478FF; font-weight: bold;">${dto.load_name}</p>
							<p style="font-size: 11pt; color: #2478FF;">${dto.event_place}</p>
						</div>
						<div style="float: right; width: 30%; text-align: right; padding-right: 10px;">
							<!-- 이벤트 장소 -->
							<p style="font-size: 10pt;">${dto.event_date}</p>
							<p style="font-size: 15pt; font-weight: bolder;">
							<span class="glyphicon glyphicon-user"></span>${dto.count}/${dto.event_maxattend}</p>
						</div>
					</div>
				</div>
				</c:if>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<div style="font-size: 20px; color: red; width: 100%; text-align: center;">
					해당하는 이벤트가 없습니다.
				</div>
			</c:otherwise>
		</c:choose>
	</div>

</div>

<div>
	<c:import url="../BottomBar.jsp"></c:import>
</div>

</body>
</html>