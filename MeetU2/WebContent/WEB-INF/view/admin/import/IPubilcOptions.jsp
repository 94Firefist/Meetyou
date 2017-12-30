<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<c:forEach var="option" items="${options}">
	<option value="${option.value}" 
		<c:if test="${optionSel != null}">
			${optionSel == option.value ? "selected" : ""}
		</c:if>
	>
		${option.name}
	</option>
</c:forEach>