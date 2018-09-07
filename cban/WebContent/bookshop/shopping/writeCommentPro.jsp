<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "ch14.bookshop.shopping.CommentDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<%
	request.setCharacterEncoding("utf-8");
	String book_id = request.getParameter("ref");
%>

<jsp:useBean id="comment" scope="page" class="ch14.bookshop.shopping.CommentDataBean">
	<jsp:setProperty name="comment" property="*" />
</jsp:useBean>

<%
	comment.setReg_date(new Timestamp(System.currentTimeMillis()));
	CommentDBBean dbPro = CommentDBBean.getInstance();
	dbPro.insertComment(comment);
	
	response.sendRedirect("bookContent.jsp?book_id="+book_id);
%>