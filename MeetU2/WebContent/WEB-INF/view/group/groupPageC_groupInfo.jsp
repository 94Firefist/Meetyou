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
<title>그룹회원</title>



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
.gLeft>li {
	color: gray;
	font-size: 20px;
	font-family: fantasy;
	font-weight: bold;
	line-height: 2;
	
	
}

div.content{
	padding-bottom: 15px;
	margin-bottom: 15px;
	border-bottom: 1px solid #D5D5D5;
}

.gLeftS {
	color: blue;
}
</style>

<!--  -->
<script type="text/javascript">

function remove(obj)
{
	$(obj).remove();
}

</script>


<script type="text/javascript">
	$(document).ready(function(){
		var count = 0;
		
		$("#removeCategoryBtn").click(function()
		{
			if(confirm("정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "/groupremovecategory.action?groupId=${groupId}&targetId=" + $("#removeCategorys").val());
			}
		});
		
		$("#removeTagBtn").click(function()
		{
			if(confirm("정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "/groupremovetag.action?groupId=${groupId}&targetId=" + $("#removeTags").val());
			}
		});
		
		$("#addCategoryBtn").click(function()
		{
			if(confirm("추가하시겠습니까?"))
			{
				$(location).attr("href", "/groupaddcategory.action?groupId=${groupId}&targetId=" + $("#addCategorys").val());
			}
		});
		
		$("#grprofile").click(function()
		{
			$(this.form).attr("action", "/groupprofile.action");
			$(this.form).submit();
		});
		
		$("#addTagBtn").click(function()
		{
			if(confirm("추가하시겠습니까?"))
			{
				$(location).attr("href", "/groupaddtag.action?groupId=${groupId}&targetId=" + $("#addTag").val());
			}
		});
		$("#groupInfoBtn").click(function()
		{
			if(confirm("수정하시겠습니까?"))
			{
				$(location).attr("href", "/groupupdateinfo.action?groupId=${groupId}&targetId=" + $("#groupInfo").val());
			}
		});
		$("#groupSubjectBtn").click(function()
		{
			if(confirm("수정하시겠습니까?"))
			{
				$(location).attr("href", "/groupupdatesubject.action?groupId=${groupId}&targetId=" + $("#groupSubject").val());
			}
		});
		
		
		// 이미지 드롭
		$("#fileone").on("change", function()
		{
			var file = $("#fileone")[0].files[0];
			var maxSize = 5242880;
			if(file.size > maxSize)
			{
	             alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
	              return false;
			}
			var	reader = new FileReader();
			
			reader.onload = function (event) 
			{
				/* var img = new Image();
				img.src = event.target.result;
				
				img.width = 230;
				img.height = 230;
				
				holder.innerHTML = '';
				holder.appendChild(img); */
				$("#drags").attr("width", 230);
				$("#drags").attr("height", 230);
				$("#drags").attr("src", event.target.result);
				$("#dragv").attr("value", event.target.result);
			};
			reader.readAsDataURL(file);
			$("#grprofile").css("display", "inline");
			return false;
		});
		
		// 이미지 클릭했을 때 파일 열기 이벤트
		$("#drags").on("click", function()
		{
			$("#fileone").click();
		});
	});
</script>



</head>
<body>
<c:import url="../Menu.jsp"></c:import>
	<!-- 상단메뉴 -->
	<div>
		<c:import url="groupPageTopMenu.jsp"></c:import>
	</div>
	<!-- 상단메뉴 end -->
	<div class='container' style="padding: 20px;">
		<div id='content' class='row-fluid'>
			<!-- 메인 메뉴 -->
			<div class='span8 main w3-row'
				style="border: 2px white solid; padding: 20px; width: 1130px; background-color: white;">

				<div class="w3-quarter"
					style="border-right: 2px solid #ccc; width: 20%; height: 500px; text-align: center;">
					<ul class="gLeft">
						<c:if test="${groupPower == 1}">
		                	<li><a href="/groupInfo.action?groupId=${groupId}">그룹 정보 수정</a></li>
		                </c:if>
						<li><a href="/groupmemberInfo.action?groupId=${groupId}">멤버 관리</a></li>
						<li><a href="/groupsingupInfo.action?groupId=${groupId}">가입승인</a></li>
						<li><a href="/groupblackListInfo.action?groupId=${groupId}">블랙리스트 관리</a></li>
						<c:if test="${groupPower == 1}">
							<li><a href="/groupopenInfo.action?groupId=${groupId}">공개 범위 설정</a></li>
						</c:if>
					</ul>
				</div>

				<div class="w3-threequarter w3-container">
					<div class="w3-row content">
						<!-- 그룹명 -->
						<h4 style="font-weight: bold;">그룹명 수정</h4>

						<div class="input-group" style="width: 100%;  padding: 1%;">
	
							<input id="groupSubject" class="form-control" type="text" style="width: 30%;">
								
							<button class="btn btn-primary" id="groupSubjectBtn">변경</button>
						</div>
					</div>
					
					
					
					<h4 style="font-weight: bold; float: left;">그룹 소개 수정</h4> 
					<button type="button" class="btn btn-success" style=" float: right;" id="groupInfoBtn">수정하기</button>
					<div class="content" style="padding: 1%;">
						

						<!-- 내용 -->
						<div style="text-align: center;">
							<textarea class="form-control" id="groupInfo" style="min-width: 100%; max-width: 100%; resize: none;" rows="10" cols="100" placeholder="그룹을 소개할 내용"></textarea>
						</div>
					</div>
					
					
					<div class="content" class="w3-row">
						<!-- 태그 -->
						<h4 style="font-weight: bold;">태그 관리</h4>
						<c:if test="${tagCount == 5}">
							<span style="color: red;">(태그는 5개를 넘을 수 없습니다.)</span>
						</c:if>
						<c:if test="${tagCount != 0}">
							<div class="input-group" style="width: 100%;  padding: 1%;">
								
								<select class="form-control" id="removeTags" style="width: 30%;">
									<c:forEach var="tag" items="${tags}">
										<option value="${tag.tag_id}">${tag.tag_name}</option>
									</c:forEach>
								</select>
								
								<button class="btn btn-danger" id="removeTagBtn">삭제</button>
										
							</div>
						</c:if>
						<c:if test="${tagCount != 5}">
							<div class="input-group" style="width: 100%;  padding: 1%;">
	
								<input id="addTag" class="form-control" type="text" style="width: 30%;">
								
								<button class="btn btn-primary" id="addTagBtn">추가</button>
							</div>
						</c:if>
					</div>
					
					<div class="content" class="w3-row">
						<!-- 태그 -->
						<h4 style="font-weight: bold;">카테고리 관리</h4>
						<c:if test="${categoryCount == 2}">
						<span style="color: red;">(카테고리는 2개를 넘을 수 없습니다.)</span>
						</c:if>
						<c:if test="${categoryCount != 0}">
						<div class="input-group" style="width: 100%;  padding: 1%;">
							
							<select class="form-control" id="removeCategorys" style="width: 30%;">
								<c:forEach var="category" items="${categorys}">
									<option value="${category.category_code}">${category.category_content}</option>
								</c:forEach>
							</select>
							
							<button class="btn btn-danger" id="removeCategoryBtn">삭제</button>
									
						</div>
						</c:if>
						<c:if test="${categoryCount != 2}">
							<div class="input-group" style="width: 100%;  padding: 1%;">

								<select class="form-control" id="addCategorys" style="width: 30%;">
									<c:forEach var="category" items="${usableCategorys}">
										<option value="${category.category_code}">${category.category_content}</option>
									</c:forEach>
								</select>
								
								<button class="btn btn-primary" id="addCategoryBtn">추가</button>
									
							</div>
						</c:if>
						
					</div>
					
					<div class="w3-row content">
						<!-- 그룹명 -->
						<form action="" method="POST">
							<div style="width: 100%; height: 200px;">
								<div>
									<h4 style="font-weight: bold; float: left;">그룹대표사진 수정</h4>
								</div>
								<div class="" style="width: 100%; float: left; padding: 2%; text-align: center;">
			
									<input type=file name='fileone' id="fileone" style='display: none;'> 
									<p>수정하시려면 사진을 클릭하세요.</p>
									<img id="drags" alt="drag" src="${groupInfo.group_imageUrl}" name="drag" style="width: 50%; height: 300px;" title="">
									<input type="hidden" id="dragv" name="dragv" value="/images/drag.png">
									<input type="hidden" name="groupId" value="${groupId }">
									
								</div>
								
							</div>
							<div style="width: 100%; text-align: center;">
								<button style="display:none;" class="btn btn-success" id="grprofile">이미지 변경하기</button>
							</div>
						</form>
					</div>

					<c:if test="${groupPower == 1}">
						<div class="w3-row content">
							<h4 style="font-weight: bold;">그룹삭제</h4>
							<div id="">
								<div id="" class="">
									<c:choose>
										<c:when test="${groupInfo.group_memberCount == 1}">
											<button type="button" class="btn btn-danger">그룹 삭제</button>
										</c:when>
										<c:otherwise>
											<div class="alert alert-danger" role="alert">그룹 삭제는 멤버가 없어야 가능합니다!</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<hr>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>




	<!--하단바  -->
	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
	<!--하단바 끝-->
</body>
</html>