<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="robots" content="noindex, nofollow">

<title>그룹 사진</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<style type="text/css">
/* 요거 요거(<, >) */
body {
   padding-top: 20px;
}
/* 요거 요거(<, >) */

/* 사진 추가 */
.img-upload-btn {
   position: relative;
   overflow: hidden;
   padding-top: 95%;
}

.img-upload-btn input[type=file] {
   position: absolute;
   top: 0;
   right: 0;
   min-width: 100%;
   min-height: 100%;
   font-size: 100px;
   text-align: right;
   filter: alpha(opacity = 0);
   opacity: 0;
   outline: none;
   background: white;
   cursor: inherit;
   display: block;
}

.img-upload-btn i {
   position: absolute;
   height: 16px;
   width: 16px;
   top: 50%;
   left: 50%;
   margin-top: -8px;
   margin-left: -8px;
}

.btn-radio {
   position: relative;
   overflow: hidden;
}

.btn-radio input[type=radio] {
   position: absolute;
   top: 0;
   right: 0;
   min-width: 100%;
   min-height: 100%;
   font-size: 100px;
   text-align: right;
   filter: alpha(opacity = 0);
   opacity: 0;
   outline: none;
   background: white;
   cursor: inherit;
   display: block;
}
/* 사진 추가 */
</style>

<script type="text/javascript">
$(document).ready(function()
{
	$(".pictureBtn").click(function()
	{
		
		$(".item").attr("class", "item");    
	    $("#picture" + $(this).val()).attr("class", "item active")
	});

   /*$("#imgPic").click(function()
   {
      //alert("??");
      
      
      
      // 모달 활성화
      $("#uploadPhotos").modal("show");
      
      
      
       // 보여주기
      $("#myModal").on("shown.bs.modal", function()
      {
         
         // 랜더링
         $('.img-picker').imagePicker({name: 'images'});
      });
      
      // 감추기
      $("#myModal").on("hidden.bs.modal", function()
      {
         // 비우기(감추기)
         $("#picker").empty();
      }); 
      
   });*/
   
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
			$("#dragv").attr("value", event.target.result);
			if(confirm("사진을 추가하시겠습니까?")) {
				$("#uploadForm").submit();
			}
		};
		reader.readAsDataURL(file);
		
		return false;
	});
	
	// 이미지 클릭했을 때 파일 열기 이벤트
	$("#drags").on("click", function()
	{
		$("#fileone").click();
	});
});


	/* 사진 추가 */
(function ( $ ) {
    
    $.fn.imagePicker = function( options ) {
        
        // Define plugin options
        var settings = $.extend({
            // Input name attribute
            name: "",
            // Classes for styling the input
            class: "form-control btn btn-default btn-block",
            // Icon which displays in center of input
            icon: "glyphicon glyphicon-plus"
        }, options );
        
        // Create an input inside each matched element
        return this.each(function() {
            $(this).html(create_btn(this, settings));
        });
 
    };
 
    // Private function for creating the input element
    function create_btn(that, settings) {
        // The input icon element
        var picker_btn_icon = $('<i class="'+settings.icon+'"></i>');
        
        // The actual file input which stays hidden
        var picker_btn_input = $('<input type="file" name="'+settings.name+'" />');
        
        // The actual element displayed
        var picker_btn = $('<div class="'+settings.class+' img-upload-btn"></div>')
            .append(picker_btn_icon)
            .append(picker_btn_input);
            
        // File load listener
        picker_btn_input.change(function() {
            if ($(this).prop('files')[0]) {
                // Use FileReader to get file
                var reader = new FileReader();
                
                // Create a preview once image has loaded
                reader.onload = function(e) {
                    var preview = create_preview(that, e.target.result, settings);
                    $(that).html(preview);
                }
                
                // Load image
                reader.readAsDataURL(picker_btn_input.prop('files')[0]);
            }                
        });

        return picker_btn
    };
    
    // Private function for creating a preview element
    function create_preview(that, src, settings) {
        
            // The preview image
            var picker_preview_image = $('<img src="'+src+'" class="img-responsive img-rounded" />');
            
            // The remove image button
            var picker_preview_remove = $('<button class="btn btn-link"><small>Remove</small></button>');
            
            // The preview element
            var picker_preview = $('<div class="text-center"></div>')
                .append(picker_preview_image)
                .append(picker_preview_remove);

            // Remove image listener
            picker_preview_remove.click(function() {
                var btn = create_btn(that, settings);
                $(that).html(btn);
            });
            
            return picker_preview;
    };
    
}( jQuery ));

</script>

</head>
<body>


   <!--///////////////////////////////////////////////////////////-->

   <!--///////////////////////////////////////////////////////////-->

	<div>
		<c:import url="../Menu.jsp"></c:import>
	</div>



   <!-- 상단메뉴 -->
   <div>
      <c:import url="groupPageTopMenu.jsp"></c:import>
   </div>
   <!-- 상단메뉴 end -->

   <div class='container' style="padding: 20px;">
      <!--중간 메뉴들(왼쪽, 메인)  -->
      <div id='content' class='row-fluid'>

         <!-- 메인메뉴  -->
         <div class='span8 main'
            style="border: 2px white solid; padding: 20px; width: 1130px; background-color: white;">
            <div id="title" style="color: #ef9534; height: 90px;">
            	
               <h3 style="font-weight: bold; color: orange">사진첩</h3>
               <c:if test="${attendId == 1}">
               <div style="width: 100%; text-align: right;">
              	 <form action="groupeventpictureupload.action" method="post" id="uploadForm">
		               	<button id="drags" name="drag" class="btn btn-success" type="button">사진 추가하기</button>
		               	<input type=file name='fileone' id="fileone" style='display: none;'> 
						<input type="hidden" id="dragv" name="dragv">
						<input type="hidden" id="lGroup_id" name="lGroup_id" value="${lGroup_id}">
						<input type="hidden" id="albumId" name="albumId" value="${album.lalbum_id}">
						<input type="hidden" id="eventId" name="eventId" value="${album.levent_id}">
				</form>
               </div>
               </c:if>
              <!--  <button type="button" class="btn btn-info" id="imgPic">사진 추가하기</button> -->
              	
            </div>
			

            <div id="grouplist" class="row" style="padding: 1%;">
				
				<c:forEach var="picture" items="${pictures}">
					<button class="btn btn-link pictureBtn" id="" style="float: left; width: 25%; height: 210px;" value="${picture.lpic_id}">
						<!-- 그룹 이미지 -->
						<img src="${picture.pic_url}" style="width: 261px; height: 200px;"
							data-toggle="modal" data-target=".bs-example-modal-lg">
						<!-- 그룹 이름 -->
						<div id="grouplistText"
							style="position: relative; left: 10px; top: -70px; color: lime; font-size: 15px; font-weight: 900;">
						</div>
					</button>
				</c:forEach>

            </div>
			<div class="modal fade bs-example-modal-lg" tabindex="-1"
               role="dialog" aria-labelledby="myLargeModalLabel"
               aria-hidden="true">
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                     <div id="carousel-example-generic" class="carousel slide"
                        data-ride="carousel">



                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                           <c:forEach var="picture" items="${pictures}">
	                           <div class="item" id="picture${picture.lpic_id}">
	                              <img class="img-responsive" style="width: 100%; height: 600px;" src="${picture.pic_url}" alt="...">
	                              <div class="carousel-caption">
	                              	<p>${picture.pic_credate} ${picture.member_name}</p>
	                              </div>
	                           </div>
                           </c:forEach>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control"
                           href="#carousel-example-generic" role="button"
                           data-slide="prev"> <span
                           class="glyphicon glyphicon-chevron-left"></span>
                        </a> <a class="right carousel-control"
                           href="#carousel-example-generic" role="button"
                           data-slide="next"> <span
                           class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                     </div>
                  </div>
               </div>
            </div>

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