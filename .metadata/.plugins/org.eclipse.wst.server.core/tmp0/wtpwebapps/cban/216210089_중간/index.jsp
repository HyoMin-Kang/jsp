<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = "Main";
%>

<jsp:include page="/_inc/header_inc.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<jsp:include page="/_inc/navigation.jsp" flush="false"/>
      

<jsp:include page="/_inc/footer_inc.jsp" flush="false"/>