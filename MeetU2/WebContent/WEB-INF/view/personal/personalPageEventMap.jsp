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
<title>GoogleMapTest04.jsp</title>


<!-- API 키 -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAnB0zyJqTidAvsh3yRe4BEMMrvEU_oHNY"></script>

<!-- KH정보 교육원 당산 이레빌딩  -->
<!-- 37.533790, 126.896968 -->

<script type="text/javascript">
	$(document).ready(function()
	{
		$("#myMap").click(function()
		{
			//alert("꾺꾺이");
			
			//모달 활성화
			$("#mapModal").modal("show");
			
			//보여주기
			$("#mapModal").on("shown.bs.modal", function()
			{
				//지도 랜더링
				googleMap();
			});
			
			//감추기
			$("#mapModal").on("hidden.bs.modal", function()
			{
				//지도 비우기(감추기)
				$("#googleMap").empty();
			});
		});
	});
	
	//지도 랜더링 및 마커 찍는 함수 정의
	function googleMap()
	{
		var myCenter = new google.maps.LatLng(37.608780, 127.161155);
		var mapProp = 
		{
				center : myCenter, 
				zoom : 15,
				mapTypeId : google.maps.MapTypeId.ROADMAP,
		};
		
		var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
		
		var marker = new google.maps.Marker(
		{
			position : myCenter, 
		});
		
		marker.setMap(map);
	}

</script>


</head>
<body>

<div class="container"> 


   <p id="eventLocation" style="float: left; font-size: 23px; overflow: hidden; text-overflow: ellipsis; width: 400px;">
               &nbsp;${eventInfo.city_name} <button type="button" id="myMap" class="btn btn-info btn-xs" style="margin:5px;">지도</button></p>

   
      
   
   <!-- Model  -->
   <div class="modal fade" id="mapModal" role="dialog">
      
      <div class="modal-dialog">
         <!-- Modal content -->
         <div class="modal-content">
         
            <div class="modal-header">
               
               <h4 class="modal-title"><input type="text" style="border: none; width: 100%; " value="${eventInfo.city_name}"></h4>
            </div>

            <div class="modal-body">
               <div id="googleMap" style="width: 500px; height: 300px; margin: auto;"></div>
            </div>
            
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

         </div>
      </div>
      
      
   </div>

</div>

</body>
</html>