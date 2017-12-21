<%@ page contentType="text/html; charset=UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	response.setContentType("text/xml");
%><?xml version="1.0" encoding="UTF-8"?>
<list>
	<Ireppro_date>${result.reppro_date}</Ireppro_date>
	<Irep_type>${result.rep_type }</Irep_type>
	<Irep_panalty>${result.rep_panalty }</Irep_panalty>
	<reportTest2>${result.rep_panaltypol }</reportTest2>
	<panaltyDay>${result.rep_day }</panaltyDay>
</list>
			




			