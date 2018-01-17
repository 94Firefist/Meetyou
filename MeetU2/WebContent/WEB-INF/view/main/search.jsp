<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>


<script type="text/javascript">

//태그 담은 배열
var tagarr = [];

$(document).ready(function(){
	// Object 에 있는 val
	$.fn.maxValueCheck = function(obj, max) {
	    if(parseInt($(obj).val()) > max)
	    {
	    	alert("너무 숫자가 큽니다.(제한 : " + max + ")");
	    	$(obj).val("");
	    }
	}
	
	$.fn.valueCheck = function(obj, div, none, display) {
		if (parseInt($(obj).val()) != none)
		{
			$(div).css("display", "inline");
			return true;
		} else
		{
			$(div).css("display", "none");
			return false;
		}
	}
	
	$.fn.resetDisplay = function(checkbox, div, form) {
		if ($(checkbox).is(":checked"))
		{
			$(div).css("display", "inline");
		} else
		{
			$(div).css("display", "none");
			$(form).each(function()
			{
// 				this.reset();
				return true;
			});
		}
	}
	
	$.fn.minMaxTrade = function(minObj, maxObj, type) {
		
		var min = "";
		var max = "";
		if(type == 1)
		{
			if($(minObj).val().length == 10 && $(maxObj).val().length == 10)
			{
				min = $(minObj).val().substring(0, 4) + $(minObj).val().substring(5, 7) + $(minObj).val().substring(8, 10);
				max = $(maxObj).val().substring(0, 4) + $(maxObj).val().substring(5, 7) + $(maxObj).val().substring(8, 10);
			} else {
				return;
			}
		} else {
			if( !($(minObj).val() == "" || $(maxObj).val() == "") )
			{
				min = $(minObj).val();
				max = $(maxObj).val();
			} else {
				return;
			}
		}
		
		if(min > max)
		{
			var backupMin = $(minObj).val();
			var backupMax = $(maxObj).val();
			
			$(minObj).val(backupMax);
			$(maxObj).val(backupMin);
		}
	}
	
	
	$(".checkbox").checkboxradio({
		icon : false
	});
	$(":radio").checkboxradio({
		icon : false
	});
	
	
	// 이벤트/그룹 선택시
   $(".typeRadio").change(function()
   {
      if( $.fn.valueCheck($(this), "#searchCheckBoxDiv", "0", "1") )
      {
         $(location).attr("href", "/mainevent.action");
      } else {
         $(location).attr("href", "/maingroup.action");
      };
   });
	
	
	
	$("#search").change(function()
	{
		$.fn.resetDisplay("#search", "#searchOptionDiv", 0);
	});
	
	$("#dateOption").change(function()
	{
		$.fn.resetDisplay("#dateOption", "#dateOptionDiv", "#dateForm");
	});
	
	$("#interestOption").change(function()
	{
		$.fn.resetDisplay("#interestOption", "#interestOptionDiv", "#interestForm");
	});
	$("#tagOption").change(function()
	{
		$.fn.resetDisplay("#tagOption", "#tagOptionDiv", "#tagForm");
		$("#tagList").html(""); 
	});
	
	// 데이트피커 부분 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
	$(".datePicker").datepicker({
		showButtonPanel : true,
		dateFormat : "yy/mm/dd"
	});
	
	$(".datePicker").change(function()
	{
		$.fn.minMaxTrade("#dateMin", "#dateMax", 1)
	})
	
	$(".datePicker").blur(function()
	{
		if($(this).val() == "") {
			
		}
		else if($(this).val().length == 8) {
			$(this).val($(this).val().substring(0, 4) + "/" + $(this).val().substring(4, 6) + "/" + $(this).val().substring(6, 8));
		}
		else {
			alert("형식에 맞게 입력하세요. (YYYYMMDD)");
			$(this).val("");
		}
	})
	
	$(".datePicker").focus(function()
	{
		if($(this).val().length == 10)
		{
			$(this).val($(this).val().substring(0, 4) + $(this).val().substring(5, 7) + $(this).val().substring(8, 10)); 
		}
	});
	// 데이트피커 부분 ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ 
	
	
	// Age 부분 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ 
	$("#ageOption").change(function()
	{
		$.fn.resetDisplay("#ageOption", "#ageOptionDiv", "#ageForm");
	});
	
	$(".ageTextGroup").blur(function()
	{
		$.fn.minMaxTrade("#ageMin", "#ageMax", 0)
	});
	
	// Age 부분 ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
	
	
	// Gender 부분 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ 
	$(".genderText").keyup(function()
	{
		$.fn.maxValueCheck($(this), 100);
	})
	
	$("#genderOption").change(function()
	{
		if($.fn.resetDisplay("#genderOption", "#genderOptionDiv", "#genderForm"));
		{
			$("#genderDiv").css("display", "none");
		}
	});
	
	$(".genderRadio").change(function name()
	{
		$.fn.valueCheck(".genderRadio", "#genderDiv", 0, 1);
	})
	// Gender 부분 ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
	
	// money 부분 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
	$("#moneyOption").change(function()
	{
		$.fn.resetDisplay("#moneyOption", "#moneyOptionDiv", "#moneyForm");
	});
	$(".moneyTextGroup").blur(function()
	{
		$.fn.minMaxTrade("#moneyMin", "#moneyMax", 0)
	});
	
	// money 부분 ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

	
	$(".valueText").keydown(function()
	{
		valueBackup = $(this).val();	
	});

	$(".valueText").keyup(function()
		{
			if (!(parseInt($(this).val()) >= 0) && $(this).val() != "" || isNaN($(this).val()))
			{
				$(this).val(valueBackup);
				alert("0 이상의 숫자만 입력하세요.");
			}
			if (!(parseInt($(this).val()) >= 0) && $(this).val() != "" || isNaN($(this).val()))
			{
				$(this).val("");
			}
		});
	
	//  부분 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
// 	$("#tagForm").keyup(function ()
// 	{
// 		$("#tagList").html("");
// 		var tagText = $("#tagTextarea").val();
// 		var tagTextArr = tagText.split(" ");
// 		var tagTextStr = "";
// 		for(var i=0; i<tagTextArr.length-1; i++)
// 		{
// 			for(var j=i+1; j<tagTextArr.length-1; j++)
// 			{
// 				if(tagTextArr[i] == tagTextArr[j])
// 				{
// 					tagTextArr.splice(j, 1);
// 				};
// 			}
// 			if(tagTextArr[i].substring(0, 1).indexOf("#") != -1 && tagTextArr[i].substring(1, tagTextArr[i].length).indexOf("#") && tagTextArr[i] != "#" && tagTextArr[i].length <= 15)
// 			{
// 				tagTextStr += tagTextArr[i] + " ";

// 				$("#tagList").html($("#tagList").html() +"<input type=\"button\" name=\"tags\" class=\"tagItem\" value=\""+ tagTextArr[i] +"\">");
// 			}
// 		}
// 		tagTextStr += tagTextArr[tagTextArr.length-1];
		
// 		$("#tagTextarea").val(tagTextStr);
		
		
// 	});
	
	//  부분 ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
 
	$(".aaa").click(function(){
        $("#searchOptionDiv").toggle();
    });
	
	$(".searchBar").on("keyup", function(event)
	{
		if(event.keyCode == 13)
		{
			submit();
		}
	});
	
	
	// 태그 추가
	$("#tagTextarea").on("keyup", function(event)
	{
		if (event.keyCode == 13)
		{
			var hash = $("#tagTextarea").val(); // input 값 가져오기

			for(var i=0; i<tagarr.length; i++)
			{
				if(tagarr[i]==hash)
				{
					alert('이미 사용중인 태그입니다.');
					$("#tagTextarea").val("");
					$("#tagTextarea").focus();
					return false;
				}
			}
			
// 			var reg = /[^(가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9)]/gi;			  // 한글인지 & 숫자인지 확인 정규식
			/* /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi */ // 특수문자인지 확인 정규식
			/* var str = '<label class="label label-info pa">#'+$("#hashTag").val()+'</label>'; */
			
			if(hash == "" || hash.length>15)
			{
				$("#tagTextarea").val("");
				$("#tagTextarea").focus();
				return false;
			}
			
			var str = '<input type="button" id="abc'+hash+'" value="#'+hash+'" class="tagItem" onclick="remove(this)"/>';
			/* <label class="label label-info pa" onclick="remove(this)">#' + hash + '</label> */
			$("#tagList").append(str);
			
			str = '<input type="hidden" name="tags" id="abc'+hash+'" value="#'+hash+'"/>';
			$("#tagList").append(str);
			
			
			tagarr[tagarr.length] = hash;
			 
			$("#tagTextarea").val("");
			$("#tagTextarea").focus();
			return;
		}
		return false;
	});
			
	$(".cityselect").on("click",function()
	{
		$("#myModal").modal();
	});

	$(".btn-success").on("click", function()
	{
		$(".city").attr("value",this.value);
		submit();
	});
	
});

	//생성된 태그 버튼 클릭시 삭제
	function remove(obj)
	{
				
		$("#"+$(obj).attr("id")).remove();
		$("#"+$(obj).attr("id")).remove();
		
		for(var i=0; i<tagarr.length; i++)
		{
			if(tagarr[i] == $(obj).val().replace("#",""))
				tagarr.splice(i, 1);
		}
	}



// $(document).on("click", ".tagItem" , function()
// {
// 	var a = $("#tagTextarea").val().replace($(this).val() + " ", "");
// 	$(this).remove();
// 	$("#tagTextarea").val(a);
// });	


	function submit()
	{
		var a = $(":radio[name=typeRadio]:checked").val();
		// 1이 이벤트 0이 그룹
		if(a==1)
		{
			$("#searchDetail").attr("action", "mainevent.action");
		}
		else
		{
			$("#searchDetail").attr("action", "maingroup.action");
		}
		
		var form = document.getElementById("searchDetail");
		
		
		form.submit();
		
	}



</script>

<style>
.searchBar {
	width: 100%;
	min-width:300px;
	height: 100%;
	border-radius: 10px;
	padding: 10px;
}

.optionText {
	width: 100%;
}

.option {
	height: 100%;
}

.searchImageButton {
	position: absolute;
	top: 23%;
	left: 24%;
}

.searchOptionSubject {
	width: 100%;
	height: 10%;
}

.typeRadio {
	width: 100%;
	height: 100%;
	font-size: 140%;
	font-weight: bolder;
}

.typeRadioDiv {
	width: 50%;
	height: 100%;
	float: left;
}

.searchOptionTab {
	width: 24.85%;
	height: 100%;
	float: left;
	text-align: center;
}

.searchOptionLine {
	width: 0.15%;
	height: 100%;
	float: left;
	background-color: #D5D5D5;
}

.searchOptionSubjectDiv {
	width: 100%;
	height: 15%;
}

.searchOptionSubject {
	width: 100%;
	height: 100%;
}

.searchOptionValueDiv {
	width: 100%;
	height: 35%;
	padding: 5%;
}

.searchOptionOneValueDiv {
	width: 100%;
	height: 85%;
	padding: 5%;
}

.searchOptionValue {
	width: 100%;
	height: 100%;
}

.datePicker {
	width: 30%;
}

.interestCKDiv {
	width: 33.33%;
	height: 25%;
	float: left;
}

.interestCK {
	height: 80%;
	padding: 2px;
	width: 80px;
}

.searchOptionDisplayDiv {
	display: none;
}

.datePicker
{
	text-align: center;
}

.valueForm
{
	width: 100%;
	height: 100%;
}
#tagList
{
	padding: 3%;
}

.tagItem
{
	margin: 0.1%;
	border: 0px;
	background-color: #86E57F;
	color: #FFFFFF;
	font-weight: bolder;
	border-radius: 10px;
}

input.typeRadio
{
   display: none;
}

.checkbox
{
	display: none;
}

#searchOptionDiv
{
	display: none;
	width: 200px;
	
}

#click
{
	cursor: pointer;
}

</style>
	<form id="searchDetail" action="" name="form" method="get">
	<div id="tabs" style="z-index: 100;">
		<div class="col-md-12" style="height: 75px; width: 1170px; padding: 0">
			<div style="height: 100%; width: 100%; border: 1px solid black; background: #000000;">
				
				<div style="width: 30%; height: 100%; float: left; padding: 13px;">
					<input type="text" class="searchBar" name="keyword">
				</div>
				<div class="searchImageButton">
					<div class="search_icon" id="click" onclick="submit();">
					  <img src="<%=cp%>/images/search.png">
					</div>
				</div>
				
				
				<div style="width: 15%; height: 100%; float: left; padding: 2%;">
					<div id="searchCheckBoxDiv" style="display: none">
						<label class="aaa" for="search">검색옵션</label> 
						<input class="checkbox" type="checkbox" name="search" id="search">
					</div>
				</div>
				
				
				<div style="width: 35%; height: 100%; float: left; padding: 2%; margin: 0 auto; color: white; font-weight: bolder; font-size: 130%;">
					<p>
						현재위치 : 
					
					<c:choose>
					<c:when test="${sessionScope.city!=null}">
						<span class="cityselect">${sessionScope.city}</span>
						<input type="text" class="city 1" hidden="hidden" value="${sessionScope.city}" name="city">
					</c:when>
					<c:otherwise>
						<span class="cityselect">서울특별시</span>
						<input type="text" class="city 2" hidden="hidden" value="서울특별시" name="city">
					</c:otherwise>
					</c:choose>
					
					<span class="glyphicon glyphicon-map-marker"></span>
					</p>
				</div>
				
				<!-- Modal -->
				<div class="modal fade bs-example-modal-sm" id="myModal" role="dialog">
					<div class="modal-dialog modal-sm">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<span style="font-size: 15px;" class="modal-title">검색 지역 수정</span>
							</div>
							<div class="modal-body">
								<!-- 지역리스트 -->
								<div id="citylist">
									<c:forEach var="city" items="${cityList }">
										<button value="${city.city_name }" class="btn-success btn"
										 data-dismiss="modal" style="width: 49%; align-content: center; margin-bottom: 3px;">${city.city_name }</button>
									</c:forEach>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal end -->
				
				
				
				
				<div style="width: 20%; height: 100%; float: left; padding: 1%;">
					<div class="typeRadioDiv">
						<label class="typeRadio" for="radio-1">이벤트</label> <input class="typeRadio"
							type="radio" name="typeRadio" id="radio-1" value="1">
					</div>
					<div class="typeRadioDiv">
						<label class="typeRadio" for="radio-2">그룹</label> <input class="typeRadio"
							type="radio" name="typeRadio" id="radio-2" value="0">
					</div>

				</div>

			</div>
			<div id="searchOptionDiv">
				<div class="panel panel-default">
					<div class="panel-body" style="height: 200px; padding: 0px;">
						<div class="searchOptionTab">
							<div class="searchOptionSubjectDiv">
								
								<label for="genderOption" class="searchOptionSubject">성별</label>
								<input class="checkbox valueText" type="checkbox" name="genderOption"
									id="genderOption">
									
							</div>
							<div class="searchOptionValueDiv">
								<div class="searchOptionDisplayDiv" id="genderOptionDiv">
								<div id="genderForm">
									<label class="gender" for="genderM">남</label> 
									<input class="genderRadio" type="radio" name="gender" id="genderM" value="genderM"> 
									<label class="gender" for="genderF">여</label>
									<input class="genderRadio" type="radio" name="gender" id="genderF" value="genderF">
									<div class="searchOptionDisplayDiv" id="genderDiv">
										<input type="text" class="valueText  genderText" style="width: 10%;" id="genderRate" name="genderRate"><span> % 이상</span>
									</div>
								</div>
								</div>
							</div>
							<div class="searchOptionSubjectDiv">

								<label for="ageOption" class="searchOptionSubject">나이</label> <input
									class="checkbox" type="checkbox" name="ageOption"
									id="ageOption">

							</div>
							<div class="searchOptionValueDiv">
								<div class="searchOptionDisplayDiv" id="ageOptionDiv">
									<div id="ageForm">
										<span>최소</span><input type="text" class="valueText ageTextGroup" style="width: 10%" id="ageMin" name="ageMin"><span> 세</span> ~ 
										<span>최대</span> <input type="text" class="valueText ageTextGroup" style="width: 10%" id="ageMax" name="ageMax"><span> 세</span>
									</div>
								</div>
							</div>
						</div>
						<div class="searchOptionLine"></div>
						<div class="searchOptionTab">
							<div class="searchOptionSubjectDiv">
								<label for="dateOption" class="searchOptionSubject">날짜</label> <input
									class="checkbox" type="checkbox" name="dateOption"
									id="dateOption">

							</div>
							<div class="searchOptionValueDiv">
								<div class="searchOptionDisplayDiv" id="dateOptionDiv">
									<div id="dateForm">
									<input class="datePicker valueText"type="text"
										id="dateMin" name="dateMin"> - <input class="datePicker"
										class="valueText" type="text" id="dateMax" name="dateMax">
									</div>
								</div>
							</div>
							<div class="searchOptionSubjectDiv">

								<label for="moneyOption" class="searchOptionSubject">참가비</label>
								<input class="checkbox" type="checkbox" name="moneyOption"
									id="moneyOption">
							</div>
							<div class="searchOptionValueDiv">
								<div class="searchOptionDisplayDiv" id="moneyOptionDiv">
									<div id="moneyForm">
										<span>최소 ￦</span> <input name="moneyMin" id="moneyMin" type="text" class="valueText moneyTextGroup" style="width: 20%"> ~ 
										<span>최대 ￦</span> <input name="moneyMax" id="moneyMax" type="text" class="valueText moneyTextGroup" style="width: 20%">
									</div>
								</div>
							</div>
						</div>
						<div class="searchOptionLine"></div>
						<div class="searchOptionTab">
							<div class="searchOptionSubjectDiv">
							
								<label for="interestOption" class="searchOptionSubject">관심사</label>
								<input class="checkbox" type="checkbox" name="interestOption"
									id="interestOption">
							</div>
							<div class="searchOptionOneValueDiv">
								<div id="interestForm" class="valueForm">
								<div class="searchOptionDisplayDiv" id="interestOptionDiv">
									<c:forEach var="ca" items="${category}" >
										<div class="interestCKDiv">
											<label for="interestCK${ca.category_code}" class="interestCK">${ca.category_content}</label>
											<input class="checkbox" type="checkbox" name="interestCK"
												id="interestCK${ca.category_code}"  value="${ca.category_code}">
										</div>
									</c:forEach>
								</div>
								</div>
							</div>

						</div>
						<div class="searchOptionLine"></div>
						<div class="searchOptionTab">
							<div class="searchOptionSubjectDiv">
								<label for="tagOption" class="searchOptionSubject">태그</label> <input
									class="checkbox" type="checkbox" name="tagOption"
									id="tagOption">

							</div>
							<div class="searchOptionOneValueDiv">
								<div class="searchOptionDisplayDiv" id="tagOptionDiv">
									<div id="tagForm">
										<textarea style="resize: none; overflow: hidden; white-space: nowrap;" maxlength="15" rows="1" cols="35" id="tagTextarea" placeholder="15자 이내만 가능합니다."></textarea>
									</div>
								</div>
								<div>
									<div id="tagList">
					
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		
	</div>
	</form>