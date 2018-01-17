<%@ page contentType="text/html; charset=UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	response.setContentType("text/xml");
%><?xml version="1.0" encoding="UTF-8"?>
<list>
	<Ireppro_date>${result.repPro_date}</Ireppro_date>
	<Irep_type>${result.repType_name }</Irep_type>
	<Irep_panalty>${result.panaltyPol_content }</Irep_panalty>
	<reportTest2>${result.panaltyTy_content }</reportTest2>
	<panaltyDay>${result.panaltyDay }</panaltyDay>
</list>
			




			