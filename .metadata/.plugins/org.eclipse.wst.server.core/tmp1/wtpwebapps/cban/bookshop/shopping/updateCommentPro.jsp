<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "ch14.bookshop.shopping.CommentDBBean" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="comment" scope="page" class="ch14.bookshop.shopping.CommentDataBean">
   <jsp:setProperty name="comment" property="*"/>
</jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int book_id = Integer.parseInt(request.getParameter("book_id"));

	CommentDBBean dbPro = CommentDBBean.getInstance();
    int check = dbPro.updateComment(comment); 

    if(check==1){
%>
<meta http-equiv="Refresh" content="0;url=bookContent.jsp?book_id=<%=book_id%>">
<%}else{%>
    <script>      
		alert("수정을 실패하였습니다.");
		history.go(-1);
   </script>
<%} %>