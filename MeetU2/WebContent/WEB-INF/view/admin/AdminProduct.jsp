<%@page import="java.util.ArrayList"%>
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
<title>상품</title>

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
.lilist {
	float: left;
	list-style: none;
	margin: 1px;
}

.lilist a {
	display: block;
	width: 150px;
	height: 50px;
	background: gray;
	color: #fff;
	font-size: 15px;
	border-radius: 6px;
	text-align: center;
	padding-top: 10%;
	text-decoration: none;
}

.lilist a:hover {
	background: #000000;
}

.licheck {
	/*position: absolute;*/
	color: #FFFFFF;
}

.licheck:after {
	content: '';
	position: absolute;
	margin-left: 2%;
	border-top: 10px solid #000000;
	border-right: 10px solid transparent;
	border-left: 10px solid transparent;
}

.licheck .acheck {
	background-color: #000000;
}
</style>


<script type="text/javascript">
	
	$(document).ready(function()
	{
		/* $(".btnTagLinkUpdate").click(function()
		{
			//alert( $(".productList").val() );
			alert( $(".productList").html() );

		}); */
		
		$(".btnPaymentUpdate").click(function()
		{
			alert("are you 환불?");
			//alert( $(this).val() );
			
			$("#paymentUpdateForm").attr("action", "paymentupdate.action?paymentId=" + $(this).val());
			
		});
	});
	
	
</script>



</head>
<body>

<c:import url="../Menu.jsp"></c:import>


	<div class="container" style="height: 100%;">

		<div class="w3-row"
			style="height: 100%; width: 100%;">

			<div class="w3-quarter"
				style="border-right: 2px solid gray; margin-top: 10%; text-align: center; font-size: 25px; line-height: 50px; font-weight: bold; padding: 3%;">
				
				<div>
					<a href="/grouplist.action"><span>그룹 관리</span></a>
				</div>
				
				<div>
					<a href="/memberlist.action"><span>회원 관리</span></a>
				</div>
				
				<div>
					<span style="color: orange;">서비스 관리</span>
				</div>
				
				<div>
					<a href="/reportList.action"><span>운영 관리</span></a>
				</div>
				
			</div>

			<div class="w3-threequarter"
				style="margin-top: 3%;">
				<div>
					<div style="margin: 4%; margin-bottom: 3%;">
						<span
							style="padding: 2%; background-color: #000000; margin: 1%; font-size: 20px; border-radius: 6px; color: white;">미츄
							서비스 관리</span>
					</div>

					<ul>
						<li class="lilist"><a href="noticelist.action">공지사항</a></li>
						<li class="lilist"><a href="qnalist.action">문의사항</a></li>
						<li class="lilist"><a href="faqlist.action">FAQ</a></li>
						<li class="lilist licheck"><a class="acheck">구매내역</a></li>
					</ul>

					<div style="height: 100%; margin-top: 9%;">





						<!-- 상품 ////////////////////////////////////////////////////////////////////// -->
						<div
							style="margin: 5%; border: 2px solid black; height: 100%; margin-top: 4.7%;"
							class="w3-container">			
							
										
										
										
						<form action="" class="productList">							
							<!-- 태그 ////////////////////////////////////////////////////////////////////// -->
							<div style="height: 100%; width: 100%; margin-top: 8.5%; display: none;">
								
								<ul>
									<li class="lilist licheck"><a class="acheck" style="margin-left: -28.5%; margin-top: -32.8%;">태그 & 파워링크</a></li>
								</ul>
								
								<div style="border: 2px solid black; height: 100%; margin-top: 6.8%; padding: 2%; margin-bottom: 2%;" class="w3-row">
															
																
									<!-- 상품 리스트 -->
									
									<c:forEach var="product" items="${productList }">
										
										<div class="w3-third" style="height: 100%;">
											<%-- <span>${product.productId }</span> --%>
											<div>
												<input type="text" value="${product.name }" id=""> 이름
												<input type="text" value="${product.content }" id=""> 내용
												<input type="text" value="${product.count }" id=""> 갯수
												<input type="text" value="${product.pay }" id=""> 가격
											</div>
										</div>
										
									</c:forEach>
									
	
									<div class="w3-threequarter" style="float: right; margin-right: 2%;">
										<button type="button" class="btn btn-info btnTagLinkUpdate" style="width: 100px; float: right; margin-top: 3%; display: none;" value="">수정</button>
									</div>
								</div>	
							</div>
						</form>















							<!-- 구매 내역 ////////////////////////////////////////////////////////////////////// -->
							<div style="height: 100%; width: 100%; margin-top: 8.5%;">
								
								<ul>
									<li class="lilist licheck"><a class="acheck" style="margin-left: -28.5%; margin-top: -32.8%;">사용자 구매 내역</a></li>
								</ul>
																
								<div style="border: 2px solid black; height: 100%; margin-top: 6.8%; padding: 2%; margin-bottom: 2%;" class="w3-row">
							<form action="paymentupdate.action" method="get" id="paymentUpdateForm">											
									<dl
										style="text-align: center; background-color: gray; margin-bottom: 4%; vertical-align: bottom;">
										<dt style="float: left; width: 22%; text-overflow: ellipsis;">ID</dt>
										<dt style="float: left; width: 15%; text-overflow: ellipsis;">상품이름</dt>
										<dt style="float: left; width: 8%; text-overflow: ellipsis;">수량</dt>
										<dt style="float: left; width: 10%; text-overflow: ellipsis;">가격</dt>
										<dt style="float: left; width: 26%; text-overflow: ellipsis;">구입일자</dt>
										<dt style="float: left; width: 10%; text-overflow: ellipsis;">환불여부</dt>
										<dt style="float: left; width: 9%; text-overflow: ellipsis;">환불</dt>
									</dl>		
										
											
									<!-- 구매내역 리스트 -->
									<c:forEach var="payment" items="${paymentList }">
										
										<div class="" style="height: 100%;">
											<dl
												style="text-align: center; background-color: gray; margin-bottom: 4%; vertical-align: bottom;">
												<dd style="float: left; width: 22%; height: 33px; padding-top: 0.9%; overflow: hidden; text-overflow: ellipsis;">${payment.userid }</dd>
												<dd style="float: left; width: 15%; height: 33px; padding-top: 0.9%; overflow: hidden; text-overflow: ellipsis;">${payment.name }</dd>
												<dd style="float: left; width: 8%; height: 33px; padding-top: 0.9%; overflow: hidden; text-overflow: ellipsis;">${payment.count }</dd>
												<dd style="float: left; width: 10%; height: 33px; padding-top: 0.9%; overflow: hidden; text-overflow: ellipsis;">${payment.price }</dd>
												<dd style="float: left; width: 26%; height: 33px; padding-top: 0.9%; overflow: hidden; text-overflow: ellipsis;">${payment.paymentdate }</dd>
												<dd style="float: left; width: 10%; height: 33px; padding-top: 0.9%; overflow: hidden; text-overflow: ellipsis;
												color: ${payment.handling == 'Ⅹ' ? 'black' : 'red' }">${payment.handling }</dd>
												<dd style="float: left; width: 9%; text-overflow: ellipsis; height: 33px; padding-top: 0.5%;">
													<button type="submit" style="width: 100%; height: 90%;" class="btnPaymentUpdate btn-xs btn btn-info" value="${payment.payno }" 
												    ${payment.handling == "０" ? "disabled='disabled'" : "" }
												    >환불</button>
												</dd>
											</dl>
	
										</div>
										
									</c:forEach>		
								</form>											
								<!-- 페이징 -->
									<div style="text-align: center; margin-top: 17%;">

										<nav>

											<ul class="pagination pagination-sm">
												
												<c:if test="${startPage > 1 }">
													<li><a href="/paymentlist.action?page=1"><span aria-hidden="true">«</span><span
															class="sr-only">Previous</span></a></li>
												</c:if>
												
												<c:if test="${page > 1 }">
												<li><a href="/paymentlist.action?page=${page-1 }"><span aria-hidden="true">〈</a></li>
												</c:if>
												
												
												<c:forEach var="item" begin="${startPage }" end="${endPage }" step="1">
													<c:choose>
														<c:when test="${item == page }">
															<li class="active"><a href="/paymentlist.action?page=${item }">${item }</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="/paymentlist.action?page=${item }">${item }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
												<c:if test="${page < totalPage }">
												<li><a href="/paymentlist.action?page=${page+1 }">
													<span aria-hidden="true">〉</span>
													<span class="sr-only">Next</span>
												</a></li>
												</c:if>
												
												<c:if test="${endPage < totalPage }">
												<li><a href="/paymentlist.action?page=${totalPage }">
													<span aria-hidden="true">»</span>
													<span class="sr-only">END</span>
												</a></li>
												</c:if>
												
											</ul>
										</nav>
									</div>		
										
															
									<!-- 상품 리스트 -->
									<%-- 
									<c:forEach var="product" items="${productList }">
										
										<div class="w3-third" style="height: 100%;">
											<span>${product.productId }</span>
											<div>
												<input type="text" value="${product.name }" id=""> 이름
												<input type="text" value="${product.content }" id=""> 내용
												<input type="text" value="${product.count }" id=""> 갯수
												<input type="text" value="${product.pay }" id=""> 가격
											</div>
										</div>
										
									</c:forEach>
	
									<div class="w3-threequarter" style="float: right; margin-right: 2%;">
										<button type="button" class="btn btn-info btnTagLinkUpdate" style="width: 100px; float: right; margin-top: 3%;" value="">수정</button>
									</div>
									 --%>
									 
									 
									 
								</div>	
							</div>
						</div>
						<!-- ////////////////////////////////////////////////////////////////////// -->

						<!-- ////////////////////////////////////////////////////////////////////// -->
					</div>


				</div>


			</div>

		</div>

	</div>



<div>
	<c:import url="../BottomBar.jsp"></c:import>
</div>

</body>
</html>






















