<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
	String leventid = request.getParameter("eventId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>
<link rel="stylesheet" href="<%=cp %>/css/comment.css">
<script src="<%=cp%>/js/commentform.js"></script>
<script src="<%=cp%>/js/textchange.js"></script>

<script type="text/javascript">

	$(document).on("keyup",".txt_comment", function()
	{
		$(".txt_write").html($('.txt_comment').val().length);
	});

	$(document).ready(function()
	{
		
		/* $(document).change(function()
		{
			$(".txt_comment").on("textchange", function()
			{
				$(".txt_write").html($('.txt_comment').val().length);
			});
		}); */
		
		$(".reviewbtn").on("click", function()
		{	
			$("#reviewspace").html(" ");
			$(".commentspace").html(" ");
			var reviewspace = document.getElementById("reviewspace");
			var eventid = <%=leventid%>;
			createform(reviewspace, eventid, 0);
		});
		
		$(".recommentbtn").on("click", function()
		{
			$("#reviewspace").html(" ");
			$(".commentspace").html(" ");
			var commentid = $(this).attr("id");
			var lev = $(this).attr("lev");
			var seq = $(this).attr("seq");
			var ids = 'a' + commentid;
			var commentspace = document.getElementById(ids);
			createform(commentspace, commentid, 1, lev, seq);
// 			alert(lev);
		});
		
		
	});
	
</script>


</head>
<body>

<div style="border-top: 2px solid gray; width: 100%; margin-top: 10px; margin-bottom: 10px;" >

</div>

<div style="width: 100%; margin: 0 auto;">
	<div class="row">
		<c:if test="${writepower.equals('yes')}">
			<div>
				<span>Review</span>
				<button class="reviewbtn">리뷰쓰기</button>
			</div>
		</c:if>
		
		<div class="comment-box">
		
		<c:forEach var="re" items="${review}">
			<c:choose>
				<%-- 정상 글일 경우 --%>
				<c:when test="${re.lockcheck.equals('0')}">
					<div class="mediaa">
			            <div class="mediaa-left">
			            	<div class="img" style="background-image: url('${re.mbprofile_url}')"></div>
			            </div>
			            <div class="mediaa-body">
			                <div class="mediaa-heading">
				                <div class="writer">${re.member_realid}</div>
				                <div class="writedate">${re.review_date}</div>
			                </div>
			                <div class="b_content">${re.review_content}
			                	<c:if test="${canWrite.equals('yes')}">
			                		<span class="recommentbtn" id="${re.lreview_id}" lev="0" seq="0">답글쓰기</span>
			                	</c:if>
			                </div>
			                <div class="commentspace" id="a${re.lreview_id}"></div>
			            </div>
		        	</div>     
        		</c:when> 
        		
        		<%-- 블럭을 먹었을 경우 --%>
        		<c:otherwise>
        			<div class="mediaa">
			            <div class="mediaa-left">
			            	<div class="img" style="background-image: url('${re.mbprofile_url}')"></div>
			            </div>
			            <div class="mediaa-body">
			                <div class="mediaa-heading">
				                <div class="writer">${re.member_realid}</div>
				                <div class="writedate">${re.review_date}</div>
			                </div>
			                <div class="b_content"><span style="color: red">잠금 처리된 글입니다.</span>
			                	<c:if test="${canWrite.equals('yes')}">
			                		<span class="recommentbtn" id="${re.lreview_id}" lev="0" seq="-1">답글쓰기</span>
			                	</c:if>
			                </div>
			                <div class="commentspace" id="a${re.lreview_id}"></div>
			            </div>
		        	</div>  
        		</c:otherwise>
            </c:choose>  
			
			<c:forEach var="co" items="${comment}">
			
			<%-- 1.해당 코멘트가 지금의 리뷰에 달린것인지 확인 --%>
			<c:if test="${co.lreview_id.equals(re.lreview_id)}">
			
				<div class="mediaa">
				
				<%-- 들여쓰기를 몇번해야 하는지 --%>
	        	<c:forEach begin="0" end="${co.review_lev}" step="1">
	        		<div class="mediaa-left"><div class="img"></div></div>
	        	</c:forEach>
	        	
					<c:choose>
						<%-- 정상 게시글일 경우 --%>
						<c:when test="${co.lockcheck.equals('0')}">
							<div class="mediaa-left">
								<div class="img" style="background-image: url('${co.mbprofile_url}')"></div>
							</div>
							<div class="mediaa-body">
								<div class="mediaa-heading">
									<div class="writer">${co.member_realid }</div>
									<div class="writedate">${co.comment_date}</div>
								</div>
								<div class="b_content">${co.comment_content} 
				                	<c:if test="${canWrite.equals('yes')}">
				                		<span class="recommentbtn" id="${co.lcomment_id}"
				                		 lev="${co.review_lev}" seq="${co.review_seq}">답글쓰기</span>
				                	</c:if>
				                </div>
				                <div class="commentspace" id="a${co.lcomment_id}"></div>
							</div>
						</c:when>
						
						<%-- 블럭을 먹었을 경우 --%>
						<c:otherwise>
							<div class="mediaa-left">
								<div class="img" style="background-image: url('${co.mbprofile_url}')"></div>
							</div>
							<div class="mediaa-body">
								<div class="mediaa-heading">
									<div class="writer">${co.member_realid }</div>
									<div class="writedate">${co.comment_date}</div>
								</div>
								<div class="b_content"><span style="color: red">잠금 처리된 글입니다.</span>
				                	<c:if test="${canWrite.equals('yes')}">
				                		<span class="recommentbtn" id="${co.lcomment_id}"
				                		lev="${co.review_lev}" seq="${co.review_seq}">답글쓰기</span>
				                	</c:if>
				                </div>
				                <div class="commentspace" id="a${co.lcomment_id}"></div>
							</div>
						</c:otherwise>
					</c:choose>
					
				</div>
			</c:if>
			<%-- 1끝 --%>
			
			</c:forEach>
			
		</c:forEach>	
			
		</div>
        
        <div id="reviewspace">
       	 	
        </div>
	</div>
</div>
</body>
</html>