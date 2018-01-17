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

	$(document).on("click", ".grouplist_main", function()
	{
		$(location).attr("href","/grouphome.action?lGroup_id="+this.id);
	});

	$(document).ready(function()
	{
		$("#radio-2").attr("checked", "checked");
		$("#searchCheckBoxDiv").css("display", "none");
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
	
	.grouplist_main
	{
		cursor: pointer;
	}
	
	.contentt
	{
		width: 1170px;
		margin: 0 auto;
	}
	
	select 
	{
		width: 150px;
		height: 30px;
		margin-top: 5%;
	}

</style>

</head>
<body>


<c:import url="../Menu.jsp"></c:import>


<div class="main_img" style="background-image: url('images/group2.jpg'); width: 100%; height: 500px; background-size: 100%">

</div>



<div class="contentt">
	<div class="disfooter">
		<c:import url="search.jsp"></c:import>
	</div>
	
	
	<div class="mar">
		
	
		<div class="groupList">
		<c:choose>
		<c:when test="${size!=0}">
			<c:forEach var="dto" items="${grouplist}">
				<c:if test="${dto.lockCheck.equals('0')}">
				<div class="grouplist_main" id="${dto.lGroup_id}">
					<div class="grouplist_itemform" style="background-image: url('${dto.grProfile_url}')">
			
						<div class="grouplist_itemInfoTextForm" style="width: 80%; height: 100%;">
							<div class="grouplist_itemInfoEmpty1"></div>
							<div class="grouplist_itemInfoEmpty2"></div>
							<div class="grouplist_itemInfoSubjectForm">
								<p class="grouplist_itemInfoSubject">${dto.group_name}</p>
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
				</c:if>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<div style="font-size: 20px; color: red; width: 100%; text-align: center;">
						해당하는 그룹이 없습니다.
					</div>
				</c:otherwise>
				</c:choose>
		</div>
	</div>
</div>


<div>
	<c:import url="../BottomBar.jsp"></c:import>
</div>

</body>
</html>