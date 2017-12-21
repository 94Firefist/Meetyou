<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
   response.setContentType("text/xml");

%><?xml version="1.0" encoding="UTF-8"?>
<list>
     <item>
        <zipcode>${title }</zipcode>
        <address>${content }</address>
     </item>
</list>