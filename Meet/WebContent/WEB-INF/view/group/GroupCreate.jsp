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

.pa
	{
		margin-right:5px;
		margin-top: 5px;
	}

</style>
</head>
<script type="text/javascript">
//태그 갯수
var count = 0;

// 태그 담은 배열
var tagarr = [];

	$(document).ready(function()
	{
		// 태그 추가
		$("#getTag").on("click", function()
		{
			var hash = $("#hashTag").val(); // input 값 가져오기
			
			// 갯수 확인
			if(count>=5)
			{
				alert("태그는 5개 까지입니다.");
				$("#hashTag").val("");
				$("#hashTag").focus();
				
				return false;
			}
			
			for(var i=0; i<tagarr.length; i++)
			{
				if(tagarr[i]==hash)
				{
					alert('이미 사용중인 태그입니다.');
					$("#hashTag").val("");
					$("#hashTag").focus();
					return false;
				}
			}
			
			var reg = /[^(가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9)]/gi;			  // 한글인지 & 숫자인지 확인 정규식
			
			if(hash == "" || reg.test(hash) || hash.length>15)
			{
				$("#hashTag").val("");
				$("#hashTag").focus();
				return false;
			}
			var str = '<input type="button" value="#'+hash+'" class="btn btn-info btn-sm pa" id="abc'+hash+'" onclick="remove(this)"/>';
			
			$(".tag").append(str);
			str = '<input type="hidden" name="tags" id="abc'+hash+'" value="#'+hash+'"/>';
			$(".tag").append(str);
			count++;
			tagarr[tagarr.length] = hash;
			 
			$("#hashTag").val("");
			$("#hashTag").focus();
			
			return false;
			
		});
		
		
		$("#hashTag").on("keyup", function(event)
		{
			if (event.keyCode == 13)
			{
				$("#getTag").click();
				return false;
			}
			return false;
		});
	});

	
	function remove(obj)
	{
		$("#"+$(obj).attr("id")).remove();
		$("#"+$(obj).attr("id")).remove();
		
		count--;
		
		for(var i=0; i<tagarr.length; i++)
		{
			if(tagarr[i] == $(obj).val().replace("#",""))
				tagarr.splice(i, 1);
		}
	}
	
	function check(obj)
	{
		if($.trim($("#groupName").val())=="")
		{
			alert("그룹명을 입력해주세요.");
			$("#groupName").focus();
			return false;
		}
		
		$(obj).submit();
	}
</script>
<body>

	<div id="Menu">
		<c:import url="../Menu.jsp"></c:import>
	</div>

	<div style="text-align: center;">
		<h1>그룹만들기</h1>
		<br>
	</div>		
	<form action="/groupform2.action" method="post" class="form-horizontal col-xs-offset-2 col-md-offset-4">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">그룹 이름(*)</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="groupName" name="groupName"
					placeholder="내용을 입력해주세요." style="width: 300px;">
			</div>
		</div>
		<div class="form-group">
			<label for="groupLocal" class="col-sm-2 control-label">관심 지역(*)</label>
			<div class="col-sm-10">
				<select class="form-control" name="citype" style="width: 300px;">
					<c:forEach items="${citylist }" var="item">
						<option value="${item.citype_id }">${item.city_name }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">#태그</label>
			<div class="col-sm-10 input-group input-group-sm has-warning has-feedback" style="padding-left: 15px;">
				<label class="input-group-addon">#</label>
				<input type="text" id="hashTag" name="hashTag" class="form-control" style="width: 240px;" maxlength="15">
				<button type="button" class="btn btn-default btn-sm" id="getTag">add</button>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-4 tag">
			
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">공개범위(*)</label>
			<div class="checkbox col-sm-10">
				<label>
					<input name="pub" value="1" type="checkbox" checked data-toggle="toggle">
					전체공개
				</label>
			</div>

		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="button" class="btn btn-primary" onclick="check(this.form);">계속하기</button>
			</div>
		</div>
		
	</form>
	
	<div id="Bottom">
		<c:import url="../BottomBar.jsp"></c:import>
	</div>
</body>
</html>