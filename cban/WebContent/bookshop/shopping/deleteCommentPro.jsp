<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "ch14.bookshop.shopping.CommentDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	int book_id = Integer.parseInt(request.getParameter("book_id"));
	String id = request.getParameter("id");

	CommentDBBean dbPro = CommentDBBean.getInstance(); 
	int check = dbPro.deleteComment(num, id);
	
	if(check==1){
%>
	<meta http-equiv="Refresh" content="0;url=bookContent.jsp?book_id=<%=book_id%>">
<%}else{%>
    <script>      
		alert("삭제를 실패하였습니다.");
		history.go(-1);
   </script>
<%} %>