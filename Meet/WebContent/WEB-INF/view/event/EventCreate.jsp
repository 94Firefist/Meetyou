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

<!-- JQuery -->
<link rel="stylesheet" href="<%=cp%>/css/jquery-ui.css">
<link rel="stylesheet" href="<%=cp%>/css/styleC.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="<%=cp %>/js/jquery-ui.js"></script>
<script src="<%=cp %>/js/textchange.js"></script> <!-- text 값이 바꾸면 바로 반응 -->
<script src="<%=cp %>/js/jquery-toggleAttr.min.js"></script> <!-- 토글attr -->

<!-- 시계 -->
<link href="<%=cp%>/css/mdtimepicker.css" rel="stylesheet" type="text/css">
<script src="<%=cp%>/js/mdtimepicker.js"></script>

<!-- 부트스트랩  -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- API KEY --><!-- 지오코드 : AIzaSyCOh9gYfNwr-p7ZnBT0iXXPlCm9e-hapX4 -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxrltA8d8aqjrGIjSXGSR9SKILNqqjuZA"></script>

<!-- 게시판 -->
<script type="text/javascript" src="<%=cp%>/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- 지번주소 -->
<script src="<%=cp %>/js/search.min.js"></script>

<!-- AJAX 스크립트 -->
<script type="text/javascript" src="<%=cp%>/js/ajax/ajax.js"></script>

<script type="text/javascript">
// 구글링 맵
var map;
// 구글링 맵 마커
var marker;

// 좌표 전역 변수
var lat;
var lng;

// 태그 갯수
var count = 0;

// 태그 담은 배열
var tagarr = [];
var su = 5;	// 태그 만들 수 있는 갯수

// 파워링크 보유 일
var power = 0;

	$(document).ready(function()
	{
		// 파워링크 보유일 가져오기
		power = Number($(".powerCount").text()); 
		
		/* // 성비 조정
		$("#rangec").on("change", function()
		{
			// 테스트
			//alert($("#rangec").val());
			$("#F").html($("#rangec").val());
			$("#wor").val($("#rangec").val());
			$("#M").html(10-$("#rangec").val());
		}); */
		
		// 태그 추가
		$("#getTag").on("click", function()
		{
			var hash = $("#hashTag").val(); // input 값 가져오기
			
			// 갯수 확인
			if(count>=su)
			{
				// 태그 보유 갯수
				var tagcount = Number($(".tagCount").text());
				
				if(count==20)
				{
					alert("태그는 20개 까지입니다.");
					$("#hashTag").val("");
					$("#hashTag").focus();
					
					return false;
				}
				
				if(tagcount==0)
				{
					alert("기본 제공 태그를 모두 사용하셨습니다.\n추가 사용을 원하시면 태그 아이템을 구매해주세요.");
					$("#hashTag").val("");
					$("#hashTag").focus();
					
					return false;
				}
				else
				{
					$(".tagCount").text((tagcount-1));
					su = 20;
				}
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
			/* /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi */ // 특수문자인지 확인 정규식
			/* var str = '<label class="label label-info pa">#'+$("#hashTag").val()+'</label>'; */
			if(hash == "" || reg.test(hash) || hash.length>15)
			{
				$("#hashTag").val("");
				$("#hashTag").focus();
				return false;
			}
			var str = '<input type="button" value="#'+hash+'" class="btn btn-info btn-sm pa" id="abc'+hash+'" onclick="remove(this)"/>';
			/* <label class="label label-info pa" onclick="remove(this)">#' + hash + '</label> */
			$(".tag").append(str);
			str = '<input type="hidden" name="tags" id="abc'+hash+'" value="#'+hash+'"/>';
			$(".tag").append(str);
			count++;
			tagarr[tagarr.length] = hash;
			 
			$("#hashTag").val("");
			$("#hashTag").focus();
			
		});
			
		$("#hashTag").on("keyup", function(event)
		{
			if (event.keyCode == 13)
			{
				$("#getTag").click();
				return;
			}
			return false;
		});
		/*
		$("#datepicker").datepicker({
		        dateFormat:'yymmdd',
		        monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		        dayNamesMin:['일','월','화','수','목','금','토'],
		        changeMonth:true, // 월변경가능
		        changeYear:true,  // 년변경가능
		        showMonthAfterYear:true // 년 뒤에 월표시
		});
		*/
		
		// 데이터피커
		$( "#datepicker" ).datepicker({
			showOn: "button",
			dateFormat:'yy-mm-dd',
			/* monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],*/
			dayNamesMin:['일','월','화','수','목','금','토'],
			changeMonth:true,
			changeYear:true,
			showMonthAfterYear:true,
			minDate: "Today",
			maxDate: "Today"+180,
			buttonImage: "images/calender.png",
			buttonImageOnly: true,
			buttonText: "Select date"
		});
		
		
		// 지도 그리기
		$("#map").on("click", function()
		{
			//테스트
			//alert("하이");
			
			// 모달 활성화
			$("#myModal").modal("show");
			
			/* 
			// 보여주기
			$("#myModal").on("shown.bs.modal", function()
			{
				// 지도 랜더링
				googleMap(data);
			});
			*/
			
			// 감추기
			/* 
			$("#myModal").on("hidden.bs.modal", function()
			{
				// 지도 비우기(감추기)
				$("#googleMap").empty();
				map = null;
				marker.setMap(null);
				marker = null;
			}); 
			*/
			
		});
		
		// 모달팝업이 켜지면 html,body의 scroll을 hidden시킴 
		$(document).on("shown.bs.modal", function()
		{
			$('html, body').css({'overflow': 'hidden'}); 
			/* $('#element').on('scroll touchmove mousewheel', function(event) // 터치무브와 마우스휠 스크롤 방지
			{ 
				event.preventDefault();
				event.stopPropagation();
				return false; 
			}); */
		});
		
		// 모달해제 시 html,body의 scroll을 visible시킴 
		$(document).on("hidden.bs.modal", function()
		{
			$('html, body').css({'overflow': 'visible'})
		});
		
		// 구글맵 클릭했을 때, 마크업 찍기
		$("#googleMap").on("click", function()
		{
			map.addListener('click', function(e) 
			{	
			    placeMarkerAndPanTo(e.latLng, map);
			});
		});		
		
		// 피커 그리기
		$("#picker").mdtimepicker();
		
		// 지번주소찾기
		$("#postcodify").postcodify({
			/* insertPostcode5 : "#postcode", */
			insertAddress : "#address",
			insertDetails : "#details",
			/* mapLinkProvider : "google", */ // 지도 버튼
			results : "#result",
			afterSelect : maps,
			hideOldAddresses : false
		});
		
		// 주소 넣기
		$("#ok").on("click", function()
		{
			var address = $("#address").val();
			var details = $("#details").val().trim();
			lat = $("#lat").val().trim();
			lng = $("#lng").val().trim();
			
			if(address == "" || details == "" || lat == "" || lng == "")
				return false;
			
			$("#map").val(address + "/" + details);
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

			return false;
		});
		
		// 이미지 클릭했을 때 파일 열기 이벤트
		$("#drags").on("click", function()
		{
			$("#fileone").click();
		});
		
		// 드래그 이미지 넣기
		$('#drags').on({
			dragover : function(event)
			{
				event.preventDefault();
			},
			drop : function(event)
			{
				var files = event.originalEvent.dataTransfer.files;
				var file = files[0];
				var maxSize = 5242880;
				if(file.size > maxSize)
				{
					alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
					return false;
				}

				var	reader = new FileReader();
				
				reader.onload = function (event) 
				{
					$("#drags").attr("width", 230);
					$("#drags").attr("height", 230);
					$("#drags").attr("src", event.target.result);
					$("#dragv").val(event.target.result);
				};
				reader.readAsDataURL(file);
				
				return false;
			}
		});
		
		// ajax 처리시 로딩 처리
		$('#loading').hide();
		
		
		// 게시판-----------------------------------------------------------
		// 전역변수 선언
		var oEditors = [];
		// 프레임 생성
		nhn.husky.EZCreator.createInIFrame(
		{
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "<%=cp%>/SmartEditor2Skin.html",
			htParams :
			{
				// 툴바 사용 여부
				bUseToolbar : true,
				
				// 입력창 크기 조절바 사용 여부
				bUseVerticalResizer : true,
				
				// 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : false,

                fOnBeforeUnload : function()
				{
					//alert("아싸!");
				}
			}, // boolean
			fOnAppLoad : function()
			{
				// 예제 코드
				//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator : "createSEditor2"
		});
		//-------------------------------------------------------------------------------
		
		$("#sub").on("click", function()
		{
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);  // 에디터의 내용이 textarea에 적용됩니다.
			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
			try
			{
				if(check())// 필터링
				{
					$(this.form).submit();
				} 
				else
				{
					return;
				}
			} 
			catch (e)
			{
			}
		});
	});
	
	// 태그 파워링크 구매
	$(document).on("click", ".buy", function()
	{
		alert("구매하시겠습니까?");
		if(confirm("구매한 상품은 휴대폰 소액결제로 구매됩니다."))
		{	
			$.ajax({
				url : "/pay.action",
				type : "POST",
				dataType : "xml",
				data : {paynum:$(this).val()},
				success : function(xml){
				
				var tag = $(xml).find("tag").text();
				var power2 = $(xml).find("power").text();
				
				$(".powerCount").html(power2);
				$(".tagCount").html(tag);
				
				
				power = power2;
				
				alert("구매완료.");
				}/* ,
				error : function(request,status,error) {
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    },
			    complete : function() {
			        alert("complete!");    
			    } */
			});
		}
		else
			alert("구매실패.");
		return;
		
	});
	
	// 시작일 파워링크 데이터피커 유동적인 맥스값 설정
	$(document).on("change", "#datepicker", function()
	{
		// 값 초기화
		$("#powerpicker1").val("");
		$("#powerpicker2").val("");
		
		// 데이터피커 삭제
		$("#powerpicker1").datepicker("destroy");
		$("#powerpicker2").datepicker("destroy");
		
		// 파워링크 보유 갯수 초기화
		$(".powerCount").text(power);
		
		// 파워링크 데이터피커
		$( "#powerpicker1" ).datepicker({
			showOn: "button",
			dateFormat:'yy-mm-dd',
			dayNamesMin:['일','월','화','수','목','금','토'],
			changeMonth:true,
			changeYear:true,
			showMonthAfterYear:true,
			minDate: "Today",
			maxDate: $("#datepicker").val(),
			buttonImage: "images/calender.png",
			buttonImageOnly: true,
			buttonText: "Select date"
		});
		
		
		
	});
	
	// 종료일파워링크 데이터피커 유동적인 맥스값 설정
	$(document).on("change", "#powerpicker1", function()
	{
		// 값 초기화
		$("#powerpicker2").val("");
		
		// 데이터피커 삭제
		$("#powerpicker2").datepicker("destroy");
		
		if(power==0)
		{
			alert("파워링크 보유일이 부족합니다.");
			$("#powerpicker1").val("");
			return;
		}
		
		// 데이터피커 생성
		$("#powerpicker2").datepicker({
			showOn: "button",
			dateFormat:'yy-mm-dd',
			dayNamesMin:['일','월','화','수','목','금','토'],
			changeMonth:true,
			changeYear:true,
			showMonthAfterYear:true,
			minDate: $("#powerpicker1").val(),
			maxDate: $("#datepicker").val(),
			buttonImage: "images/calender.png",
			buttonImageOnly: true,
			buttonText: "Select date"
		});
	});
	
	
	
	// 종료일 입력후 파워링크 보유일 확인 및 필터링
	$(document).on("change", "#powerpicker2", function()
	{
		var picker1 = new Date($("#powerpicker1").datepicker("getDate"));
		var picker2 = new Date($("#powerpicker2").datepicker("getDate"));
		var event = (picker2.getTime()-picker1.getTime()) / 1000 / 60 / 60 / 24 + 1;
		
		if(power<event)
		{
			alert("파워링크 보유일이 부족합니다.");
			$(".powerCount").text(power);
			$("#powerpicker2").val("");
			return;
		}
		
		$(".powerCount").text(power-event);
	})
	
	// 구글 지도 좌표 설정 및 불러오기
	function googleMap(lat, lng)
	{
 		var myCenter = new google.maps.LatLng(Number(lat), Number(lng));
		var mapProp = 
		{
			center : myCenter,
			zoom : 17,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
		};
		
		map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
		
		marker = new google.maps.Marker({
		position: myCenter,
		map: map
		});
		
		marker.setMap(map);
	}
	
	// 구글 지도 클릭시 마크업
	function placeMarkerAndPanTo(latLng, map) 
	{	
		// 이미 마크업이 존재하는지 체크여부 있으면 마크업 삭제
		if(marker!=null)
		{
			marker.setMap(null);
			marker = null;
		}
		
		marker = new google.maps.Marker({
		position: latLng,
		map: map
		});
		$("#lat").val(latLng.lat());
		$("#lng").val(latLng.lng());
		
		marker.setMap(map);
	}
	
	// 생성된 태그 버튼 클릭시 삭제
	function remove(obj)
	{
		if(su==20)
		{
			if(count==6)
			{
				// 태그 보유 갯수
				var tagcount = Number($(".tagCount").text());
				$(".tagCount").text((tagcount+1));
				su=5;
			}
		}
		
		$("#"+$(obj).attr("id")).remove();
		$("#"+$(obj).attr("id")).remove();
		
		count--;
		
		for(var i=0; i<tagarr.length; i++)
		{
			if(tagarr[i] == $(obj).val().replace("#",""))
				tagarr.splice(i, 1);
		}
	}
	
	
	// 콜백함수
	function callBack()
	{
		var doc = ajax.responseXML;
		var root = doc.documentElement;
		
		var latTag = root.getElementsByTagName("lat");
		var lngTag = root.getElementsByTagName("lng");
		
		lat = latTag[0].firstChild.nodeValue;
		lng = lngTag[0].firstChild.nodeValue;
		
		$("#lat").val(lat);
		$("#lng").val(lng);
		
		if(map!=null)
		{
			$("#googleMap").empty();
			map = null;
			marker.setMap(null);
			marker = null;
		}
		
		// 로딩 풀기
		$('#loading').hide();
		
		// 지도 랜더링
		googleMap(lat, lng);
	}
	
	// 지도 뿌려주는 함수
	function maps(selectedEntry)
	{	
		// 검색결과 지우기
		$("#result").empty();
		
		// 로딩
		$('#loading').show();
		
		var address = $("#address").val().replace(/ /gi, "+");
		
		// URL 구성
		var url = "/address.action?address=" + address;
		
		// XMLHTTPRequest 객체 생성
		ajax = createAjax();
		
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			// 테스트
			//alert(ajax.readyState);
			
			if(ajax.readyState == 4)
			{
				if(ajax.status == 200)
				{
					// 콜백함수 호출
					callBack();
				}
			}
		}
		ajax.send("");
	}
	
	// check (필터링)
	function check()
	{
		
		if($.trim($("#eventName").val())=="")
		{
			alert("이벤트명을 입력해주세요.");
			$("#eventName").focus();
			return false;
		}
		
		if($.trim($("#datepicker").val())=="")
		{
			alert("날짜를 입력해주세요.");
			return false;
		}
		
		if($.trim($("#picker").val())=="")
		{
			alert("시간을 입력해주세요.");
			return false;
		}
		
		var dt = new Date();
		var sisi = dt.getHours();
		var qns = dt.getMinutes();
		var ch = dt.getSeconds();
		
		var pic = $("#picker").val().split(" ")
		
		var pic2 = pic[0].split(":");
		if(pic2[0]=="12" && pic[1]=="AM")
			pic2[0]="0";
		if(pic[1]=="PM")
		{
			if(pic2[0]!="12")
				pic2[0] = Number(pic2[0])+12;
		}
		
		var a = dt.getFullYear()+"-"+(dt.getMonth() + 1)+"-"+ dt.getDate()+" "+ sisi+":"+qns;
		var b = $("#datepicker").val()+" "+ pic2[0]+":"+pic2[1];
		
		var myDate = new Date(a);
		var myDate2 = new Date(b);
		
		if(!(myDate.getTime() < myDate2.getTime()))
		{
			alert("이미 지난시간은 이벤트 생성이 불가능합니다.");
			return false;
		}
		
		if($.trim($("#map").val())=="")
		{
			alert("위치를 입력해주세요.");
			return false;
		}
		
		if($.trim($("#minsu").val())=="")
		{
			alert("최소인원을 입력해주세요.");
			$("#minsu").focus();
			return false;
		}
		
		if($.trim($("#maxsu").val())=="")
		{
			alert("최대인원을 입력해주세요.");
			$("#maxsu").focus();
			return false;
		}
		
		if($.trim($("#money").val())=="")
		{
			alert("참가비를 입력해주세요.");
			$("#money").focus();
			return false;
		}
		
		if($.trim($("#content").val())=="" || $.trim($("#content").val())=="<p>&nbsp;</p>")
		{
			alert("소개를 입력해주세요.");
			$("#content").focus();
			return false;
		}
		
		if(!/^[0-9]*$/g.test($.trim($("#money").val())))
		{
			alert("정수만 입력해주세요.");
			$("#money").focus();
			return false;
		}
		
		if(!/^[0-9]*$/g.test($.trim($("#minsu").val())))
		{
			alert("정수만 입력해주세요.");
			$("#minsu").focus();
			return false;
		}
		
		if(!/^[0-9]*$/g.test($.trim($("#maxsu").val())))
		{
			alert("정수만 입력해주세요.");
			$("#maxsu").focus();
			return false;
		}
		
		if(!/^[0-9]*$/g.test($.trim($("#cmax").val())))
		{
			alert("정수만 입력해주세요.");
			$("#cmax").focus();
			return false;
		}
		
		if(!/^[0-9]*$/g.test($.trim($("#min").val())))
		{
			alert("정수만 입력해주세요.");
			$("#min").focus();
			return false;
		}
		
		if(!/^[0-9]*$/g.test($.trim($("#max").val())))
		{
			alert("정수만 입력해주세요.");
			$("#max").focus();
			return false;
		}
		
		return true;
	}
	
	
</script>
<style type="text/css">

	.pa
	{
		margin-right:5px;
		margin-bottom: 5px;
	}
	
	.ui-datepicker-trigger
	{
		float: right;
		padding-top: 5px;
	}
	
	#loading 
	{
		width: 100%;  
		height: 100%;  
		top: 0px;
		left: 0px;
		position: fixed;  
		display: block;  
		opacity: 0.7;  
		background-color: #fff;  
		z-index: 99;  
		text-align: center; 
	} 
  
	#loading-image 
	{  
		position: absolute;  
		top: 50%;  
		left: 50%; 
		z-index: 100; 
	}
</style>
</head>
<body>
	
	<!-- 상단바 -->
	<div class="">
		<c:import url="../Menu.jsp"></c:import>
	</div>
	
	<!-- 컨텐츠 -->
	<div class="container" style="padding-top: 10px;">
		<h1 style="text-align: center; padding-bottom: 20px;">이벤트 만들기</h1>
		<div class="row">
			
			<form action="/event.action" class="form-horizontal" id="form" method="post">
				
				<!-- 왼쪽 컨텐츠 -->
				<div class="col-sm-3 col-md-3">
				
					<h3>상세옵션<br><small>상세옵션은 수정이 불가능합니다.</small></h3><br><br>
					
					<div class="form-group">
						<input type="checkbox" name="chk1" id="chk1" value="1">
						<label for="chk1">참가비</label>
						
						<div class="input-group input-group-sm">
							<label class="input-group-addon">MAX</label>
							<input type="text" id="cmax" name="cmax" value="0" class="form-control">
						</div>
					</div>
					<!-- 
					<div class="form-group">
						<input type="checkbox" name="chk2" id="chk2" value="1">
						<label for="chk2">성비</label>
						
						<div class="progress">
							<label class="col-md-3 col-xs-3" style="padding: 0px;">남자 <span id="M">5</span></label>
							<div class="col-md-6 col-xs-6">
								<input id="rangec" type="range" min="0" max="10" value="5"/>
							</div>
							<label class="col-md-3 col-xs-3" style="padding: 0px;">여자 <span id="F">5</span></label>
							<input type="hidden" name="wor" id="wor">
						</div>
					</div>
					 -->
					<div class="form-group">
						<input type="checkbox" name="chk3" id="chk3" value="1">
						<label for="chk3">연령대</label>
						
						<div class="input-group input-group-sm">
							<label class="input-group-addon">MIN</label>
							<input type="text" id="min" name="min" value="0" class="form-control">
							<label class="input-group-addon">~</label>
							<input type="text" id="max" name="max" value="0" class="form-control">
							<label class="input-group-addon">MAX</label>
						</div>
					</div>
					
					<div class="form-group">
					<label class="label label-info">#태그</label><label style="float: right;">추가태그 보유(<span class="tagCount label label-danger">${tag==null?0:tag }</span> 회권)</label>
						
						<div class="col-md-12 input-group has-warning has-feedback">
							<label class="input-group-addon">#</label>
							<input type="text"	class="form-control max" id="hashTag" name="hashTag" placeholder="해시태그 입력해주세요." maxlength="10">
							<label class="input-group-addon" id="getTag">ADD</label>				
						</div>
			
					</div>
					
					<div class="form-group">
						<div>
							<div class="col-md-12 col-xs-12 tag" style="border: 1px solid gray; height: 150px; OVERFLOW-Y:auto; width:98%;"></div>
						</div>
					</div>
					
					<div class="form-group">
					<label class="label label-info">#파워링크</label><label style="float: right;">파워링크 보유(<span class="powerCount label label-danger">${power==null?0:power }</span> 일)</label>
						<div>
						<label class="col-md-3 col-sx-3 col-sm-3 control-label">시작일</label>
							<div class="col-md-9 col-sx-9 col-sm-9" style="padding-left: 0px;">
								<input type="text" class="form-control" id="powerpicker1" name="powerpicker1" readonly style="width: 80%; float: left;">
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 col-sx-3 col-sm-3 control-label">종료일</label>
						<div class="col-md-9 col-sx-9 col-sm-9" style="padding-left: 0px;">
							<input type="text" class="form-control" id="powerpicker2" name="powerpicker2" readonly style="width: 80%; float: left;">
						</div>
					</div>
					
					<c:import url="money.jsp"></c:import>
					
				</div>
				
				<!-- 오른쪽 컨텐츠 -->
				<div class="col-sm-9 col-md-9 main">
					
					<!-- 오른쪽의 왼쪽 컨텐츠 -->
					<div class="form-goroup col-sm-8">
						
						<div class="form-group">
							<label class="col-sm-3 control-label">이벤트명</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="eventName" name="eventName">
						    </div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">개최주최</label>
							<div class="col-sm-3">
								<select name="groupSel" class="form-control">
									<option value="solo">개인</option>
									<c:if test="${grouplist!=null }">
										<c:forEach items="${grouplist }" var="group">
											<option value="${group.lgroup_id }">${group.group_name }</option>
										</c:forEach>
									</c:if>
									
								</select>
						    </div>
						    <label class="col-sm-3 control-label">공개범위</label>
						    <div class="col-sm-3">
								<select class="form-control" name="mbPublic">
									<c:forEach items="${publiclist }" var="list">
										<option value="${list.public_id }">${list.public_name }</option>
									</c:forEach>
								</select>
						    </div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">카테고리</label>
							<div class="col-sm-9">
								<select class="form-control" name="category">
									<c:forEach items="${categorylist }" var="list">
										<option value="${list.category_code }">${list.category_content }</option>
									</c:forEach>
								</select>
						    </div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">날짜</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="datepicker" name="datepicker" readonly style="width: 85%; float: left;">
						    </div>
						    
						    <div class="col-sm-3">
						    	<input id="picker" name="time" type="text" placeholder="시간" value="" class="form-control">
						    </div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">위치</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="map" name="map" readonly="readonly">
						    </div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">인원</label>
							<div class="col-sm-9">
									<div class="input-group input-group-sm" style="z-index: 1">
										<label class="input-group-addon">MIN</label>
										<input type="text" id="minsu" name="minsu" value="0" class="form-control">
										<label class="input-group-addon">~</label>
										<input type="text" id="maxsu" name="maxsu" value="0" class="form-control">
										<label class="input-group-addon">MAX</label>
									</div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">참가비</label>
							<div class="col-sm-9">
								<div class="input-group input-group-sm" style="z-index: 1">
									<input type="text" class="form-control" id="money" name="money">
									<label class="input-group-addon">원</label>
								</div>
						    </div>
						</div>
						
					</div>
						
					<!-- 오른쪽의 오른쪽 컨텐츠 -->
					<div class="form-goroup col-sm-4">
							<div class="col-sm-12" id="holder" style="height: 340px;">
								<label>이벤트 프로필</label>
								<input type=file name='fileone' id="fileone" style='display: none;'> 
								<img id="drags" alt="drag" src="<%=cp%>/images/drag.png" name="drag" style="width: 230px; height: 230px;">
								<input type="hidden" id="dragv" name="dragv" value="/images/drag.png">
							</div>
					</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">소개</label>
							<div class="col-sm-10">
								<textarea id="content" name="content" rows="15" cols="0" class="form-control" style="width: 100%"></textarea>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-offset-8 col-sm-4">
								<button class="btn btn-default col-sm-6" type="button">이전으로</button>
								<button class="btn btn-primary col-sm-6" id="sub" type="button">등록하기</button>
							</div>
						</div>
					</div>
					
					<input type="hidden" id="lat" name="lat">
					<input type="hidden" id="lng" name="lng">
			</form>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		
		<div class="modal-dialog">
			
			<!-- Modal content -->
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">주소 찾기</h4>
				</div>
				
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
						
							<div>
								<label>주소 검색</label>
								<div id="postcodify" class="form-inline" style="margin: 0;">
									<div id="result"></div>
								</div>
							</div>
							
							<!-- 로딩보여주기 -->
							<div id="loading"><img id="loading-image" src="<%=cp %>/images/loading_map.gif" alt="Loading..." /></div>
							
							<div>
								<input type="text" name="address" id="address" readonly="readonly" class="form-control" placeholder="주소" required="required">
							</div>
							
							<div>
								<input type="text" name="details" id="details" placeholder="상세번호입력" class="form-control" required="required">
							</div>

						</div>
					</div>					
					
					<div id="googleMap" style="width: 500px; height: 300px; margin: 15px auto;"></div>
				</div>
				
				<div class="modal-footer">
					<button type="button" id="ok" class="btn btn-default" data-dismiss="modal">OK</button>
					<button type="button" id="close" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
				
			</div>
			
		</div>
		
	</div>
	
	<!-- 하단바 -->
	<div>
		<c:import url="../BottomBar.jsp"></c:import>
	</div>

</body>
</html>