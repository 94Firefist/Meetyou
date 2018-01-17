<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<% int i=0; %>
<c:forEach var="groupList" items="${groupLists}">
<div id="reportpros" style=" float: left; width: 100%; height: 40px; border-bottom: 1px solid #EAEAEA; padding: 0.5%;">
	<input id="pastevent<%=i %>" type="hidden" value="${groupList.past_event}">
	<input id="futureevent<%=i %>" type="hidden" value="${groupList.future_event}">
	<input id="eventcurdate<%=i %>" type="hidden" value="${groupList.current_create}">
	<input id="eventholddate<%=i %>" type="hidden" value="${groupList.current_hold}">
	<input id="groupstop<%=i %>" type="hidden" value="${groupList.grStatus_stop}">	
	<div style=" float: left; width: 5%; height: 100%; text-align: right; padding-right: 1%;">${groupList.lGroup_id}</div>
	<div style=" float: left; width: 18%; height: 100%;">
		<button  id="groupname<%=i %>" type="button" onclick="groupInfo(<%=i%>)"
				class="btn btn-link report reportContent"
				style="background-color: white; padding: 0;"
				data-toggle="modal" data-target="#groupInfoModal1"
				value="${groupList.group_name}">${groupList.group_name}</button>
	</div>
	<div id="groupleader<%=i++ %>" style=" float: left; width: 8%; height: 100%;">${groupList.lMember_id}</div>
	<div style=" float: left; width: 7%; height: 100%; text-align: right; padding-right: 2%;">${groupList.group_memberCount}</div>
	<div style=" float: left; width: 13%; height: 100%; text-align: center;">${groupList.group_creDate}</div>
	<div style=" float: left; width: 23%; height: 100%;">
		<c:choose>
			<c:when test="${groupList.group_category!=null}">${groupList.group_category}</c:when>
			<c:otherwise>선택안함</c:otherwise>
		</c:choose>
	</div>
	<div style=" float: left; width: 12%; height: 100%;">
		<c:choose> 
			<c:when test="${groupList.group_citypeName!=null}">${groupList.group_citypeName}</c:when>
			<c:otherwise>선택안함</c:otherwise>
		</c:choose>
	</div>
	<div style=" float: left; width: 13%; height: 100%;">${groupList.public_gr}</div>
	
</div>
</c:forEach>