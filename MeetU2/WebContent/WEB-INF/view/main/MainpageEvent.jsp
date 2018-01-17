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
		display:inline-block;
		width: 1170px;
		margin: auto;
		padding: 2%; 2% 0 2%;
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
		background: #FFFFFF;
		height: 90%;
	}
	
</style>

</head>
<body class="background">
<div class="background" style="background-image: url('images/group1.jpg'); background-size: 100%; opacity: 0.5; position: absolute; z-index: -1;"></div>

<div style="height: 100%;">
	<c:import url="../Menu.jsp"></c:import>
	<div class="contentt">
	
		<div class="disfooter">
			<c:import url="search.jsp"></c:import>
		</div>
	
		<!-- 파워링크가 없을 때 보여주지 않는다. -->
		<c:if test="${powerSize!=0}">
		
		<!-- 파워링크 -->
		<div style="width: 1170px; margin: auto;">
			<div class='span8 main w3-row'
				style="padding: 10px; width: 1170px; height: 100%; background-color: white; overflow: hidden;">
				<div class="w3-row-padding"	style="height: 260px;">
					<div style="height: 12%;">
						<span style="font-weight: bold; color: purple; font-size: 20px;">파워링크</span>
					</div>
					<div style="height: 85%;">
						
						
				
				<c:forEach var="dto" items="${powerList}">
					<div class="powerList" id="${dto.lEvent_id}" style="height: 100%;">
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
		
			<div class="mar">
				
				<c:choose>
					<c:when test="${size!=0}">
					<c:forEach var="dto" items="${list}">
						<div class="container event" id="${dto.lEvent_id}"
							style="width: 50%; height: 220px; margin-bottom: 15px; float: left;">
							<div style="width: 100%; height: 100%; border-radius: 8px; border: 1px solid #646464;">
								<div style="width: 50%; height: 100%; float: left; padding: 2%;">
									<c:choose>
										<c:when test="${dto.eveProfile_url == null || dto.eveProfile_url == ''}">
											<img src="<%=cp%>/images/meetU.png" alt="안녕" style="width: 100%; height: 100%;">
										</c:when>
										<c:otherwise>
											<img src="${dto.eveProfile_url}" alt="안녕" style="width: 100%; height: 100%;">
										</c:otherwise>
									</c:choose>
								</div>
								<div style="width: 50%; height: 100%; float: left; padding: 4% 4% 2% 2%; text-align: right;">
									<div style="width: 100%; height: 100%; text-align: left; padding-right: 10px;">
										<!-- 이벤트 제목 -->
										<div style="width: 100%; height: 50%;">
											<span style="font-size: 20pt; font-weight: bolder;">${dto.event_name}</span>
										</div>
										<!-- 이벤트 장소 -->
										<div style="width: 100%; height: 15%;">
											<span style="font-size: 13pt; color: #2478FF; font-weight: bold;">${dto.load_name}</span>
											<span style="font-size: 11pt; color: #2478FF;">${dto.event_place}</span>
										</div>
											
										<!-- 이벤트 시간 -->
										<div style="width: 100%; height: 15%;">
											<span style="font-size: 10pt;">${dto.event_date}</span>
										</div>
										<!-- 이벤트 참석자/최대인원 -->
										<div style="width: 100%; height: 15%;">
											<span style="font-size: 15pt; font-weight: bolder;">
												<span class="glyphicon glyphicon-user"></span>
												${dto.count}/${dto.event_maxAttend}
											</span>
										</div>
									</div>
								</div>
								
							</div>
						</div>
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
		
	</div>
	
	
	
	
	
	
	<c:import url="../BottomBar.jsp"></c:import>
</div>

</body>
</html>