<%@ page contentType="text/html; charset=UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	response.setContentType("text/xml");
%><?xml version="1.0" encoding="UTF-8"?>
<list>
	<rep_type>${result.repType_name}</rep_type>
	<rep_content>${result.report_reason }</rep_content>
	<rep_date>${result.report_date }</rep_date>
</list>
