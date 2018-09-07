<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%	
	request.setCharacterEncoding("utf-8");
	String title = "책 삭제";
	String managerId ="";
	try{
		managerId = (String)session.getAttribute("managerId");
		if(managerId==null || managerId.equals("")){
	       response.sendRedirect("../logon/managerLoginForm.jsp");
		}else{
	       int book_id = Integer.parseInt(request.getParameter("book_id"));
	       String book_kind = request.getParameter("book_kind");
%>

<jsp:include page="/_inc/header_inc2.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<div class="container">
	<form method="post" name="delForm"  
	   action="bookDeletePro.jsp?book_id=<%= book_id%>&book_kind=<%=book_kind%>" 
	   onsubmit="return deleteSave()"> 
	   
		<div class="card text-center">
			<div class="card-header">책 삭제</div>
			<div class="card-body">
				<a href="../managerMain.jsp"> 관리자 메인으로</a>
			</div>
			<div class="card-body">
				<a href="bookList.jsp?book_kind=<%=book_kind%>">목록으로</a>
			</div>
			<div class="card-footer">
				<input type="submit" class="btn btn-danger btn-sm" value="삭제" >  
			</div>
		</div>
	</form>
</div>

<jsp:include page="/_inc/footer_inc2.jsp" flush="false"/>

<% 
   }
}catch(Exception e){
	e.printStackTrace();
}
%>