<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="robots" content="noindex, nofollow">
<link rel="stylesheet" href="<%=cp%>/css/style.css">
<title>나의 그룹리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://jqueryui.com/jquery-wp-content/themes/jqueryui.com/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-
ui.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

<!-- 나눔쏘스 -->
<link rel="stylesheet" href="Nwagon/Nwagon.css" type="text/css">
<script src="Nwagon/Nwagon.js"></script>

<!-- 공개여부 이벤트 발생 스크립트 -->
<script type="text/javascript">

	function openChk(obj)
	{
		
		if(confirm("공개여부를 변경하시겠습니까?"))
		{
			//alert($(obj).attr("class"));
			if( $(obj).attr("class")=="glyphicon glyphicon-eye-close")
			{	
				
				$(location).attr("href", "/personalgroupopen.action?groupid=" + $(obj).attr("id"));
			}
			else
			{
				
				$(location).attr("href", "/personalgroupnoopen.action?groupid=" + $(obj).attr("id"));

			}
		}
	}
	
	
</script>

<!-- 탈퇴여부 이벤트 발생 스크립트 -->
<script type="text/javascript">
	function remove(id)
	{
		if (confirm("정말 해당 클럽에서 탈퇴하시겠습니까?"))
		{
			$(location).attr("href", "/personalgroupout.action?groupid=" + id);

			//this.form().submit;
		}
		;
		return;
	}

	function remove_owner(id)
	{
		alert("본인이 그룹장인 그룹은 탈퇴할 수 없습니다. 그룹 삭제 후 탈퇴가 가능합니다.");
	}
</script>

</head>
<body>
<head>
<title>Twitter Bootstrap Tutorial - A responsive layout tutorial</title>
</head>
<body>

	<!--로그인바  -->
	<div>
		<c:import url="../Menu.jsp"></c:import>
	</div>

	<!-- 상단메뉴 -->
	<div>
		<c:import url="personalPageTopMenu.jsp"></c:import>
	</div>
	<!-- 상단메뉴 end -->

	<div class='container' style="padding: 20px;">

		<!--중간 메뉴들(왼쪽, 메인)  -->
		<div id='content' class='row-fluid'>
			<!-- 왼쪽 메뉴 -->
			<div>
				<c:import url="personalLeftBar.jsp"></c:import>
			</div>
			<!-- 왼쪽 메뉴 끝-->

			<!-- 메인메뉴  -->
			<div class='span8 main'
				style="border: 2px white solid; padding: 20px; width: 945px; background-color: white; margin-left: 15px;">
				<div id="title" style="color: #ef9534;">
					<strong>그룹리스트</strong>
				</div>

				<!--검색기능 
				<div id="custom-search-input" style="padding-right: 20px;">
					<div class="col-md-8"></div>
					<div class="input-group col-md-4">
						<input type="text" class="search-query form-control"
							placeholder="Search" style="height: 33px;" /> <span
							class="input-group-btn">
							<button class="btn btn-danger " type="button">
								<span class=" glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</div>
				검색기능 end -->
				<br>

				<c:choose>
					<c:when test="${(userNumber eq keynumber)}">
						<!-- 그룹공개여부 안내에 따른 기능  -->
						<div id="groupOpenCheck"
							style="text-align: right; font-size: 17px; padding-right: 20px;">
							해당 그룹 공개<span class="glyphicon glyphicon-eye-open"
								aria-hidden="true"></span> 그룹탈퇴<span
								class="glyphicon glyphicon-trash" aria-hidden="true"></span>
						</div>
						<br>
					</c:when>
				</c:choose>

				<div class="row">
					<div id="grouplist form-group">
						<div class="form-group">
							<div class="col-sm-12" style="padding: 0px;">
								<label class="label label-danger">일반 회원인 그룹리스트</label>
							</div>
						</div>

						<c:forEach items="${groupdto}" var="dto">
							<c:choose>
								<c:when	test="${(userNumber eq keynumber) && (dto.mbpublicti_id==5 || dto.mbpublicti_id==1)}">
									<div class="col-sm-3" style="padding: 0px; max-height: 150px;">
										<a href="grouphome.action?lGroup_id=${dto.lgroup_id }"><img
											src="${dto.grprofile_url }"
											style="width: 212px; height: 120px;"></a>
										<div id="grouplistText"
											style="position: relative; left: 10px; top: -50px; color: lime; font-size: 26px;">
											<p style="overflow: hidden; text-overflow: ellipsis; height: 40px; width: 200px;">${dto.group_name}</p>
										</div>
										<!-- 그룹 기능 버튼 -->
										<div id="grouplistFunction"
											style="position: relative; top: -167px; left: 153px; background-color: #f9fafc; width: 60px; height: 31px;">
											<span class="glyphicon glyphicon-eye-${dto.mbpublicti_id==5?'close' : 'open' }" id="${dto.lgroup_id}"
												aria-hidden="true"
												style="font-size: 20px; position: relative; left: 10px; top: 5px;" onclick="openChk(this)"></span>
											<span class="glyphicon glyphicon-trash"
												onclick="remove('${dto.lgroup_id}')" aria-hidden="true"
												style="font-size: 20px; position: relative; left: 10px; top: 5px;"></span>
										</div>
									</div>
								</c:when>
								<c:when	test="${(!(userNumber eq keynumber))&& dto.mbpublicti_id==1}">
									<div class="col-sm-3" style="padding: 0px; max-height: 150px;">
										<a href="grouphome.action?lGroup_id=${dto.lgroup_id }"><img
											src="${dto.grprofile_url }"
											style="width: 212px; height: 120px;"></a>
										<div id="grouplistText"
											style="position: relative; left: 10px; top: -50px; color: lime; font-size: 26px;">
											<p style="overflow: hidden; text-overflow: ellipsis; height: 40px; width: 200px;">${dto.group_name}</p>
										</div>
									</div>
								</c:when>

							</c:choose>

						</c:forEach>

					</div>
				
					<div class="form-group">
						<div class="col-sm-12" style="padding: 0px;">
							<label class="label label-danger">그룹장인 그룹리스트</label>
						</div>
					</div>

					<div id="grouplist_owner form-group">
						<c:forEach items="${groupdto_owner}" var="dto">
							<c:choose>
								<c:when
									test="${(userNumber eq keynumber) && (dto.mbpublicti_id==5 || dto.mbpublicti_id==1)}">
									<div class="col-sm-3" style="padding: 0px; max-height: 150px;">
										<a href="grouphome.action?lGroup_id=${dto.lgroup_id }"><img
											src="${dto.grprofile_url }"
											style="width: 212px; height: 120px;"></a>
										<div id="grouplistText"
											style="position: relative; left: 10px; top: -50px; color: lime; font-size: 26px; ">
											<p style="overflow: hidden; text-overflow: ellipsis; height: 40px; width: 200px;">${dto.group_name}</p>
										</div>
										<!-- 그룹 기능 버튼 -->
										<div id="grouplistFunction"
											style="position: relative; top: -167px; left: 153px; background-color: #f9fafc; width: 60px; height: 31px;">
											<span
												class="glyphicon glyphicon-eye-${dto.mbpublicti_id==5?'close':'open' }" id="${dto.lgroup_id}"
												aria-hidden="true"
												style="font-size: 20px; position: relative; left: 10px; top: 5px;" onclick="openChk(this)"></span>
											<span class="glyphicon glyphicon-trash"
												onclick="remove_owner('${dto.lgroup_id}')" aria-hidden="true"
												style="font-size: 20px; position: relative; left: 10px; top: 5px;"></span>
										</div>
									</div>
								</c:when>
								<c:when
									test="${(!(userNumber eq keynumber))&& dto.mbpublicti_id==1}">
									<div class="col-sm-3" style="padding: 0px; max-height: 150px;">
										<a href="grouphome.action?lGroup_id=${dto.lgroup_id }"><img
											src="${dto.grprofile_url }"
											style="width: 212px; height: 120px;"></a>
										<div id="grouplistText"
											style="position: relative; left: 10px; top: -50px; color: lime; font-size: 26px;">
											<p style="overflow: hidden; text-overflow: ellipsis; height: 40px; width: 200px;">${dto.group_name}</p>
										</div>
									</div>
								</c:when>

							</c:choose>
							

						</c:forEach>
					</div>
				</div>
				<br>
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