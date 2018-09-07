<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String title = "책 관리";
	String managerId ="";
	try{
		managerId = (String)session.getAttribute("managerId");
			   
		if(managerId==null || managerId.equals("")){
		response.sendRedirect("logon/managerLoginForm.jsp");
	}else{
%>
<jsp:include page="/_inc/header_inc2.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<div class="container">
	  <div class="text-right">
		  <form method="post" action="logon/managerLogout.jsp">
			 <b>관리 작업중.. </b><input type="submit" class="btn btn-outline-secondary btn-sm" value="로그아웃">	
		  </form>
	  </div>
	   
	<div class="card-group">
	  	<div class="card">
	  		<div class="card-header">상품 관련 작업</div>
	  		<div class="card-body">
			    <a href="productProcess/bookRegisterForm.jsp">상품등록</a>
			</div>
			<div class="card-body">
			    <a href="productProcess/bookList.jsp?book_kind=all">상품수정/삭제</a>
			</div>
	  	</div>
	  	
	  	<div class="card">
	  		<div class="card-header">구매된 상품 관련 작업</div>
	  		<div class="card-body">
			    <a href="orderedProduct/orderedList.jsp">전체구매목록 확인</a>
			</div>
	  	</div>
	</div>
</div>

<% 
	   }
    }catch(Exception e){
		e.printStackTrace();
	}
%>

<jsp:include page="/_inc/footer_inc2.jsp" flush="false"/>