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
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=cp%>/css/style.css">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<style type="text/css">
	.check 
	{
		opacity: 0.5;
		color: #996;
	}
	.pa
	{
		margin-right:5px;
		margin-bottom: 5px;
	}
	.overlay
	{
		position: absolute;
		width: 90%;
		height: auto;
		margin: auto;
		z-index: 1;
	}
	.laim
	{
		padding: 0px;
	}
	.dpa
	{
		padding-bottom: 10px;
	}
</style>

<script type="text/javascript">
var count = 0;

	$(document).ready(function(e)
	{
		$(".img-check").click(function()
		{
			if(count>=2)
			{
				alert("관심분야는 2개 까지입니다.")
				return;
			}
			$(this).toggleClass("check");
			$(this).before('<img src="/images/checked.png" id="'+$(this).attr("id")+'" class="overlay img-responsive"/>');
			count++;
			return;
		});
		
		$("#getTag").on("click", function()
		{
			var str = '<input type="button" value="#'+$("#hashTag").val()+'" class="btn btn-primary pa" />';
			$(".tag").append(str);
			$("#hashTag").val("");
			$("#hashTag").focus();
		});
	});
	
	$(document).on("click", ".overlay", function()
	{
		$(this).remove();
		$("#"+$(this).attr("id")).toggleClass("check");
		count--;
		return;
	});
	
	function sub(obj)
	{
		$("#formgo").submit();
	}
</script>

</head>
<body>

	<div class="container">
	
		<form id="formgo" action="/groupinsert.action" class="form-horizontal">
		
		<div class="form-group">
			<h1 class="pull-left">관심분야 선택</h1>
			<h2 class="pull-right"><span onclick="sub()" class="label label-info">>>그룹 만들기</span></h2>
		</div>
		
		<div class="form-group" style="clear: both;">
			<label class="label label-danger"><small>그룹의 관심분야를 선택해주세요.(관심분야 선택은 최대 2개까지 선택이 가능합니다.)</small></label>
		</div>
		
			<div class="form-group">
				
				<c:forEach items="${categorylist }" var="item">
					<div class="col-md-3 dpa">
						<label class="btn btn-default disabled form-control">${item.category_content}</label>
						<label>
							<img src="<%=cp %>/${item.category_image}" alt="${item.category_content}" class="img-responsive img-check" id="ch${item.category_code}">
							<input type="checkbox" name="chk" id="chk${item.category_code}" class="hidden" value="${item.category_code}" autocomplete="off">
						</label>
					</div>
				</c:forEach>
				
			</div>
			<!-- 
			<div class="col-md-12">
				<button type="button" class="btn btn-primary btn-lg">회원가입</button>
				<button type="button" class="btn btn-default btn-lg">취소하기</button>
			</div>
			 -->
			 <!-- 전 페이지에서 넘어온 데이터 -->
			 <input type="hidden" name="groupName" value="${groupName }">
			 <input type="hidden" name="citype" value="${citype }">
			 <input type="hidden" name="pub" value="${pub }">
			 
			 <c:forEach items="${tags }" var="item">
			 	<input type="hidden" name="tags" value="${item }">
			 </c:forEach>
			 
		</form>
	</div>
</body>
</html>