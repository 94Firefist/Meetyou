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
</head>
<body>
	<div class="container" style="width: 200px; height: 150px; border: 1px solid #000000; padding: 2%;">
		<div style="width: 100%; height: 20%; text-align: center; font-size: 20px;">
			<p>앨범 등록하기</p>
		</div>
		
		<div style="width: 100%; height: 40%; text-align: center; font-size: 20px;">
			<select class="form-control" id="removeTags" style="width: 30%;">
				<c:forEach var="tag" items="${tags}">
					<option value="${tag.tag_id}">${tag.tag_name}</option>
				</c:forEach>
			</select>
		</div>
		<div style="width: 100%; height: 40%; text-align: center; font-size: 20px;">
			<button type="button" class="btn btn-success">추가하기</button>
		</div>
	</div>
</body>
</html>