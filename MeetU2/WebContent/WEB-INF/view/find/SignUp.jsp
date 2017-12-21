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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=cp%>/css/font-awesome.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">

	.help-block
	{
		display: none;
		color: red;
	}

</style>

<script type="text/javascript">
var checknum = 'no';
var years;
var monas;
var datas;

	$(document).ready(function()
	{
		var now = new Date();
		years = now.getFullYear();
		monas = now.getMonth()+1;
		datas = now.getDate();

		var monthArr = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
		var day;
		
		for(var i=0; i<11; i++)
		{
			if(i==10)
				$("#birthday").append("<option value='"+(years-10+i)+"' selected>"+(years-10+i)+"</option>");
			else
				$("#birthday").append("<option value='"+(years-10+i)+"'>"+(years-10+i)+"</option>");
		}
		
		for(var i=1; i<=12; i++)
		{
			if(i==monas)
				$("#birthday2").append("<option value='"+i+"' selected>"+i+"</option>");
			else
				$("#birthday2").append("<option value='"+i+"'>"+i+"</option>");
		}
		
		
		
		if(monas != 2)
			day = monthArr[monas-1];
		else
		{
			if((years%4==0 && year%100!=0) || years%400==0)
				day = 29;
			else
				day = 28;
		}
		
		for(var i=1; i<=day; i++)
		{
			if(i==datas)
			{
				$("#birthday3").append("<option value='"+i+"' selected>"+i+"</option>");
				break;
			}
			else
				$("#birthday3").append("<option value='"+i+"'>"+i+"</option>");
		}
		
		$(".radios").checkboxradio({
			icon: false
		});
		
		$("#userId").on("blur", function()
		{
			$("#helpid").html("아이디를 입력해주세요.");
			$("#helpid").attr("style", "display:none");
			
			var pattern = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
			
			if(!pattern.test($("#userId").val()))
			{
				$("#helpid").html("4 ~ 20 자리 영(대, 소), 숫자만 입력가능하며 첫번째 문자는 영문만 가능합니다.");
				$("#helpid").attr("style", "display:inline");
				$("#userId").focus();
				return;
			}
			
			$.post("/idSearch.action", {
				userId:$("#userId").val()
			}, function(data)
			{
				if(data=='fail')
				{
					$("#helpid").html("이미 사용중인 아이디입니다.")
					$("#helpid").attr("style", "display:inline");
					$("#userId").focus();
					return;
				}
				
				
			}, 'text') 
		});
		
		$("#keyNum").on("click", function()
		{
			$.post("/checknum.action", {
				address:$("#userTel").val()
			}, function(data)
			{
				if(data=='fail')
				{
					alert("에러!!!!!");
					return false;
				}
				else
				{
					alert("인증번호를 확인해주세요.");
				}
				checknum = data;
			}, 'text');
		});
		
		$("#numcheck").on("click", function()
		{
			if(checknum=='no')
			{
				alert("인증번호을 받아주세요..")
				return false;
			}
			if($("#userTelnum").val()==checknum)
			{
				alert("인증성공!");
			}
			else
			{
				alert("인증번호를 다시 입력해주세요.");
			}
			
		});
		
		$("#userPwd").on("blur", function()
		{
			$("#pwd").attr("style", "display : none");
			if(!/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/.test($("#userPwd").val()))
			{
				$("#pwd").html("숫자 또는 특수문자와 영문자 조합으로 6~20자리를 사용해야 합니다.");
				$("#pwd").attr("style", "display : inline");
				$("#userPwd").focus();
				return;
			}
		});
		
		$("#userPwd2").on("blur", function()
		{
			$("#pwd2").attr("style", "display : none");
			if($("#userPwd").val() != $("#userPwd2").val())
			{
				$("#pwd2").html("비밀번호가 일치하지 않습니다.");
				$("#pwd2").attr("style", "display : inline");
				$("#userPwd").focus();
				return;
			}
		});
		
	});
	
	$(document).on("change", "#birthday", function()
	{
		var year = $("#birthday").val();
		var month = $("#birthday2").val();
		var monthArr = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
		var day;
		
		if(month != 2)
			day = monthArr[month-1];
		else
		{
			if((year%4==0 && year%100!=0) || year%400==0)
				day = 29;
			else
				day = 28;
		}
		
		$("#birthday").empty();
		
		for(var i=0; i<11; i++)
		{
			if(year-5+i>years)
				break;
			if(year == (year-5+i))
				$("#birthday").append("<option value='"+(year-5+i)+"' selected>"+(year-5+i)+"</option>");
			else
				$("#birthday").append("<option value='"+(year-5+i)+"'>"+(year-5+i)+"</option>");
		}
		
		$("#birthday2").empty();
		for(var i=1; i<=12; i++)
		{
			$("#birthday2").append("<option value='"+i+"'>"+i+"</option>");
			if(year==years && i==monas)
				break;
		}
		
		$("#birthday3").empty();
		for(var i=1; i<=day; i++)
		{
			if(year==years && i==datas)
				break;
			$("#birthday3").append("<option value='"+i+"'>"+i+"</option>");			
		}
		
	});
	
	$(document).on("change", "#birthday2", "#birthday2", function()
	{
		var year = $("#birthday").val();
		var month = $("#birthday2").val();
		var monthArr = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
		var day;
		
		if(month != 2)
			day = monthArr[month-1];
		else
		{
			if((year%4==0 && year%100!=0) || year%400==0)
				day = 29;
			else
				day = 28;
		}
		
		$("#birthday").empty();
		
		for(var i=0; i<11; i++)
		{
			if(year-5+i>years)
				break;
			if(year == (year-5+i))
				$("#birthday").append("<option value='"+(year-5+i)+"' selected>"+(year-5+i)+"</option>");
			else
				$("#birthday").append("<option value='"+(year-5+i)+"'>"+(year-5+i)+"</option>");
		}
		
		$("#birthday2").empty();
		for(var i=1; i<=12; i++)
		{
			if(month==i)
				$("#birthday2").append("<option value='"+i+"' selected>"+i+"</option>");
			else
				$("#birthday2").append("<option value='"+i+"'>"+i+"</option>");
			if(year==years && i==monas)
				break;
		}
		
		$("#birthday3").empty();
		for(var i=1; i<=day; i++)
		{
			$("#birthday3").append("<option value='"+i+"'>"+i+"</option>");
			if(year==years && month==monas && i==datas)
				break;
		}
		
	});
	
	function check()
	{
		$("#helpid").html("아이디를 입력해주세요.");
		$("#helpid").attr("style", "display:none");
		$("#email").attr("style", "display:none")
		$("#brs").attr("style", "display:none")
		$("#name").attr("style", "display:none")
		$("#pwd").attr("style", "display:none");
		$("#pwd2").attr("style", "display:none");
		$("#brs").attr("style", "display:none");
		
		if($.trim($("#userId").val())=="")
		{
			$("#helpid").attr("style", "display:inline");
			$("#userId").focus();
			return false;
		}
		
		if($.trim($("#userPwd").val())=="")
		{
			$("#pwd").html("비밀번호를 입력해주세요.");
			$("#pwd").attr("style", "display:inline");
			$("#userPwd").focus();
			return false;
		}
		
		if($.trim($("#userPwd2").val())=="")
		{
			$("#pwd2").html("비밀번호를 입력해주세요.");
			$("#pwd2").attr("style", "display : inline");
			$("#userPwd2").focus();
			return false;
		}
		
		if($.trim($("#userName").val())=="")
		{
			$("#name").html("이름을 입력해주세요.");
			$("#name").attr("style", "display:inline");
			$("#userName").focus();
			return false;
		}
		
		if(!/^[가-힣]{2,4}$/.test($.trim($("#userName").val())))
		{
			$("#name").html("한글 2~4글자(공백 없음)로 입력해 주세요.")
			$("#name").attr("style", "display:inline");
			$("#userName").focus();
			return false;
		}
		
		if($.trim($("#userEmail").val())=="")
		{
			$("#email").attr("style", "display:inline");
			$("#userEmail").focus();
			return false;
		}
		
		if($.trim($("#birthday3").val())=="")		{
			$("#brs").attr("style", "display:inline");
			return false;
		}
		
		return true;
	}
	
</script>
</head>
<body>
	<div class="container">
		
		<div>
			<a href="/maingroup.action"><img src="../images/meetU.png" class="center-block"/></a>
		</div>
		
        <div class="col-md-6 col-md-offset-3">
        
        <div>
			<hr>
		</div>
        
		<form action="/signup2.action" method="post" role="form" onsubmit="return check()">
		
			<div class="form-group">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
				<span class="help-block" id="helpid">아이디를 입력해주세요.</span>
				<input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호">
				<span class="help-block" id="pwd">비밀번호를 입력해주세요.</span>
				<input type="password" class="form-control" id="userPwd2" name="userPwd2" placeholder="비밀번호 확인">
				<span class="help-block" id="pwd2">비밀번호가 일치하지 않습니다.</span>
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control" id="userName" name="userName" placeholder="이름">
				<span class="help-block" id="name">이름을 입력해주세요.</span>
			</div>
			
			<div class="form-group">
				<div class="col-md-6">
					<label for="radio-1" style="width: 100%;">남자</label>
			    	<input type="radio" value="M" name="gender" id="radio-1" class="radios" checked="checked">
			    </div>
			    
			    <div class="col-md-6">
			    	<label for="radio-2" style="width: 100%;">여자</label>
			    	<input type="radio" value="F" name="gender" id="radio-2" class="radios">
			    </div>
			</div>
			
			<div class="form-group">
				<div class="col-md-4">
					<div class="input-group">
						<span class="input-group-addon">생일</span>
						<select class="form-control" id="birthday" name="birthday" style="width: 100%;">
							
						</select>
	  				</div>
				</div>
				
				<div class="col-md-4">
					<select class="form-control" id="birthday2" name="birthday2" style="width: 100%;">
						
					</select>
				</div>
				
				<div class="col-md-4">
					<select class="form-control" id="birthday3" name="birthday3" style="width: 100%;">
							
					</select>
				</div>
				<span class="help-block" id="brs">생년월일을 입력해주세요.</span>
			</div>
			
			<div class="form-group">
				<input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="이메일" required="required">
				<span class="help-block" id="email">이메일을 입력해주세요.</span>
			</div>
			
			<div class="form-group">
				<div class="input-group">
					<input type="tel" class="form-control" id="userTel" name="userTel" placeholder="전화번호 입력(- 없이 숫자만 입력하세요.)">
					<span class="input-group-btn">
						<button type="button" id="keyNum" class="btn btn-success" >인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
			    	</span>
				</div>
			</div>

			<div class="form-group">
				<div class="input-group">
					<input type="text" class="form-control" id="userTelnum" placeholder="인증번호">
					<span class="input-group-btn">
						<button type="button" id="numcheck" class="btn btn-success">인증번호 입력<i class="fa fa-edit spaceLeft"></i></button>
					</span>
				</div>
			</div>
			
			<div class="form-group text-center">
				<button type="submit" class="btn btn-info">회원가입</button>
				<button type="reset" class="btn btn-warning">가입취소</button>
			</div>
	  
		</form>
         
	</div>

		
	</div>
</body>
</html>