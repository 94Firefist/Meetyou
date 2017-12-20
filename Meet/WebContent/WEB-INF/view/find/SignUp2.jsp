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
<link rel="stylesheet" href="<%=cp%>/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="<%=cp%>/css/bootstrap.min.css">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
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
}
</style>

<script type="text/javascript">
//태그 갯수
var count = 0;

// 태그 담은 배열
var tagarr = [];
var su = 5;	// 태그 만들 수 있는 갯수

var imagecnt = 0;

	$(document).ready(function(e)
	{
		$(".img-check").click(function()
		{
			if(imagecnt >= 2)
			{
				alert("더이상 선택하실 수 없습니다.");
				return false;
			}
			$(this).toggleClass("check");
			$(this).before('<img src="images/checked.png" id="'+$(this).attr("id")+'" class="overlay img-responsive"/>');
			imagecnt++;
			return;
		});
		
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
	
	
	$(document).on("click", ".overlay", function()
	{
		$(this).remove();
		$("#"+$(this).attr("id")).toggleClass("check");
		
		imagecnt--;
	});
	
	// 생성된 태그 버튼 클릭시 삭제
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
		// 체크후
		$(obj).submit();
	}
</script>

</head>
<body>
	
	<div class="container">
	
		<div class="form-group">
			<h1>관심분야 선택</h1>
		</div>
		
		<form action="/signupinsert.action" method="post" class="form-horizontal" style="clear: both;">
			<div class="form-group">
				<c:forEach items="${categorylist }" var="item">
					<div class="col-md-3 dpa">
						<label class="btn btn-default disabled form-control">${item.category_content}</label>
						<label>
							<img src="<%=cp %>/${item.category_image}" alt="${item.category_content}" class="img-responsive img-check" id="ch${item.category_code}">
							<input type="checkbox" name="chk" id="chk${item.category_code}" class="hidden" autocomplete="off" value="${item.category_code}">
						</label>
					</div>
				</c:forEach>
			</div>
			
			<div>
				<h3>해시태그 설정</h3>
				<hr>
			</div>
			
			<div class="form-group col-md-9">
				<div class="col-md-4 input-group has-warning has-feedback">
					<label class="input-group-addon">#</label>
					<input type="text"	class="form-control max" id="hashTag" name="hashTag" placeholder="해시태그 입력해주세요." maxlength="10">
					<label class="input-group-addon" id="getTag">ADD</label>				
				</div>
			</div>
				
			
			<div class="form-group col-md-3">
				<label>관심지역</label>
				<select class="form-control" name="category">
					<c:forEach items="${citylist }" var="item">
						<option value="${item.citype_id }">${item.city_name }</option>
					</c:forEach>
				</select>
			</div>	
			
			<div class="col-md-4 tag">
				
			</div>
			
			<div>
				<button type="reset" class="btn btn-default btn-lg pull-right" >취소하기</button>
				<button type="button" onclick="check(this.form)" class="btn btn-primary btn-lg pull-right">회원가입</button>
			</div>
			
			<!-- text 가 한개뿐이라 서브밋되서 만든 것 -->
			<input type="text" style="display: none;">
			
			<!-- 첫번째에서 받아온 값들 -->
			<input type="hidden" name="page" value="${page }">
			<input type="hidden" name="userId" value="${userId }">
			<input type="hidden" name="userPwd" value="${userPwd }">
			<input type="hidden" name="userName" value="${userName }">
			<input type="hidden" name="email" value="${email }">
			<input type="hidden" name="tel" value="${tel }">
			<input type="hidden" name="gender" value="${gender }">
			<input type="hidden" name="birthday" value="${birthday }">
		</form>
		
	</div>
	
</body>
</html>