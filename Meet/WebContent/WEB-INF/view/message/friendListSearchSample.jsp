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

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!--부트스트랩  -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(function()
	{

		$("#friendList").click(function()
		{
			$("#myModal").modal();
		});
		$('#myModal').on('shown.bs.modal', function()
		{
			$('#myInput').focus()
		})

	});

	/* 친구선택하기 버튼을 눌렀을 때 작동되는 스크립트*/
	$(function()
	{
		$(".friendpick").click(function()
		{

			//alert($(this).parent().children("span").text());
			//친구아이디의 벨류값에 span 태그안에 있는 친구 id를 가져와서 넣어준다. 				
			$("#friendId").val($(this).parent().children("#realid").text());
			
			$("#friendKey").val($(this).parent().children("#keynumber").text());
			$("#sendMemberMsg").attr("action", "messageFriendPick.action" );
			$(this.form).submit();

		})
	})
</script>



<style>
* {
	box-sizing: border-box;
}

#myInput {
	background-image: url('images/searchicon1.png');
	background-position: 10px 12px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myUL {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

#myUL li a {
	border: 1px solid #ddd;
	margin-top: -1px; /* Prevent double borders */
	background-color: #f6f6f6;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	color: black;
	display: block
}
#myUL li a:hover:not(.header)
{background-color:#eee;}
</style>

<script>
	function myFunction()
	{
		var input, filter, ul, li, a, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		ul = document.getElementById("myUL");
		li = ul.getElementsByTagName("li");
		for (i = 0; i < li.length; i++)
		{
			a = li[i].getElementsByTagName("a")[0];
			if (a.innerHTML.toUpperCase().indexOf(filter) > -1)
			{
				li[i].style.display = "";
			} else
			{
				li[i].style.display = "none";

			}
		}
	}
</script>

</head>
<body>
	<!-- <form action="messageFriendPick.action" method="get"> -->
		<button type="button" id="friendList" class="btn btn-default btn">친구찾기</button>

	<!-- 선택한 친구의 아이디를 받아놓을 input box  -->
	<input type="hidden" id="friendId" name="friendId">
	
	<!-- 선택한 친구의 키넘버를 받아놓을 input box-->
	<input type="hidden" id="friendKey" name="friendKey">
	
		<!-- Modal -->
		<div class="modal fade bs-example-modal-sm" id="myModal" role="dialog">

			<div class="modal-dialog modal-sm">

				<!-- Modal content-->
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">친구리스트</h4>
					</div>

					<div class="modal-body">
						<input type="text" id="myInput" onkeyup="myFunction()"
							placeholder="검색어를 입력하세요" title="Type in a name">


						


						<ul id="myUL">
							
							<c:forEach items="${msgFriendlist }" var="msgf">
							<li>
								<div id="pPic">
									<img src="${msgf.mbprofile_url}" class="img-circle" alt="Cinque Terre"
										width="70" height="70" style="padding: 5px; float: left;">
								</div>
								<div id="pName">
									<a href="#">${msgf.member_name }(<span id="realid">${msgf.member_realid }</span>)
									<span id="keynumber" style="display:none;">${msgf.lumember_id }</span>
									<br> 
										<button type="button"
											class="btn btn-success btn-xs friendpick">친구선택하기</button>
									</a>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>

				</div>

			</div>

		</div>
		<!-- Modal end -->
	<!-- </form> -->

</body>
</html>